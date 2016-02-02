%% A %%
cubeLess(X, B, R) :- R is (B - (X^3)), R >= 0.

%% B %%
smallerCube(_, B) :- smallerCubeRecurse(1, B).
smallerCubeRecurse(X, B) :- cubeLess(X, B, R), Next is X+1, writef('%w rest %w \r\n', [X, R]), smallerCubeRecurse(Next, B).

%% C %%
restSum(B, S) :- Start is floor(B^(1/3)), restSum(B, Start, S), !.
restSum(_, 0, 0).
restSum(B, Start, S) :- Start > 0, cubeLess(Start, B, R), NextStart is Start - 1,  restSum(B, NextStart, Sum), S is Sum + R, !.

%% For mathmatical nerds who like to cheat :P %%
cheatSum(B, S) :- N is floor(B^(1/3)), S is (N*B - ((1/4)*((N)^2)*((N+1)^2))).

%% D %%
showAllRestSum(L, H) :- L < H, restSum(L, S), M is mod(S, 3), M =:= 0, writef('%w rest %w \r\n', [L, S]), Next is L + 1, showAllRestSum(Next, H), !.
showAllRestSum(L, H) :- L < H, restSum(L, S), M is mod(S, 3), M \= 0, Next is L + 1, showAllRestSum(Next, H), !.
showAllRestSum(L, H) :- L =:= H, !.