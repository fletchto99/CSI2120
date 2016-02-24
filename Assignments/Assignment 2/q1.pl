% PART A -- Database

person(jules).
person(gilles).
person(jean).
person(joe).
person(ghislain).

occupation(mason).
occupation(plasterer).
occupation(carpenter).
occupation(tinsmith).
occupation(roofer).

player(ghislain, O, 72) :- !, 
                        occupation(O).

player(gilles, O, 82) :- !, 
                    occupation(O).

player(N, O, S) :- person(N), 
                occupation(O), 
                score(S).

% Use the built in between predicate to generate numbers, then multiply by 2 to get only the even numbers
score(S) :- between(32, 42, N), 
            S is N * 2.

% PART B -- Constraints

constraintRoofer(player(N, roofer, 74)) :- N \= ghislain, 
                                        !.
constraintRoofer(player(_, O, _)) :- O \= roofer.

constraintMason(player(N, mason, 70)) :- N \= gilles, 
                                        !.
constraintMason(player(_, O, _)) :- O \= mason.

constraintTinsmith(player(N, tinsmith, S), player(joe, O, Js)) :- N \= joe,
                                                                O \= tinsmith, 
                                                                S is Js - 4,
                                                                S >= 64,
                                                                !.
constraintTinsmith(player(_, O, _), player(_, _, _)) :- O \= tinsmith.                                                  

constraintCarpenter(player(N, carpenter, S), player(jules, O, Js)) :- N \= jules, 
                                                                    O \= carpenter, 
                                                                    S is Js + 8,
                                                                    S =< 84,
                                                                    !.
constraintCarpenter(player(_, O, _), player(_, _, _)) :- O \= carpenter.


% Create the constraints to be a winner, due to the previous constraints given we can immediatley eliminate some names
constraintWin(player(N, tinsmith, S), S1, S2, S3, S4) :- N \= jules, 
                                        N \= joe,
                                        N \= ghislain,
                                        N \= gilles, 
                                        S < 70,
                                        S < S1,
                                        S < S2,
                                        S < S3,
                                        S < S4,
                                        !.
constraintWin(player(_, O, _), _, _, _, _) :- O \= tinsmith.

% PART C -- Scores predicate

scores(player(N1, O1, S1), player(N2, O2, S2), player(N3, O3, S3), player(N4, O4, S4), player(N5, O5, S5)):-
    % Generate all possible combinations of scores and occupations for each player
    player(N1, O1, S1),
    player(N2, O2, S2),
    player(N3, O3, S3),
    player(N4, O4, S4),
    player(N5, O5, S5),

    % Ensure none of the players have the same occupation, since occupation -> people is a 1-1 relationship
    O1 \= O2,
    O1 \= O3,
    O1 \= O4,
    O1 \= O5,
    O2 \= O3,
    O2 \= O4,
    O2 \= O5,
    O3 \= O4,
    O3 \= O5,
    O4 \= O5,

    % Check the roofer constraint for each of the players
    constraintRoofer(player(N1, O1, S1)),
    constraintRoofer(player(N2, O2, S2)),
    constraintRoofer(player(N3, O3, S3)),
    constraintRoofer(player(N4, O4, S4)),
    constraintRoofer(player(N5, O5, S5)),

    % Check the mason constraint for each player
    constraintMason(player(N1, O1, S1)),
    constraintMason(player(N2, O2, S2)),
    constraintMason(player(N3, O3, S3)),
    constraintMason(player(N4, O4, S4)),
    constraintMason(player(N5, O5, S5)),

    % check the tinsmith constraint for each player, we know the second player parameter will be joe due to the constraints
    constraintTinsmith(player(N1, O1, S1), player(joe, O4, S4)),
    constraintTinsmith(player(N2, O2, S2), player(joe, O4, S4)),
    constraintTinsmith(player(N3, O3, S3), player(joe, O4, S4)),
    constraintTinsmith(player(N5, O5, S5), player(joe, O4, S4)),

    % check the carpenter constraint for each player, we know the second player parameter will be jules due to the constraints
    constraintCarpenter(player(N2, O2, S2), player(jules, O1, S1)),
    constraintCarpenter(player(N3, O3, S3), player(jules, O1, S1)),
    constraintCarpenter(player(N4, O4, S4), player(jules, O1, S1)),
    constraintCarpenter(player(N5, O5, S5), player(jules, O1, S1)),

    % Check the win constrain for every possible player
    constraintWin(player(N1, O1, S1), S2, S3, S4, S5),
    constraintWin(player(N2, O2, S2), S1, S3, S4, S5),
    constraintWin(player(N3, O3, S3), S1, S2, S4, S5),
    constraintWin(player(N4, O4, S4), S1, S2, S3, S5),
    constraintWin(player(N5, O5, S5), S1, S2, S3, S4),

    % Cut since we know only one solution is possible
    !.