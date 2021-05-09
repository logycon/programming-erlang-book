-module(types1).
-export([f1/1, f2/1, f3/1]).


f1({H, M, S}) -> (H*60 + M) *60 + S.
f2({H, M, S}) when is_integer(H) ->  f1({H, M, S}).
f3({H, M, S}) ->
  print(H, M, S),
  f1({H, M, S}).

print(H, M, S) ->
  Str = integer_to_list(H) ++ ":" ++ integer_to_list(M) ++ ":" ++ integer_to_list(S),
  io:format("~s", [Str]).
