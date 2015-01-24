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

-record(guest, {
  id = [ 
    {type,{'bigserial',[]}}
    ,{constraints,[{'pk',[]},{null,false}]}
  ]
  ,main = [
    {type,{'varchar',[{length,100}]}}
    ,{constraints,[{null,false}]}
  ]
  ,partner = [
    {type,{'varchar',[{length,100}]}}
    ,{constraints,[{null,true}]}
  ]
  ,email = [
    {type,{'varchar',[{length,50}]}}
    ,{constraints,[{null,false}]}
  ]
  ,accomodation = [
    {type,{'integer',[]}}
    ,{constraints,[{null,true}]}
  ]
  ,comments = [
    {type,{'varchar',[{length,1000}]}}
    ,{constraints,[{null,true}]}
  ]

}).
