-module('list-utils').
-export([
  sum/1, sum/2,
  map/2,
  qsort/1,
  max/1,
  filter/2,
  split/2
]).
-export([
  map_test/0, sum_test/0, qsort_test/0, pythag_test/0,
  perms_test/0, max_test/0, filter_test/0,
  split_test/0
]).

sum([Head | Tail]) -> Head + sum(Tail);
sum([]) -> 0.

sum(F, [Head | Tail]) -> F(Head) + sum(Tail, F);
sum(F, []) -> F(0).
sum_test() ->
  6 = sum([1, 2, 3]),
  7 = sum([2, 2, 3], fun(X) -> X end),
  12 = sum([1, 2, 3], fun(X) -> X * 2 end),
  passed.

map(_, []) -> [];
map(F, [Head | Tail]) -> [F(Head) | map(F, Tail)].
map_test() ->
  [1, 2, 3] = map(fun(X) -> X + 1 end, [0, 1, 2]),
  passed.

qsort([]) -> [];
qsort([ Head | Tail ]) ->
  qsort([X || X <- Tail, X < Head])
  ++ [ Head ] ++
  qsort([X || X <- Tail, X >= Head]).
qsort_test() ->
  Unsorted = [23,6,2,9,27,400,78,45,61,82,14],
  Sorted = qsort(Unsorted),
  [2,6,9,14,23,27,45,61,78,82,400] = Sorted,
  passed.

pythag(N) -> [ { A, B, C} ||
  A <- lists:seq(1, N),
  B <- lists:seq(1, N),
  C <- lists:seq(1, N),
  A + B + C =< N,
  A*A + B*B =:= C*C
].
pythag_test() ->
  [{3,4,5},{4,3,5}] = pythag(16),
  passed.

perms([]) -> [[]];
perms(L) -> [[Head | Tail] ||
  Head <- L,
  Tail <- perms(L -- [Head])
].
perms_test() ->
  Res = perms("123"),
  Out = string:join(Res, ","),
  io:format("~p~n", [Out]),
  "123,132,213,231,312,321" = Out,
  passed.

max([]) -> 0;
max([Head | Tail]) ->
  TailMax = max(Tail),
  case Head >= TailMax of
    true ->  Head;
    false -> TailMax
  end
.
max_test() ->
  100 = max([1, 5, 4, 100, 5]),
  passed.

filter(F, [Head | Tail]) ->
  case F(Head) of
    true -> [Head | filter(F, Tail)];
    false -> filter(F, Tail)
  end;
filter(_, []) -> []
.
filter_test() ->
  F = fun(X) -> X < 3 end,
  [1, 2] = filter(F, [1, 2, 3]),
  passed.

split(F, L) ->
  split_acc(F, L, [], []).

split_acc(F, [Head | Tail], Left, Right) ->
  case F(Head) of
    true  -> split_acc(F, Tail, [Head | Left], Right);
    false -> split_acc(F, Tail, Left, [Head | Right])
  end;
split_acc(_, [], Left, Right) ->
  { lists:reverse(Left), lists:reverse(Right) }
.

split_test() ->
  IsOdd =
    fun(X) ->
      case (X rem 2) of
        1 -> true;
        0 -> false
      end
    end,

  {[1, 3], [2, 4]} = split(IsOdd, [1,2,3,4]),
  passed.

