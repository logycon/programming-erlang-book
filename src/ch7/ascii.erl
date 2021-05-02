-module(ascii).
-export([print/0]).

for(Max, Max, F) -> [F(Max)];
for(Index, Max, F) -> [F(Index) | for(Index + 1, Max, F)].

print() ->
  io:format("Dec \t Char \t Hex \t Oct \t Bin ~n"),
  io:format("------------------------------------------ ~n"),

  F = fun(N) -> io:format("~p \t ~p \t ~p \t ~p \t ~p ~n",
    [
      integer_to_list(N, 10),
      io_lib:format("~c", [N]),
      integer_to_list(N, 16),
      integer_to_list(N, 8),
      string:right(integer_to_list(N, 2), 8, $0)
    ]
  ) end,
  for(0, 127, F),
  done.
