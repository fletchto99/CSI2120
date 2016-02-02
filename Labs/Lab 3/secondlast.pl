%% secondLast(X,[7,abc,foo,x,9,12]).

secondLast(H, [H|[_|[]]]) :- !.
secondLast(X, [_|T]) :- secondLast(X, T).