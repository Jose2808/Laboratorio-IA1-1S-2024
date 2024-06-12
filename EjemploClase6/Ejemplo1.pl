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