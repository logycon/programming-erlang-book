-module(dates).
-export([test/0]).

sleep(N) ->
  timer:sleep(N).

toString(date, {Year, Month, Day}) -> io_lib:format("~4..0w/~2..0w/~2..0w" , [Year, Month, Day]);
toString(time, {Hour, Minute, Second}) -> io_lib:format("~2..0w:~2..0w:~2..0w" , [Hour, Minute, Second]).

timer(F) ->
  Before = erlang:timestamp(),
  F(),
  After = erlang:timestamp(),
  Diff = timer:now_diff(After, Before),
  io:format("~w ~n", [Diff/1000]).

test() ->
  io:format("~s ~s ~n" , [toString(date, erlang:date()), toString(time, erlang:time())]),
  timer(fun() -> sleep(1000) end),
  passed.





