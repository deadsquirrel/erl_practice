-module(mycache).
-export([
		create/1, 
		insert/1,
		lookup/2]).
%%-import([ets]).
-import(io, [format/1]).

create(ItsMyTable) ->
	ItsMyTable = ets:new(ItsMyTable, [ordered_set,named_table]),
	ok.
	%%io:format(kkk).

%%todo сравнивать текущий таймштамп и табличній и если разница меньше ttl - возвращать значение
insert(ItsMyTable) ->
	ets:insert(ItsMyTable,{1,erlang:timestamp(), "7f5033ee-819b-4ec0-9c81-e85ca388eb56",600}),
	ets:insert(ItsMyTable,{2,erlang:timestamp(), "cd1c0678-ff11-4c5c-9850-0f32586a60b3",3600}),
	ets:insert(ItsMyTable,{3,erlang:timestamp(),"424d6632-57f3-4be5-89e9-95f06e08eb99",1200}),
	ets:insert(ItsMyTable,{4,erlang:timestamp(),"787ff895-3d91-429e-b291-7a38d8c734ab",600}),
	ets:insert(ItsMyTable,{5,erlang:timestamp(),"57e92c9e-bb3f-42c7-8081-078c12d30885",1200}),
	ets:insert(ItsMyTable,{6,erlang:timestamp(),"7f57fb00-c6cc-46ad-b1dc-ef8a467e31fe",1200}),
	ets:insert(ItsMyTable,{7,erlang:timestamp(),"2bd7e8cc-3ab1-47a0-962f-b2cde083b45a",3600}),
	ets:insert(ItsMyTable,{8,erlang:timestamp(),"49fb070f-9210-4706-a90b-b6b50a59ceca",1800}),
	ets:insert(ItsMyTable,{9,erlang:timestamp(),"1269c40d-3838-4d7f-a6d1-a20420430b5a",0}),
	ok.

lookup(ItsMyTable, Key) ->
	ets:lookup(ItsMyTable,Key).





%%my_cache:insert(TableName, Key, Value, 600).
%%my_cache:lookup(TableName, Key).
%%my_cache:delete_obsolete(TableName).
