-module(area_server0).
-export([loop/0]).

area({rectangle, Width, Height}) -> Width * Height;
area({square, Side}) -> Side * Side.

loop() ->

  receive
    {rectangle, Width, Height} ->
      io:format("Area of rectangle is ~p~n", [area({rectangle, Width, Height})]),
      loop();

    {square, Side} ->
        io:format("Area of square is ~p, ~n", [area({square, Side})]),
        loop()
  end.