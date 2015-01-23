-module(whale).

-export([
  partials/2
  ,authenticate/2
  ,guests/4
]).

-export([
  json_reply/3
  ,error_reply/5
  ,reply/2
]).

-include("whale.hrl").
-include("pgsql.hrl").

%% ----------------------------------------------------------------------------
%% ----------------------------------------------------------------------------
%% ----------------------------------------------------------------------------

partials({Sid,CbId},Data) ->
  Type = whale_utls:get_value(<<"type">>,Data,undefined),
  TemplateName = binary_to_list(Type) ++ ".tpl",
  PrivDir = whale_utls:priv_dir(),
  {ok,Template} = file:read_file(PrivDir ++ "/app/partials/" ++ TemplateName),
  io:fwrite("PARTIALS: ~p~n",[Data]),
  Json = json_reply(
    {CbId,<<"partials">>}
    ,{<<"fetch">>,<<"ok">>}
    ,[{<<"partial">>,Template}]), 
  reply(Sid,Json).


%% ----------------------------------------------------------------------------

guests({Sid,CbId},<<"upsert">>,Record,_TokenData) ->
  guests({Sid,CbId},<<"add">>,Record,_TokenData);
guests({Sid,CbId},<<"add">>,Record,_TokenData) ->
  {Result,Msg} = case estore:save(pgsql,Record) of
    {ok,_Id} -> {<<"ok">>,<<"Saved">>};
    {error,_Error} -> {<<"error">>,<<"Could not save">>}
  end,
  Json = json_reply(
    {CbId,<<"guests">>}
    ,{<<"add">>,Result}
    ,[{<<"msg">>,Msg}]), 
  reply(Sid,Json);

guests({Sid,CbId},<<"fetch">>,_Record,_TokenData) ->
   {Result,Msg,Count,GuestsKV} = case estore:find(pgsql,guest,[],[],all,0) of
    [] -> 
      {<<"error">>,<<"No Categories">>,<<"0">>,[]};
    Guest when is_tuple(Guest) -> 
      {<<"ok">>,<<"ok">>,<<"1">>,[estore_json:record_to_kv(Guest)]};
    Guests when is_list(Guests) -> 
      {<<"ok">>,<<"multiple">>,whale_utls:integer_to_binary(length(Guests))
        ,estore_json:record_to_kv(Guests)}
  end,
  Json = json_reply(
    {CbId,<<"guests">>}
    ,{<<"fetch">>,Result}
    ,[{<<"msg">>,Msg},{<<"count">>,Count},{<<"data">>,GuestsKV}]
  ), 
  reply(Sid,Json). 

%% ----------------------------------------------------------------------------

authenticate({Sid,CbId},Data) ->
  Action = whale_utls:get_value(<<"action">>,Data,undefined),
  ReqUserRecord = estore:json_to_record(Data),
  ReqEmail = ReqUserRecord#'user'.'email',
  ReqPassword = ReqUserRecord#'user'.'password',
  Where = [{'email','=',ReqEmail},'and',{'password','=',ReqPassword}],
  case estore:find(pgsql,user,Where) of
    [] -> 
      Json = json_reply({CbId,<<"login">>},{Action,<<"error">>},[{<<"msg">>,<<"Not Recognised">>}]);
    [UserRecord] ->
      Email = UserRecord#'user'.'email',
      Password = UserRecord#'user'.'password',
      if ReqEmail =:= Email andalso ReqPassword =:= Password ->
        UserId = UserRecord#'user'.'id',
        UserRecordNoPass = UserRecord#'user'{'password' = ""}, 
        AccessLevel = UserRecord#'user'.'access', 
        UserKV = estore_json:record_to_kv(UserRecordNoPass),   
        %% Store user id in JWT token 
        Payload = [{user_id,UserId},{'access',AccessLevel}],
        SecretKey = whale_utls:get_env(basic_config,jwt_secret),
        Token = ejwt:encode(Payload,SecretKey),
        Json = json_reply(
	  {CbId,<<"login">>}
	  ,{Action,<<"ok">>}
	  ,[{<<"token">>,Token}
            ,{<<"type">>,<<"user">>}
            ,{<<"data">>,[UserKV]}
          ]
        );
      true -> 
        io:fwrite("UNAUTHORISED: ~p ~p ~p ~p ~n",[ReqEmail,Email,ReqPassword,Password]),
        Json = json_reply({CbId,<<"login">>},{Action,<<"error">>},[{<<"msg">>,<<"Ivalid Credentials">>}])
      end;
    Multiple when is_list(Multiple) ->
      io:fwrite("Multiple: ~p ~p ~n",[ReqEmail,ReqPassword]),
      Json = json_reply({CbId,<<"login">>},{Action,<<"error">>},[{<<"msg">>,<<"Multiple">>}])
  end,   
  reply(Sid,Json).

%% ----------------------------------------------------------------------------

reply(Sid,Resp) ->
  gproc:send(?HANDLER_KEY(Sid),Resp).

json_reply({CbId,Operation},{Action,OkError},DataKV) ->
  Json = [
    {<<"operation">>,Operation}
    ,{<<"cbid">>,CbId}
    ,{<<"data">>,[
      {<<"action">>,Action}
      ,{<<"result">>,OkError}
    ] ++ DataKV }
  ],
  jsx:encode(Json).

error_reply({Sid,CbId},Operation,Action,OkError,DataKV) ->
  Json = json_reply({CbId,Operation},{Action,OkError},DataKV),
  reply(Sid,Json).


