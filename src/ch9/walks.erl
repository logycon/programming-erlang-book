-module(walks).
-export([plan_route/2]).
-export_type([point/0, direction/0, route/0]).

-type point() :: {X::integer(), Y::integer()}.
-type direction() :: north | south | east | west.
-type route() :: [{go, Direction::direction(), Distance::integer()}].

-spec plan_route(From::point(), To::point()) -> route().

plan_route(From, To) ->
  io:format("From ~p, To ~p ~n", [From, To]),
  ok.