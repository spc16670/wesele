%
% Every record needs to have an index specified.
% Every record name is also an ES type.
% 
% -----------------------------------------------------------------------------
%-record('estore_result',{result,data,code,meta,calltime,count}).

-record(review,{
  index = [{'name',test}]
  ,id = [{type,long}]
  ,author = [{type,string}]
  ,created_date = [{type,date}]
  ,score = [{type,integer}]
  ,text = [{type,string}]
}).

