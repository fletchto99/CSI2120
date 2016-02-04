sortList([],[]).
sortList([P|Q], T) :- partitionList(P,Q,G,D),
                    sortList(G, GG),
                    sortList(D, DD),
                    append(GG, [P|DD],T).
partitionList(P, [X|L], [X|PG], PD) :- X @< P,
                                    partitionList(P,L,PG,PD).
partitionList(P, [X|L], PG, [X|PD]) :- X @>= P,
                                    partitionList(P,L,PG,PD).
partitionList(_, [], [], []).
