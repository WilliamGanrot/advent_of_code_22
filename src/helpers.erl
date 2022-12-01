-module(helpers).

-export([trail_chunk/4]).

% KeepChunkedElement - if the element where ChunkFun is true should be added to the chunk
trail_chunk(L, ChunkFun, KeepChunkedElement, KeepRemained) ->
    Fun = fun(E, {Acc, AccChunk}) ->
        case {ChunkFun(E), KeepChunkedElement} of
            {true, true} -> {Acc ++ [AccChunk ++ [E]], []};
            {true, false} -> {Acc ++ [AccChunk], []};
            {false, _} -> {Acc, AccChunk ++ [E]}
        end
    end,

    {Chunked, Remainder} = lists:foldl(Fun, {[], []}, L),

    case KeepRemained of
        true -> Chunked ++ [Remainder];
        false -> Chunked
    end.
