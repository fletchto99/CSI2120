%% A %%
cubeLess(X, B, R) :- R is (B - (X^3)), R >= 0.

%% B %%
smallerCube(_, B) :- smallerCubeRecurse(1, B).
smallerCubeRecurse(X, B) :- cubeLess(X, B, R), Next is X+1, writef('%w rest %w \r\n', [X, R]), smallerCubeRecurse(Next, B).

%% %% C %%
%% restSum(B, S) :- restSumRecurse(1, B, 0).
%% restSumRecurse(X, B, S) :- cubeLess(X, B, R), Next is X+1, NextSum is R + S, restSumRecurse(Next, B, NextSum).

restSum(B, S) :- Start is floor(B^(1/3)), restSumRecurse(B, Start, S).
restSumRecurse(B, Start, S) :- Start > 0, NextStart is Start - 1, cubeLess(Start, B, R), restSumRecurse(B, NextStart, S), S is R.