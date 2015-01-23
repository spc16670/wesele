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
  ,invitee = [
    {type,{'varchar',[{length,100}]}}
    ,{constraints,[{null,false}]}
  ]
  ,invitee_partner = [
    {type,{'varchar',[{length,100}]}}
    ,{constraints,[{null,true}]}
  ]
  ,invitee_email = [
    {type,{'varchar',[{length,50}]}}
    ,{constraints,[{null,false}]}
  ]
  ,needs_acomodation = [
    {type,{'integer',[]}}
    ,{constraints,[{null,true}]}
  ]
  ,comments = [
    {type,{'varchar',[{length,1000}]}}
    ,{constraints,[{null,true}]}
  ]

}).
