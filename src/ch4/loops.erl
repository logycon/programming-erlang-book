-module(loops).
-export([for/3,for_test/0]).

for(Max, Max, F) -> [F(Max)];
for(Index, Max, F) -> [F(Index) | for(Index + 1, Max, F)].

for_test() ->
  [1, 2, 3, 4, 5] = for(0, 4, fun(Val) -> Val + 1 end),
  passed.

