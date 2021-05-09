-module(test2).
-export([f1/0]).

f1() ->
  %tuple_size(list_to_tuple({a, b, c})). % not a list [any()]
  tuple_size(list_to_tuple([a, b, c])).
