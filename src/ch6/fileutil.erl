-module(fileutil).
-export([fread/1]).

log_error(Class, Error, Stacktrace) ->
  io:format("~p:~p ~nStackTrace:~n ~p ~n", [Class, Error, Stacktrace]).

fread(F) ->
  try
      {ok, Bytes} = file:read_file(F),
      io:format("~p", [unicode:characters_to_list(Bytes)])
  catch
    Class:Error:Stacktrace ->
      log_error(Class, Error, Stacktrace),
      erlang:raise(Class, Error, Stacktrace)

  end.
