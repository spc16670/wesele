-module(whale).

-export([
  partials/2
  ,authenticate/2
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
        %% Retrieve shopper and user
        [ShopperRecord] = estore:find(pgsql,shopper,[{'user_id','=',UserId}]),
        UserRecordNoPass = UserRecord#'user'{'password' = ""}, 
        AccessLevel = UserRecord#'user'.'access', 
        ShopperKV = estore_json:record_to_kv(ShopperRecord),
        UserKV = estore_json:record_to_kv(UserRecordNoPass),   
        %% Store user id in JWT token 
        Payload = [{user_id,UserId},{'access',AccessLevel}],
        SecretKey = whale_utls:get_env(basic_config,jwt_secret),
        Token = ejwt:encode(Payload,SecretKey),
        Json = json_reply(
	  {CbId,<<"login">>}
	  ,{Action,<<"ok">>}
	  ,[{<<"token">>,Token}
            ,{<<"type">>,<<"multiple">>}
            ,{<<"data">>,[ShopperKV,UserKV]}
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


