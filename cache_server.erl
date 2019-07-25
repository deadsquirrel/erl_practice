-module(cache_server).
-export([ start_link/1,
          loop/1]).

start_link(MyTable) ->
    io:format("start ~p~n", [self()]),
    io:format("created table ~p~n", [MyTable]),
    ets:new(MyTable, [ordered_set,named_table]),
    ok,
    spawn(?MODULE, loop, [MyTable]).


loop(MyTable) ->
    receive
        {add, Item} -> io:format("~p adds ~p to its MyTable~n", [self(), Item]),
                       NewMyTable = [Item | MyTable],
                       loop(NewMyTable);
        {remove, Item} -> NewMyTable = case lists:member(Item, MyTable) of
                                         true -> lists:delete(Item, MyTable);
                                     false -> io:format("I have no ~p~n", [Item]),
                                                  MyTable
                                     end,
                          loop(NewMyTable);
        show_items -> io:format("my items is ~p~n", [MyTable]),
                      loop(MyTable);
        stop -> io:format("~p stops now ~n", [self()]);
        _Any -> loop(MyTable)
    end.
