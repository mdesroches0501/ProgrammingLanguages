
isSet(L) :- duplicate(L, []),!.
duplicate([],_) :- !.
duplicate([Head|_],List) :- member(Head,List), !, fail.
duplicate([Head|Tail],List) :- duplicate(Tail,[Head|List]).


subset([],_).
subset([A|S],K) :- member(A,K), subset(S,K), !.


union([],B,B).
union([X|A],B,[X|C]) :- not(member(X,B)), union(A,B,C).
union([X|A],B,C) :- member(X,B), union(A,B,C).

intersection([],_,[]).
intersection([X|A],B,[X|C]) :- member(X,B), intersection(A,B,C).
intersection([_|A],B,C) :- intersection(A,B,C).

tally(_,[],0).
tally(E,[E|L],N) :- tally(E,L,M), N is M+1.
tally(E,[F|L],N) :- not(E=F), tally(E,L,N).

and(A,B) :- call(A), call(B).
or(A,_) :- A, !.
or(_,B) :- B.
nand(A,B) :- not(and(A,B)).
nor(A,B) :- not(or(A,B)).
equ(A,B) :- or(and(A,B), and(not(A),not(B))).
xor(A,B) :- not(equ(A,B)).


gcd(0,X,X) :- X > 0, !.
gcd(X,Y,G) :- X >= Y, X1 is X-Y, gcd(X1,Y,G).
gcd(X,Y,G) :- X < Y, X1 is Y-X, gcd(X1,X,G).


flatten(A,B) :- flatten(A,[],B).
flatten(Var, T, [Var|T]) :- var(Var), !.
flatten([],T,T) :- !.
flatten([H|T],TailList,List) :- !, flatten(H,FlatTail,List), flatten(T,TailList,FlatTail).
flatten(NonList,T,[NonList|T]).
