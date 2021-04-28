-module(records).
-include("records.hrl").
-export([test/0]).

update_status(R, Status) when is_record(R, todo) ->
  R#todo{ status = Status }.

create_records() ->
  % create new
  X1 = #todo{
    status = urgent,
    text = "Do someting"
  },
  io:format("~p, ~n", [X1]),

  % copy from existing
  X2 = X1#todo{ status = done },
  io:format("~p, ~n", [X2]),

  % extract fields
  #todo{who = W, text = Txt} = X2,
  io:format("~p, ~s ~n", [W, Txt]),

  % update status
  X3 = update_status(X2, completed),
  io:format("~p ~n", [X3]).


test() ->
  create_records(),
  ok.