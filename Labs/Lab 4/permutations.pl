color(red).
color(green).
color(blue).

colors(L) :- setof([X, Y, Z], (color(X), color(Y), color(Z)), L).