interval(X,X,H) :- X=<H.
interval(X,L,H) :- L<H,interval(X,+(L,1),H).