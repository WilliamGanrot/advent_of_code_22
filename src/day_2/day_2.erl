-module(day_2).

-export([run1/0, run2/0]).

run1() ->
    Input = read_and_parse("input.txt"),
    calculate_score(Input).

run2() ->
    Input = read_and_parse("input.txt"),
    Fun = fun(E) ->
        case E of
            "A X" -> "A Z";
            "B X" -> "B X";
            "C X" -> "C Y";
            "A Y" -> "A X";
            "B Y" -> "B Y";
            "C Y" -> "C Z";
            "A Z" -> "A Y";
            "B Z" -> "B Z";
            "C Z" -> "C X"
        end
    end,
    PlayList = lists:map(Fun, Input),
    calculate_score(PlayList).

calculate_score(PlaysList) ->
    Fun = fun(E, Acc) ->
        case lists:reverse(E) of
            "X C" -> Acc + 6 + 1;
            "Y A" -> Acc + 6 + 2;
            "Z B" -> Acc + 6 + 3;
            "X A" -> Acc + 3 + 1;
            "Y B" -> Acc + 3 + 2;
            "Z C" -> Acc + 3 + 3;
            "X" ++ _ -> Acc + 1;
            "Y" ++ _ -> Acc + 2;
            "Z" ++ _ -> Acc + 3
        end
    end,
    lists:foldl(Fun, 0, PlaysList).

read_and_parse(FileName) ->
    {ok, Bin} = file:read_file(FileName),
    string:split(binary_to_list(Bin), "\n", all).
