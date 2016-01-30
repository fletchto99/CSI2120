writeCube(X, Y) :-  write(X), write(' rest '), write(Y), nl.
cubeLess(X, B, R) :- R is (B - (X^3)), R >= 0.
smallerCube(X, B) :- var(X), smallerCube(1, B), writeCube(X, B).
smallerCube(X, B) :- nonvar(X), cubeLess(X, B, R), Xtmp is X+1, smallerCube(Xtmp, B), writeCube(X, R).
%% restSum(X, S) :- smallerCube(X, B), write(B).