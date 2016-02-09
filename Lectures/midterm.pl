% What will be printed by the following query? Give all answers including backtracking.

rail('Jasper','Prince George').
rail('Prince George', 'Quesnel').
rail('Quesnel','Whistler').
rail('Whistler','Vancouver').
rail('Vancouver','Kamloops').
rail('Kamloops','Jasper').
rail('Kamloops','Banff').
rail('Banff','Calgary').
rail('Calgary','Edmonton').
rail('Edmonton','Jasper').

ride(X,Y) :- rail(X,Y).
ride(X,Y) :- rail(Y,X).

train_ride(X,Y) :- write(X),write(' '),
		   train(X,Y,[X]), !. 


train(X,Y,_) :- ride(X,Y),
		write(Y),!.

train(X,Y,L) :- ride(X,Z),
		\+member(Z,L),
		write(Z),write(' '),
		train(Z,Y,[Z|L]).

% ?- train_ride('Vancouver','Quesnel').


% Complete the predicate below. (You are not allowed to change the order).
app(mail).
app(calendar).
app(image_viewer).
app(browser).
graphics3D(image_viewer).
slow(calendar).
coded(mail,prolog).
coded(browser,go).
coded(calendar,prolog).

likes(jane,X) :- app(X), neat(X).

%neat(X) :- slow(X), !, fail. % To be added
neat(X) :- graphics3D(X).
neat(X) :- coded(X,prolog).






% Tree

traversal(nil).

traversal(t(Root,Left,Right)) :-
    traversal(Left),
    traversal(Right),
    write(Root),
    write(' ').


rmm(t(M, Left, nil), Left, M).
rmm(t(Root, Left, Right),
    t(Root, Left, RightS), M) :- rmm(Right, RightS, M).



tree(X) :- X =
	   t(25, 
	     t(20, 
	       t(12, 
		 t(5,nil, nil), 
		 t(15,nil,nil)),
	       t(23,nil,nil)),
	     t(28, 
	       t(24, nil, nil),
	       nil)).


inorder(nil).

inorder(t(Root,Left,Right)) :-
    inorder(Left),
    write(Root),
    write(' '),
    inorder(Right).

%?- tree(X), inorder(X).
%?- tree(X), traversal(X).

%?- tree(X), rmm(X,Y,Z).


% Search tree and the cut

artist( 'Lucas' ).
artist( 'Charlotte' ).
% artist( 'Jacob' ).
developer( 'Mia' ).
developer( 'Sophia' ).
% developer( 'Sophia' ) :- !.
developer( 'Mason' ).
game( 'Minecraft' ).
game( 'Doom' ).
game( 'Pong' ).

team( A, B ) :- artist(A),
		developer(B).

team( A, B ) :- developer(A),
		artist(B).


design( A, B, C ) :- team( A, B ),
		     not(game( C )).



% ?- design( 'Charlotte', D, 'Secret'). 

% Insert a cut such that whenever Sophia is seleceted as a developer, no other developer will be considered during backtracking. 


 
% Replace every entry in the list with the sum up to and including the
% current element.
% What predicate(s) gives the correct answer?  
rSum( L, R  ) :- rSum( L, 0, R ).

rSum( [], _ , []).

rSum( [H|T], S, [RH|RT] ) :-  RH is S+H,
			      rSum( T, RH, RT ).  


rSumR( L, R  ) :- rSumR( L, 0, [], R ).

rSumR( [], _ , R, R) :- !.

rSumR( [H|T], S, L, R ) :-  RH is S+H,
			    rSumR( T, RH, [RH|L], R ).  

% 

vegetarian( 'Salad rolls', 8.5 ).
% vegetarian( 'Tofuburger and mixed salad', 10.0 ).
meat( 'Hamburger and fries', 10.0 ).
meat( 'Cheeseburger and ceasar salad', 12.5 ).
meat( 'Steak on a bun', 12.5 ).
fish( 'Fish and chips', 12.5 ).

meal( X, P ) :- vegetarian( X, P ).
meal( X, P ) :- meat( X, P ).
meal( X, P ) :- fish( X, P ).


orderForTwo( X,Y,P ) :- meal( X, P1 ),
			meal( Y, P2 ),
			P >= P1 + P2.

% ?- findall( X, orderForTwo( X,Y,18.5), L ).
% ?- setof( X, Y^orderForTwo( X,Y,18.5), L ).
% ?- bagof( (X,Y), orderForTwo( X,Y,18.5), L ).
