route('Windsor', 'Toronto',bus). 
route('Windsor', 'Burlington',bus). 
route('Toronto', 'NorthBay',bus). 
route('Toronto', 'Ottawa',bus). 
route('Toronto', 'Kinsgston', boat). 
route('Kinsgston', 'Ottawa',boat). 

% Is there a connection from Windsor to Ottawa?
% Is there a connection to Quebec City?
% Print all cities on-route from Toronto to Ottawa.
% Is there an acceptable connection from Burlington to Ottawa? (For this query a route is acceptable if it is entirely by bus or entirely by boat).

connected(X, Y) :- route(X, Y, _).
connected(X, Y) :- route(Y, X, _).
connected(X, Y) :- route(X, Z, _), connected(Z, Y).