:- discontiguous even/1.
even(0).
odd(N) :- N>0, M is N-1, even(M).
even(N) :- N>0, M is N-1, odd(M).