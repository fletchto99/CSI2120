tree(X) :- X = t(73,
                    t(31, 
                        t(5,
                            nil,
                            nil
                        ), 
                        nil
                    ), 
                    t(101, 
                        t(83, 
                            nil, 
                            t(97,
                                nil,
                                nil
                            )
                        ), 
                        t(2016,
                            nil,
                            nil
                        )
                    )
                ).

% Predicate to initiate recursion, ensures parameters are in right order
lca(K1, K2, T) :- K1 > K2, lcaRecurse(K2, K1, T), !.
lca(K1, K2, T) :- K2 > K1, lcaRecurse(K1, K2, T), !.

% Base case
lcaRecurse(K1, K2, t(Current, Left, Right)) :- Current >= K1, Current =< K2, write(t(Current, Left, Right)), !.

% Recursive case for both left and right nodes
lcaRecurse(K1, K2, t(Current, Left, _)) :- Current > K2, lcaRecurse(K1, K2, Left), !.
lcaRecurse(K1, K2, t(Current, _, Right)) :- Current < K1, lcaRecurse(K1, K2, Right), !.