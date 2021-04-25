-module(shop2).
-export([total_test/0, total/1]).

-import(shop, [cost/1]).
-import('list-utils', [map/2, sum/1]).

total(L) ->
  sum(
    map(
      fun({ What, Count}) -> shop:cost(What) * Count end,
      L
    )
  ).

total_test() ->
  ShoppingList = [{oranges, 4}, {newspaper, 1}, {apples, 10}, {pears, 6}, {milk, 3}],
  123 = total(ShoppingList),
  passed.
