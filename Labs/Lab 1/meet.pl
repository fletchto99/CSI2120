city(marie,ottawa).
city(hong,montreal).
city(amelie,ottawa). 
city(paul,kingston).
city(mohamed,ottawa).

available(marie,saturday). 
available(marie,sunday). 
available(hong,saturday).
available(paul,saturday).
available(paul,sunday).
available(mohamed,saturday).
available(mohamed,sunday).
available(amelie,sunday).

travel(hong,ottawa).
travel(hong,kingston).
travel(mohamed,kingston).
travel(amelie,montreal).

location(X,Y) :- 
        city(X,Y).
location(X,Y) :- 
        travel(X,Y).

meet(X,Y) :- 
        location(X,C),
        location(Y,C),
        X \= Y,
        available(X,D),
        available(Y,D).