-module (bs03).
%%нерабочая версия с доски. Разобраться

-export([split/2]).

split(Bin, Sep) ->
	BinSep = list_to_binary(Sep),
	Size = byte_size(BinSep),
	split(Bin, BinSep, Size, <<>>, []).


split(Bin, Sep, Size, Word, Acc) -> 
	case Bin of
		<<_BinSep:Size/binary, Rest/binary>> ->
			split(Rest, Sep, Size, <<>>, [Word|Acc]);
		<<C/utf8, Rest/binary>> ->
			split(Rest, Sep, Size, <<Word/binary, C/utf8>>, Acc);
		<<>> -> 
			lists:reverse([Word|Acc])
	end.
