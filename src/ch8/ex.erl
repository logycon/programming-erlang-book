-module(ex).
-export([test/0]).

for(Max, Max, F) -> [F(Max)];
for(Index, Max, F) -> [F(Index) | for(Index + 1, Max, F)].

%%
%% [{module1, function1}, {module1, function2}, ...]
%%

print_list(L) ->
  for(1,length(L),
    fun(I) -> io:format("~w. ~p ~n", [I, lists:nth(I, L)]) end
  ).

test() ->
  Mods = lists:map(
    fun({M, _}) -> M end,
    code:all_loaded()
  ),

  All = lists:flatmap(
    fun(M) -> % module
      Exports = M:module_info(exports),
      lists:map(fun({F, _}) -> {M, F} end, Exports)
    end,
    Mods
  ),

  Funcs = sets:to_list(
    sets:from_list(
      lists:map(
        fun({_, F}) -> F end,
        All
      )
    )
  ),

  FuncModCnts = lists:map(
    fun(F) ->
      InMods = lists:filter(
        fun({_, FF}) -> F =:= FF end,
        All
      ),
      {F, length(InMods)}
    end,
    Funcs
  ),

  Unambiguous =
    lists:filter(
      fun({_, Cnt}) -> Cnt =:= 1 end,
      FuncModCnts
    ),

  Top = lists:sort(
    fun({_, X}, {_, Y}) -> X > Y  end,
    FuncModCnts
  ),

  [H | _] = Top,
  io:format("Top function = ~p ~n", [H]).






