-module('list-comprehensions').
-export([total_test/0]).

-import('list-utils', [map/2, sum/1]).
-import(shop, [cost/1]).

content() ->
  L = [1, 2, 3],

  Double = fun(X) -> 2*X end,
  L2 = map(Double, L),
  [2, 4, 6] = L2,

  L3 = [2 * X || X <- L],
  [2, 4, 6] = L3,

  passed.

total(L) -> sum([shop:cost(What) * Count || {What, Count} <- L]).
total_test() ->
  Buy = [{oranges,4},{newspaper,1},{apples,10},{pears,6},{milk,3}],
  Doubled = [{Item, Count * 2} || { Item, Count} <- Buy ],
  Total = total(Doubled),
  246 = Total,
  passed.

