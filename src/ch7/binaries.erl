-module(binaries).
-export([test/0]).

test() ->
  Bin1 = <<1, 2, 3>>,
  io:format("Bin1 = ~p ~n", [Bin1]),

  Bin2 = <<5, 6, 7>>,
  io:format("Bin2 = ~p ~n", [Bin2]),

  Bin3 = list_to_binary([Bin1, 4, Bin2]),
  io:format("Bin3 = ~p ~n", [Bin3]),

  Split1 = split_binary(Bin3, 3),
  io:format("Split1 = ~p ~n", [Split1]),

  Term1 = "a",
  io:format("Term1 = ~p, ~n", [Term1]),

  Bin4 = term_to_binary(Term1),
  io:format("Bin4 = ~p ~n", [Bin4]), %% external term format
  io:format("Size of Bin4 = ~w ~n", [byte_size(Bin4)]),

  Term1 = binary_to_term(Bin4),
  io:format("Term1 = ~p ~n", [Term1]),


  pass.