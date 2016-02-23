tree(T) :- T = t(73, 
                t(31, 
                    t(5, 
                        nil, 
                        nil
                    ), 
                    nil
                ), 
                t(101, 
                    t(83, 
                        t(97, 
                            nil, 
                            nil
                        ), 
                        nil
                    ), 
                    nil
                )
            ).

levelPrint(T, D) :- levelPrint(T, 1, D).

levelPrint(t(Root,_,_),D,D) :- write(Root), write('\t'), !.
levelPrint(nil,_,_).
levelPrint(t(_,Left,Right),L,D) :- L \= D, LL is L + 1, levelPrint(Left, LL, D), levelPrint(Right, LL, D).