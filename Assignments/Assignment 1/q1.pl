p1(X, Y) :- p3(X), p2(Y,X).
p2(X, Y) :- p3(X), p4(Y), X \= Y.
p3(a).
p3(b).
% p3(c).
% p3(d).
% p4(c).
p4(a).
p4(b).