%
% Every record needs an id. 
% -----------------------------------------------------------------------------

-record(user,{
  id = [ 
    {type,{'bigserial',[]}}
    ,{constraints,[{'pk',[]},{null,false}]}
  ]
  ,email = [
    {type,{'varchar',[{length,50}]}}
    ,{constraints,[{null,false}]}
  ]
  ,password = [
    {type,{'varchar',[{length,50}]}}
    ,{constraints,[{null,false}]}
  ]
  ,access = [
    {type,{'integer',[]}}
    ,{constraints,[{null,false}]}
  ]
  ,date_registered = [
    {type,{'timestamp',[]}}
  ]
}).


