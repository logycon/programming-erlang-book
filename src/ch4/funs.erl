-module(funs).
-export[double/1, hypot/2, c2f/1, f2c/1, even/1, odd/1].

double(X) -> X * 2.
hypot(X, Y) -> math:sqrt(X*X + Y*Y).

c2f(C) -> 32 + C * 9/5.
f2c(F) -> (F-32)*5/9.

even(X) -> (X rem 2) =:= 0.
odd(X) -> (X rem 2) =/= 0.


