-module(maths).
-export([test/0]).

even(X) -> (X rem 2) =:= 0.
odd(X) -> (X rem 2) =/= 0.

filter(_, []) -> [];
filter(F, [Head | Tail]) ->
  case F(Head) of
    true -> [Head | filter(F, Tail)];
    false -> filter(F, Tail)
  end.

splita(F, L) -> split_acc(F, L, [], []).
split_acc(F, [Head | Tail], Left, Right) ->
  case F(Head) of
    true  -> split_acc(F, Tail, [Head | Left], Right);
    false -> split_acc(F, Tail, Left, [Head | Right])
  end;
split_acc(_, [], Left, Right) -> { lists:reverse(Left), lists:reverse(Right) }.

splitf(F, L) ->
  IsF = fun(X) -> F(X) =:= true end,
  IsNotF = fun(X) -> F(X) =/= true end,
  {filter(IsF, L), filter(IsNotF, L)}.

test() ->
  true = even(8),
  false = even(7),
  false = odd(6),
  true = odd(5),

  IsEven = fun(X) -> even(X) end,
  [2, 4, 6] = filter(IsEven, [1, 2, 3, 4, 5, 6, 7]),

  IsOdd = fun(X) -> odd(X) end,
  [1, 3, 5, 7] = filter(IsOdd, [1, 2, 3, 4, 5, 6, 7]),

  {[1, 3], [2, 4]} = splita(IsOdd, [1,2,3,4]),
  {[2, 4], [1, 3]} = splita(IsEven, [1,2,3,4]),

  {[1, 3], [2, 4]} = splitf(IsOdd, [1,2,3,4]),
  {[2, 4], [1, 3]} = splitf(IsEven, [1,2,3,4]),

  passed.
