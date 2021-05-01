-module(exception_handling).
-export([demo1/0, demo2/0, demo3/0, demo4/0, demo5/0]).

generate_exception(1) -> a;
generate_exception(2) -> throw(a);
generate_exception(3) -> exit(a);
generate_exception(4) -> {'EXIT', a};
generate_exception(5) -> error(a).

catcher(N) ->
  try generate_exception(N) of
    Val -> {N, normal, Val}
  catch
    throw:X -> { N, caught, thrown, X};
    exit:X  -> { N, caught, exited, X};
    error:X -> { N, caught, error, X}
  end.

demo1() ->
  [catcher(I) || I <- [1,2,3,4,5]].

demo2() ->
  [{I, (catch generate_exception(I))} || I <- [1,2,3,4,5]].

sqrt(X) when X < 0 -> error({squareRootNegativeArg, X});
sqrt(X) -> math:sqrt(X).

demo3() ->
  sqrt(-1).

log_exception(Class, Error) ->
  io:format("Logged : ~p: ~p ~n", [Class, Error]).

throw_error(N) when N > 10 -> erlang:error(toolarge);
throw_error(N) ->
  try math:sqrt(N)
  catch
    %error:badarith -> io:format("Bad arith argument to sqrt: ~p ~n", [N]);
    Class:Error:Stacktrace ->
      log_exception(Class, Error),
      erlang:raise(Class, Error, Stacktrace)
  end.

demo4() ->
  try
    throw_error(-1)
  catch
    error:badarith -> io:format("bad arith! ~n");
    throw:{barArg, X} -> io:format("Bad argument to sqrt: ~p ~n", [X]);
    error:X -> io:format("Error occured: ~p ~n", [X]);
    _:_ -> io:format("Other errors ~n")
  end.

demo5() ->
  try
    throw_error(20)
  catch
    error:toolarge -> io:format("argument is too large ~n")
  end.


