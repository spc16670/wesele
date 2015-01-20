-module(whale_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%% ===================================================================
%% Application callbacks
%% ===================================================================

start(_StartType, _StartArgs) ->
  ensure_started(syntax_tools),
  ensure_started(compiler),
  ensure_started(merl),
  ensure_started(erlydtl),
  ensure_started(goldrush),
  ensure_started(lager),
  ensure_started(crypto),
  ensure_started(cowlib),
  ensure_started(ranch),
  ensure_started(cowboy),
  ensure_started(erlsha2),
  ensure_started(jsx),
  ensure_started(ejwt),
  ensure_started(gproc),
  ensure_started(estore),
   
  PrivDir = whale_utls:priv_dir(),

  Dispatch = cowboy_router:compile([
    {'_', [
      {"/static/[...]", cowboy_static, {dir,PrivDir ++ "/static",[{mimetypes, cow_mimetypes, all}]}}
      ,{"/app/[...]", cowboy_static, {dir,PrivDir ++ "/app",[{mimetypes, cow_mimetypes, all}]}}
      ,{"/", whale_rest, []}
      ,{"/bullet/[...]",bullet_handler,[{handler,whale_bullet_handler}]}
    ]}
  ]),

  cowboy:start_http(http_listener, 100,
    [{port, whale_utls:get_env(http_port)}],
    [{env, [{dispatch, Dispatch}]}]
  ),

  cowboy:start_https(https_listener, 100,
    [{port, whale_utls:get_env(https_port)}
     ,{cacertfile, PrivDir ++ "/ssl/ca.whale.in.crt"}
     ,{certfile, PrivDir ++ "/ssl/whale.in.crt"}
     ,{keyfile, PrivDir ++ "/ssl/whale.in.key"}
    ],
    [{env, [{dispatch, Dispatch}]}]
  ),


  R = whale_sup:start_link(),
  whale_db:init(),
  R.

stop(_State) ->
  ok.

%% @doc
%% Ensures all dependencies are started.
%% @end

ensure_started(App) ->
  case application:start(App) of
    ok -> ok;
    {error,{already_started,App}} -> ok;
    Error -> io:fwrite("Could not start ~p ~p ~n",[App,Error])
  end.
