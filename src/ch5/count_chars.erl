-module(count_chars).
-export([test/0]).

count_characters(Str) ->
  count_characters(Str, #{}).

%% variable H is inbound
%% http://erlang.2086793.n4.nabble.com/count-characters-example-from-Programming-Erlang-td4715594.html
count_characters([H|T], #{ H := N }=X) ->
  count_characters(T, X#{ H := N+1 });

count_characters([H|T], X) ->
  count_characters(T, X#{ H => 1 });

count_characters([], X) ->
  X.


test() ->
  C = count_characters("hello"),
  io:format("~p ~n", [C]),
  pass.

