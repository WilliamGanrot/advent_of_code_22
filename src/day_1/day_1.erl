-module(day_1).

-export([run1/0, run2/0]).

run1() ->
    Elfs = read_and_parse("input.txt"),
    [Top | _] = find_max_wheight(Elfs),
    Top.

run2() ->
    Elfs = read_and_parse("input.txt"),
    [Top1, Top2, Top3 | _] = find_max_wheight(Elfs),
    Top1 + Top2 + Top3.

find_max_wheight(Elfs) ->
    Weights = [lists:sum(ElfWeights) || ElfWeights <- Elfs],
    lists:sort(fun(A, B) -> A > B end, Weights).

read_and_parse(FileName) ->
    {ok, Bin} = file:read_file(FileName),
    Rows = string:split(binary_to_list(Bin), "\n", all),
    Chunked = helpers:trail_chunk(Rows, fun(E) -> E == [] end, false, true),
    lists:map(fun(VL) -> [list_to_integer(V) || V <- VL] end, Chunked).
