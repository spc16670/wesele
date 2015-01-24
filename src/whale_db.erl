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
  estore_pgsql:drop_schema(wesele),
  estore:init(pgsql),
  insert_test_user(),
  insert_test_guest(),
  ok.

insert_test_user() ->
  try
    estore_pgsql:transaction(),
    User = estore:new(pgsql,user),
    UserRecord = User#'user'{'email'="asdf@asdf.asdf",'password'="asdfqwer",'access'=4},
    {ok,UserId} = estore:save(pgsql,UserRecord),
    estore_pgsql:commit()
  catch Error:Reason ->
    io:fwrite("Rolling back ~p ~p ~n",[Error,Reason]),
    eshop_logging:log_term(debug,[Error]),
    estore_pgsql:rollback()
  end.

insert_test_guest() ->
  try
    estore_pgsql:transaction(),
    Guest = estore:new(pgsql,guest),
    GuestRecord = Guest#'guest'{
      'main'="Szymon Czaja"
      ,'partner' = "Anna Zulauf"
      ,'email' = "asdf@asdf.asdf"
      ,'accomodation' = 1
      ,'comments' = "No Comments"
    },
    {ok,_GuestId} = estore:save(pgsql,GuestRecord),
    estore_pgsql:commit()
  catch Error:Reason ->
    io:fwrite("Rolling back ~p ~p ~n",[Error,Reason]),
    eshop_logging:log_term(debug,[Error]),
    estore_pgsql:rollback()
  end.
