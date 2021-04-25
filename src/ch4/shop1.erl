-module(shop1).
-export([total/1]).

total([{ What, Count } | Tail ]) -> shop:cost(What) * Count + total(Tail);
total([]) -> 0.
