calculator :- repeat, read(X), eval(X,Y), write(Y), y = end, !.
eval(end, end) :- !.
eval(X, Y) :- Y is X.