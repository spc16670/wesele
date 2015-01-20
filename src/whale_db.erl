-module(whale_db).

-export([
  init/0
]).

-include("$RECORDS_PATH/estore.hrl").

%% -----------------------------------------------------------------------------
%% -----------------------------------------------------------------------------
%% -----------------------------------------------------------------------------

init() ->
  init_mnesia()
  ,init_pgsql().


%% -----------------------------------------------------------------------------
%% ----------------------------- BASIC CONFIG ----------------------------------
%% -----------------------------------------------------------------------------

%% @doc Loads basic_config into mnesia in a transaction safe manner.

init_mnesia() ->
  estore:init(mnesia),
  init_mnesia_config().

init_mnesia_config() ->
  BasicConfig = whale_utls:get_env(basic_config),
  lists:foldl(fun({Key,Val},Acc) -> 
    Acc ++ [estore:save(mnesia,
      #'basic_config'{'key'=Key,'value'=Val})]
  end,[],BasicConfig).  

init_pgsql() ->
  %estore_pgsql:drop_schema(whale),
  estore:init(pgsql),
  ok.

