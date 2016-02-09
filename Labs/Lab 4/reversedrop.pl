reverseDrop([], _, R, R) :- !.

reverseDrop([H|T], N, I, R) :- N = 1, reverseDrop(T, 0, [H|I], R).
reverseDrop([_|T], N, I, R) :- N = 0, reverseDrop(T, 1, I, R).

reverseDrop(L, R) :- reverseDrop(L, 1, [], R).