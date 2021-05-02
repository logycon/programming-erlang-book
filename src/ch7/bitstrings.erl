-module(bitstrings).
-export([test/0]).

test() ->
  io:format("~n"),

  B1 = <<1:8>>,
  io:format("B1 = ~p ~n", [B1]),
  io:format("byte_size = ~p ~n", [byte_size(B1)]),
  io:format("is_binary = ~p ~n", [is_binary(B1)]),
  io:format("is_bitstring = ~p ~n", [is_bitstring(B1)]),
  io:format("~n"),

  B2 = <<1:17>>,

  io:format("B2 = ~p ~n", [B2]),
  io:format("byte_size = ~p ~n", [byte_size(B2)]),
  io:format("is_binary = ~p ~n", [is_binary(B2)]),
  io:format("is_bitstring = ~p ~n", [is_bitstring(B2)]),
  io:format("~n"),

  B3 = <<16#5f>>,
  io:format("B3 = ~p ~n", [B3]),
  io:format("byte_size = ~p ~n", [byte_size(B3)]),
  io:format("is_binary = ~p ~n", [is_binary(B3)]),
  io:format("is_bitstring = ~p ~n", [is_bitstring(B3)]),
  io:format("~n"),


  done.