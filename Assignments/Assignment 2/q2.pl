test(X) :- tree(X), lca(83, 2016, X). 

tree(X):- X = t (73, 
                    t (31, 
                        t(5,
                            nil,
                            nil
                        ), 
                        nil
                    ), 
                    t (101, 
                        t (83, 
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

lca(K1, K2, T) :-