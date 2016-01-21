parent( marie, robert ).
parent( paul, robert ).
parent( paul, emma ).
parent( robert, vickie ).
parent( robert, anne ).
parent( robert, gail ).
parent( robert, stan ).
parent( stan, jack ).
female(marie).
female(emma).
female(gail).
female(anne).
female(vickie).

sister(X, Y) :- parent(Z, X), parent(Z, Y), female(X).

% sister(X,gail).