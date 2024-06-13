age :- 
    write('Que edad tienes? '), nl,
    read(Age), nl,
    write('Tu tienes '), write(Age), write(' anios').


% cube :-
%     write('Escribe un numero '), nl,
%     read(Number), nl,
%     Res is Number*Number*Number,
%     write('El cubo del numero ingresado '), write(Number), write(' es: '), write(Res).


count_to_ten(N) :- N >= 10, write(10).
count_to_ten(N) :-
    write(N),nl,
    X is N + 1,
    count_to_ten(X).


loop(1) :- write(1).
loop(N) :-
    N > 1,
    write(N),nl,
    X is N - 1,
    loop(X).


words :- 
    write('Escribe una palabra: '), read(X),nl,
    (X=end;words).


cube(21).
cube(N) :-
    Res is N*N*N, nl,
    write('El cubo de: '), write(N), write(' es '), write(Res),
    X = N + 1,
    cube(X).