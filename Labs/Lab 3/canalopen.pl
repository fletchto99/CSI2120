
canalOpen(saturday).
canalOpen(monday).
canalOpen(tuesday).

raining(saturday).

melting(saturday).
melting(sunday).
melting(monday).

winterlude(X) :- canalOpen(X), checkDay(X).
checkDay(X) :- raining(X), melting(X), !, fail.
checkDay(X) :- not(raining(X)), not(melting(X)).
