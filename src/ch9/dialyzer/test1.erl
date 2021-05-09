-module(test1).
-export([f1/0]).

%seconds({_Year, _Month, _Day, Hour, Min, Sec}) -> % invalid call
seconds({H, M, S}) ->
  (60 * H + M) * 60 + S.

f1() ->
  X = erlang:time(),
  seconds(X).