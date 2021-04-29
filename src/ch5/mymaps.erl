-module(mymaps).
-export([test/0]).


test() ->
  Facts = #{
    {wife, fred} => "Sue",
    {age, fred} => 45,
    {daughter, fred} => "Mary"
  },
  io:format("~p ~n", [Facts]),

  F2 = #{b => 2, a => 1},
  io:format("~p ~n", [F2]),

  F1 = F2,
  io:format("~p ~n", [F1]),

  F3 = F1#{ c => xx },
  io:format("~p ~n", [F3]),

  % F4 = F1#{ c := 3}, -> Bad key exception


  pass.