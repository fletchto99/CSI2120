%% ?- maxmin([3,1,5,2,7,3],Max,Min).
%% Max = 7
%% Min = 1

%% ?- maxmin([2],Max,Min).
%% Max = 2
%% Min = 2

maxmin([H|T], Max, Min) :- maxmin(T, H, H, Max, Min), !.

maxmin([], Max, Min, Max, Min). %% Basecase, the list is empty

maxmin([H|T], X, Y, Max, Min) :- findMax(H, X, Mx), findMin(H, Y, My), maxmin(T, Mx, My, Max, Min).

findMax(H, Max, H) :-  H > Max, !.
findMax(H, Max, Max) :-  H =< Max.

findMin(H, Min, H) :- H < Min, !.
findMin(H, Min, Min) :- H >= Min.