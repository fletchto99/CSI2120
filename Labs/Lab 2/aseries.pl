aseries(X, Y) :- X =:= 1, Y is 3.
aseries(X, Y) :- 
                X > 1,
                aseries(-(X, 1), Z),
                M is -5,
                mod(X, 2) =:= 0 -> M is 5,
                Y is M * Z.