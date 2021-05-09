-module(env1).
-export([code_paths/0]).

code_paths() ->
  Paths = lists:filter(
    fun(X) -> X =/= "." end,
    code:get_path()
  ),
  io:format("Output:~n"),
  io:format("~p", [Paths]).
