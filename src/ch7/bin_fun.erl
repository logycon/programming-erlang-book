-module(bin_fun).
-export([test/0]).

reverse_binary(B) ->
  list_to_binary(
    lists:reverse(
      binary_to_list(B)
    )
  ).

reverse_binary2(B) ->
  Size = erlang:bit_size(B),
  <<X:Size/integer-little>> = B,
  <<X:Size/integer-big>>.

reverse_bytes(Binary) -> reverse_bytes(Binary, <<>>).
reverse_bytes(<<Head, Tail/binary>>, Acc) -> reverse_bytes(Tail, << Head, Acc/binary >>);
reverse_bytes(<<>>, Acc) -> Acc.

reverse_bits(Binary) -> reverse_bits(Binary, <<>>).
reverse_bits(<<Head:1, Tail/bitstring>>, Acc) -> reverse_bits(Tail, << Head:1, Acc/bitstring >>);
reverse_bits(<<>>, Acc) -> Acc.


term_to_packet(Term) ->
  Binary = term_to_binary(Term),
  N = byte_size(Binary),
  <<N:4, Binary/binary>>.

packet_to_term(Packet) ->
  <<_:4, Binary/binary>> = Packet,
  binary_to_term(Binary).

test() ->
  B = <<16#41, 16#42, 16#43, 16#44, 16#45, 16#46, 16#47>>,
  io:format("B   = ~p ~n", [B]),
  BR1 = reverse_binary(B),
  io:format("BR1 = ~p ~n", [BR1]),
  BR2 = reverse_binary2(B),
  io:format("BR2 = ~p ~n", [BR2]),

  io:format("~n~n"),

  Term = ["h", "e", "l", "l", "o"],
  io:format("Term   ~p ~n", [Term]),
  Binary = term_to_binary(Term),
  io:format("Binary ~p ~n", [Binary]),

  Packet = term_to_packet(Term),
  io:format("Packet ~p ~n", [Packet]),

  <<N:4, Binary2/binary>> = term_to_packet(Term),
  io:format("N = ~p ~n", [N]),
  io:format("Binary = ~p ~n", [Binary2]),

  io:format("Term = ~p ~n", [packet_to_term(Packet)]),

  io:format("~n ~n"),

  <<>> = reverse_bytes(<<>>),
  <<4, 3, 2, 1>> = reverse_bytes(<<1, 2, 3, 4>>),
  BX = 2#01110111,
  BB = <<BX>>,
  REV = reverse_bits(BB),
  <<Y>> = REV,
  io:format("~p ~p ~p ~n", [BB, REV, Y]),


  done.
