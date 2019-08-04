-module (bs03).
-author("yanki").

-export([split/2]).

split(Bin, Sep) ->
	BinSep = list_to_binary(Sep),
	Size = byte_size(BinSep),
	split(Bin, BinSep, Size, <<>>, []).


split(Bin, BinSep, Size, Word, Acc) -> 
	case Bin of
		<<BinSep:Size/binary, Rest/binary>> ->
			split(Rest, BinSep, Size, <<>>, [Word|Acc]);
		<<C/utf8, Rest/binary>> ->
			split(Rest, BinSep, Size, <<Word/binary, C/utf8>>, Acc);
		<<>> -> 
			lists:reverse([Word|Acc])
	end.
