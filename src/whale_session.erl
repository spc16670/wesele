-module(whale_session).

-export([
  on_request/1
  , get_cookie/1
  , set_cookie/1
  , drop_session/1
  , is_authorised/1
]).

%% --------------------------------------------------------------------

is_authorised(null) ->
  io:fwrite("Unauthorised access attempted~n",[]),
  {error,<<"No Token">>};
is_authorised(undefined) ->
  io:fwrite("Unauthorised access attempted~n",[]),
  {error,<<"No Token">>};
is_authorised(Data) when is_list(Data) ->
  Token = whale_utls:get_value(<<"token">>,Data,undefined),
  is_authorised(Token);
is_authorised(Token) when is_binary(Token) ->
  SecretKey = whale_utls:get_env(basic_config,jwt_secret),
  case ejwt:decode(Token,SecretKey) of
    error -> 
      io:fwrite("Unauthorised access attempted~n",[]),
      {error,<<"jwt_error">>};
    Decoded when is_list(Decoded) -> {ok,Decoded}
  end.

on_request(Req) ->
  {Cookie,Path,Req2} = get_cookie(Req),
  io:fwrite("Cookie is: ~p Path: ~p ~n",[Cookie,Path]),
  case Cookie of
    undefined ->
      %Req4 = session_no(Req2, Path);
      {Cookie2,Req3} = set_cookie(Req2),
      {Cookie2,Path,Req3};
    _ ->
      {Cookie2,Path2,Req3} = get_cookie(Req2),
      {Cookie2,Path2,Req3}
  end.
 
get_cookie(Req) ->
  {Path, Req1} = cowboy_req:path(Req),
  {Cookie, Req2} = cowboy_req:cookie(<<"COOKIE">>, Req1),
  {Cookie, Path, Req2}.
 
set_cookie(Req) ->
  Cookie = whale_utls:generate_hash(),
  Req1 = cowboy_req:set_resp_cookie(<<"COOKIE">>,Cookie,[{path, <<"/">>}],Req),
  {Cookie,Req1}.
 
drop_session(Req) ->
  Req2 = cowboy_req:set_resp_header(<<"Set-Cookie">>,<<"COOKIE=deleted; expires=Thu, 01-Jan-1970 00:00:01 GMT; path=/">>, Req),
  Req2.


