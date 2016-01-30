writeCube(X, Y) :-  write(X), write(' rest '), write(Y), nl.
cubeLess(X, B, R) :- R is (B - (X^3)), R >= 0.
smallerCube(X, B) :- var(X), smallerCube(1, B), writeCube(X, B).
smallerCube(X, B) :- nonvar(X), cubeLess(X, B, R), Xtmp is X+1, writeCube(X, R), smallerCube(Xtmp, B).
restSum(B,S) :- var(S), restSum(1,B,0).
restSum(X,B,S) :- nonvar(S), cubeLess(X,B,R), SS is S + R, XX is X+1, restSum(XX, B, SS), S is SS.