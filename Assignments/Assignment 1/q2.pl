%% A %%
cubeLess(X, B, R) :- R is (B - (X^3)), R >= 0.

%% B %%
smallerCube(_, B) :- smallerCubeRecurse(1, B).
smallerCubeRecurse(X, B) :- cubeLess(X, B, R), Next is X+1, writef('%w rest %w \r\n', [X, R]), smallerCubeRecurse(Next, B).

%% C %%
restSum(B, S) :- Start is floor(B^(1/3)), restSum(B, Start, S).
restSum(_, 0, 0).
restSum(B, Start, S) :- Start > 0, cubeLess(Start, B, R), NextStart is Start - 1,  restSum(B, NextStart, Sum), S is Sum + R.