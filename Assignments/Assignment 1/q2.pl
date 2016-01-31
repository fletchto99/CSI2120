%% A %%
cubeLess(X, B, R) :- R is (B - (X^3)), R >= 0.

%% B %%
smallerCube(X, B) :- var(X), smallerCube(1, B).
smallerCube(X, B) :- nonvar(X), cubeLess(X, B, R), Next is X+1, writef('%w rest %w \r\n', [X, R]), smallerCube(Next, B).

%% C %%
%% restSum(B, S) :- 