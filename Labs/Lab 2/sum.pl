%sum_int(3, X) ... X is 6
sum_int(N, X) :- N =:= 0, X is 0.
sum_int(N, X) :- N > 0, sum_int(-(N, 1), Y), X is Y + N.