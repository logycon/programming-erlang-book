-module(area_server2).
-export([rpc/2, loop/0]).

rpc(Pid, Request) ->
  Pid ! { self(), Request },
  receive
    {Pid, Response} -> Response
  end.

loop() ->
  receive

    {From, {rectangle, Width, Height}} ->
      From ! Width * Height,
      loop();

    {From, {circle, Radius}} ->
      From ! 3.14159 * Radius * Radius,
      loop();

    {From, {Other}} ->
      From ! { error, Other },
      loop

  end.