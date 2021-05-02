-module(rgb).
-export([test/0]).

test() ->
  Red = 2,
  Green = 61,
  Blue = 20,
  Mem = <<Red: 5, Green: 6, Blue: 5>>,
  io:format("~p ~n", [Mem]),
  <<R1: 5,G1: 6, B1: 5>> = Mem,
  io:format("~p ~p ~p ~n", [R1, G1, B1]),
  done.