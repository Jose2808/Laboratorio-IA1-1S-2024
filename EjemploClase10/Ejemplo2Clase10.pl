%instancia_de(Objeto, Clase)
instancia_de(aorta, arteria_grande).
instancia_de(arteria_pulmonar_izquierda, arteria_grande).
instancia_de(arteria_braquial_izquierda, arteria_grande).
instancia_de(corazon, sistema_cardiobascular).


%subclase_de(Subclase, clase)
subclase_de(arteria_grande, arteria).
subclase_de(arteria_pequenia, arteria).
subclase_de(arteria, vasos_sanguineos).
subclase_de(vasos_sanguineos, sistema_cardiovascular).


%tiene_propiedad(Clase1, propiedad, Clase2)
tiene_propiedad(arteria,existen,100).
tiene_propiedad(arteria,pared,muscular).
tiene_propiedad(arteria,rica_oxigeno,sangre).
tiene_propiedad(arteria,pobre_oxigeno,sangre).


%indicar propiedades incompatibles
incompatible(pobre_oxigeno(X), rica_oxigeno(X)).


%%%%%%REGLAS
%Regla para saber si un objeto es una instancia de una clase en concreto
es(Clase, Obj):-instancia_de(Obj, Clase).
es(Clase, Obj):-instancia_de(Obj, Clasep),
                subc(Clasep, Clase).

es(Clase, Obj, 0):-instancia_de(Obj,Clase).
es(Clase, Obj, Prio):-instancia_de(Obj,Clasep),
                      subcn(Clasep, Clase, Prio).


%Regla para saber si una clase es subclase de otra
subc(C1, C2):-subclase_de(C1,C2).
subc(C1, C2):-subclase_de(C1,C3),
              subc(C3,C2).

subcn(C1,C2,1):-subclase_de(C1,C2). 
subcn(C1,C2,N):-subclase_de(C1,C3),
                subcn(C3,C2,M), N is M + 1.

%Regla para obtener las propiedades de un objeto
propiedad(Obj, Prop, Prio):-es(Clase,Obj,Prio),
                            tiene_propiedad(Clase,Fun,Arg),
                            Prop =.. [Fun,Arg].

propiedad(Obj, Prop):-propiedad(Obj,Prop,Prio),
                      \+ incomp(Obj,Prop,Prio).


incomp(Obj,Prop,Prio):-incompatible(Prop,Propp),
                       propiedad(Obj, Propp, Priop),
                       Priop =< Prio.