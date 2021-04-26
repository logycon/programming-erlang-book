-module(tuples).
-export([test/0]).

my_tuple_to_list({}) -> [];
my_tuple_to_list(T) when is_tuple(T) ->
  Head = element(1, T),
  Tail = erlang:delete_element(1, T),
  [Head | my_tuple_to_list(Tail)].

test() ->
  [1] = my_tuple_to_list({1}),
  [1, 2] = my_tuple_to_list({ 1, 2}),
  [1, 2, 3] = my_tuple_to_list({1, 2, 3}),
  [1, 2, 3, {4, 5}] = my_tuple_to_list({1, 2, 3, {4, 5}}),
  passed.