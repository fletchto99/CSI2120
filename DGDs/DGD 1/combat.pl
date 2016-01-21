combat(paul,pierre).
combat(jean,simon).
combat(jean,pierre).
allies(X,Y):-combat(X,Z),combat(Y,Z).

% ?- allies(X,Y).