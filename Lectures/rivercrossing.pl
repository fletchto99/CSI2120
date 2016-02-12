initial(state([left,left,left,left])).
final(state([right,right,right,right])).

cross(state([left, X, Y, Z]), state([right, X, Y, Z]), farmer_cross).
cross(state([right, X, Y, Z]), state([left, X, Y, Z]), farmer_returns).

cross(state([left, left, Y ,Z]), state([right, right, Y, Z]), farmer_brings_fox).
cross(state([right, right, Y ,Z]), state([left, left, Y, Z]), farmer_returns_fox).

cross(state([left, X, left, Z]), state([right, X, right, Z]), farmer_brings_chicken).
cross(state([right, X, right, Z]), state([left, X, left, Z]), farmer_returns_chicken).

cross(state([left, X, Y, left]), state([right, X, Y, right]), farmer_brings_bag_of_rice).
cross(state([right, X, Y, right]), state([left, X, Y, left]), farmer_returns_bag_of_rice).

forbidden(state([right, left, left, _])).
forbidden(state([left, right, right, _])).
forbidden(state([X, Y, Y, _])) :- X \== Y.
forbidden(state([X, _, Y, Y])) :- X \== Y.

crossRiver(A, A, _, []).
crossRiver(A, B, V, P) :- cross(A, C, Action), not(forbidden(C)), not(member(C, V)), crossRiver(C, B, [C|V], Plan), P = [Action|Plan].

puzzle(P) :- initial(StartState), final(EndState), crossRiver(StartState, EndState, [StartState], P).