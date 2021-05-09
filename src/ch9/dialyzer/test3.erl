-module(test3).
-export([test/0]).

factorial(0) -> 1;
%factorial(N) -> N * factorial(N-1). % infinite loop called with negative
factorial(N) when N > 0 -> N * factorial(N-1);
factorial(N) when N < 0 -> N * factorial(N+1).

test() ->
  factorial(5) + factorial(-5).
