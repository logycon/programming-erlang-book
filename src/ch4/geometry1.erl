-module(geometry1).
-export([test/0, area/1, perimeter/1]).

area({rectangle, Width, Height}) -> Width * Height;
area({square, Side}) -> Side * Side;
area({circle, Radius}) -> Radius * Radius * math:pi();
area({'right triangle', K1, K2}) -> K1 * K2 / 2.

perimeter({rectangle, Width, Height}) -> Width * 2 + Height * 2;
perimeter({square, Side}) -> Side * 4;
perimeter({circle, Radius}) -> 2 * math:pi() * Radius;
perimeter({'right triangle', K1, K2}) -> K1 + K2 + hypot(K1, K2).

hypot(K1, K2) -> math:sqrt(K1*K1 + K2*K2).

test() ->
  12 = area({ rectangle, 3, 4 }),
  144 = area({ square, 12 }),
  16.0 = area({'right triangle', 8, 4}),
  5.0 = hypot(3, 4),
  tests_worked.