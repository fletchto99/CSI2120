tree(X) :- X = t( 2, 
                    nil, 
                    t(3, 
                        nil, 
                        nil
                    )
                ).

leafNodes(T, L) :- leafNodes(T, [], L).
leafNodes(nil, _, _) :- !.
leafNodes(t(Root, nil, nil), L, [Root|L]) :- !.
leafNodes(t(_, Left, Right), L, LL) :- leafNodes(Left, L, LI), leafNodes(Right, LI, LL).