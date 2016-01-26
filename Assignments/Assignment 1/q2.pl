cubeLess(X, B, R) :- R is (B - (X * X * X)), R >= 0.
smallerCube(X, B) :- var(X), smallerCube(1, B).
smallerCube(X, B) :- nonvar(X), cubeLess(X, B, _), Xtmp is X+1, smallerCube(Xtmp, B).