masgrande(elefante, caballo).
masgrande(caballo, perro).
masgrande(perro, raton).

%masgrande(elefante,B)  %masgrande(caballo, perro)
%B = caballo
%muchomasgrande(A,C):-masgrande(A,B),masgrande(B,C).

muchomasgrande(A,B):-masgrande(A,B).
muchomasgrande(A,B):-masgrande(A,X), muchomasgrande(X,B).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
father(ruwee, padme).
father(anakin, luke).
father(anakin, leia).
father(han, ben).
father(jobal, padme).
mother(jobal, padme).
mother(shmi, anakin).
mother(padme, luke).
mother(padme, leia).
mother(leia, ben).

alias(darthvader, anakin).
alias(kyloren, ben).
alias(X,Y) :- alias(Y,X).

parent(X,Y):- father(X,Y).
parent(X,Y):- mother(X,Y).

childof(X,Y):- parent(Y,X).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
avg_temp(berlin, 49).
avg_temp(karlsruhe, 60).
avg_temp(paris, 55).
avg_temp(belgrade, 52).
avg_temp(chicago, 50).
avg_temp(boston, 48).
avg_temp(johannesburg, 55).
avg_temp(jerusalem, 61).
avg_temp(phoenix, 80).

avg_temp_celsius(City, C_temp) :-
    avg_temp(City, F_temp),
    C_temp is round((F_temp - 32)*5/9).


salir(City) :-
    avg_temp_celsius(City, Temp), Temp > 15.


same_temp(City1, City2) :-
    avg_temp(City1, Temp),
    avg_temp(City2, Temp),
    City1 \= City2.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

game(dbacks, 4, dodgers, 8).
game(falcons, 28, patriots, 34).
game(patriots, 10, dbacks, 8).

won(X) :- game(X, ScoreX, _Y, ScoreY), ScoreX > ScoreY.
won(Y) :- game(_X, ScoreX, Y, ScoreY), ScoreY > ScoreX.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%Par: [Head | Tail]
%Lista: [], [Head | [La cola es una lista]]

pairparts([H|T], H, T).

first([H|_T], H).

is_pair([_H|_T]).

%[a, [e, [i, [o, []]]]]
%[a,e,i,o]
%[i,o]
%[o]
%[]


%Par: [1|2] = 1,2
%Lista: [1,2] = [1, [2, []]]
is_list([]).
is_list([_H|T]) :- is_list(T).

at_least_two_in_list([_,_|_T]).
at_least_two_in_list([A,B|_T], [A, B]).
at_least_two_in_list([A,B|_T], A, B).

at_least_four_in_list([_,_,_,_|_T]).

third_element([_,_,B|_T], B).

%[1, [2, []]]

%H2 = 2
%T=[2,[]]
%R = [2. [4, []]]

%H2 = 4
%T = []
%R = [4, []]

double_list([],[]).
double_list([H | T], [H2, T2]) :- H2 is H*2, double_list(T, T2).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
factorial(1,1). %caso base :1! = 1
%                          N1 = N - 1      (N-1)!         N*(N-1)!
factorial(N,R) :- N > 1, N1 is N - 1, factorial(N1,R1), R is N*R1. 


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
edge(a,b).
edge(a,c).
edge(b,d).
edge(c,d).
edge(c,f).
edge(d,e).
edge(f,g).
edge(g,h).
edge(i,j).

connected(Nodo1, Nodo2) :- edge(Nodo1, Nodo2).
connected(Nodo1, Nodo2) :- edge(Nodo1, NodoX), connected(NodoX, Nodo2).