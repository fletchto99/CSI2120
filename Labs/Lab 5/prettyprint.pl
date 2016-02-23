% ==========================================================================
% $Id: pptree.pl,v 1.2 2016/02/23 05:18:55 jlang Exp $
% CSI2120 example Code for lecture 7
% ==========================================================================
% (C)opyright:
%
%   Jochen Lang
%   SITE, University of Ottawa
%   800 King Edward Ave.
%   Ottawa, On., K1N 6N5
%   Canada. 
%   http://www.eecs.uottawa.ca/~jlang
% 
% Creator: jlang (Jochen Lang)
% Email:   jlang@eecs.uottawa.ca
% ==========================================================================
% $Log: pptree.pl,v $
% Revision 1.2  2016/02/23 05:18:55  jlang
% Created solutions
%
% ==========================================================================

% just for testing
treePP(X) :- X = t( 2, nil, t(3, nil, nil)).



writePlus(_,1) :- write('+--'),!. 

writePlus(L,M) :- writeDashL(L,1,M),
          write('+--+--'),!. 


writeDashL(L,M) :- MM is M+1, writeDashL(L,1,MM), !.

writeDashL(_,N,M) :- N+1 >= M, !.

writeDashL([N|T],N,M) :- !,
            write('|  '),
            NN is N+1,
            writeDashL(T,NN,M).
               
writeDashL(L,N,M) :- write('   '),
          NN is N+1,
          writeDashL(L,NN,M).


prettyTree(T) :- prettyTree(T,[],1).
prettyTree(nil, DD, LL) :- 
                      writePlus(DD, LL),
                      write(nil),
                      !.

prettyTree(t(Root,Left,Right),D,L) :- writePlus(D,L),
                      write(Root),
                      nl,
                      append(D,[L],DD),
                      LL is L+1,
                      writeDashL(DD,LL),
                      nl,
                      prettyTree(Left,DD,LL),
                      nl,
                      writeDashL(DD,LL),
                      nl,
                      prettyTree(Right,D,LL).
