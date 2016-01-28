aseries(1, 3).
aseries(X, Y) :- 
                X > 1,
                XX is X - 1,
                aseries(XX, Z),
                (mod(X, 2) =:= 1 -> Y is -5 * Z; Y is 5 * Z).