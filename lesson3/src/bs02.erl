-module (bs02).
-author("yanki").

-export([words/1]).

words(Bin) ->
         words(Bin, <<>>, []).
         
words(<<" ", Rest/binary>>, Acc, Acc2) ->
    words(Rest, <<>>, [Acc|Acc2]);

words(<<C/utf8, Rest/binary>>, Acc, Acc2) ->
    words(Rest, <<Acc/binary, C/utf8>>, Acc2);
    
words(<<>>, Acc, Acc2) ->
    lists:reverse([Acc|Acc2]).
