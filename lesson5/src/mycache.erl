-module(mycache).
-export([
		create/1, 
		insert/1,
		lookup/2,
		delete_obsolete/1,
		loop_delete_obsolete/2]).
		
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
	ets:insert(ItsMyTable,{4,erlang:timestamp(),"787ff895-3d91-429e-b291-7a38d8c734ab",6}),
	ets:insert(ItsMyTable,{5,erlang:timestamp(),"57e92c9e-bb3f-42c7-8081-078c12d30885",1200}),
	ets:insert(ItsMyTable,{6,erlang:timestamp(),"7f57fb00-c6cc-46ad-b1dc-ef8a467e31fe",100}),
	ets:insert(ItsMyTable,{7,erlang:timestamp(),"2bd7e8cc-3ab1-47a0-962f-b2cde083b45a",30}),
	ets:insert(ItsMyTable,{8,erlang:timestamp(),"49fb070f-9210-4706-a90b-b6b50a59ceca",1800}),
	ets:insert(ItsMyTable,{9,erlang:timestamp(),"1269c40d-3838-4d7f-a6d1-a20420430b5a",0}),
	ok.

lookup(ItsMyTable, Key) ->
		[{_,Ts,Uuid,Ttl}] =  ets:lookup(ItsMyTable,Key),
		{MacSecTb,SecTb, MicSecTb} = Ts,
		{MacSec, Sec,MicSec} = erlang:timestamp(),
			case (MacSec*1000000000000+Sec*1000000+MicSec) - (MacSecTb*1000000000000+SecTb*1000000+MicSecTb) < Ttl*1000000 of
				true -> {ok, Uuid};
				false -> nothing
			end.

delete_obsolete(ItsMyTable) ->
	ets:safe_fixtable(ItsMyTable, true),
	catch loop_delete_obsolete(ItsMyTable, ets:first(ItsMyTable)),
	ets:safe_fixtable(ItsMyTable, false),
	ok.

loop_delete_obsolete(_ItsMyTable,'$end_of_table') ->
	ok;
loop_delete_obsolete(ItsMyTable, Myk) ->
	[{Myk,Ts,_Uuid,Ttl}] =  ets:lookup(ItsMyTable, Myk),
	{MacSecTb,SecTb, MicSecTb} = Ts,
	{MacSec, Sec,MicSec} = erlang:timestamp(),
		case (MacSec*1000000000000+Sec*1000000+MicSec) - (MacSecTb*1000000000000+SecTb*1000000+MicSecTb) > Ttl*1000000 of
			true -> ets:delete(ItsMyTable, Myk);  %%тут удалить
			false -> ok
		end,
		loop_delete_obsolete(ItsMyTable,ets:next(ItsMyTable, Myk)). 
	
