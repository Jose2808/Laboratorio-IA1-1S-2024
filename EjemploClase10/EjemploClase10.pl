%%%%%%HECHOS
%instancia_de(Objeto, Clase)
instancia_de(tweety, canario).
instancia_de(pedro, halcon).
instancia_de(juan, halcon).
instancia_de(juancho, cocodrilo).
instancia_de(pancho, pinguino).

%subclase(Subclase, Clase)
subclase_de(ave, oviparo).
subclase_de(reptil, oviparo).
subclase_de(canario, ave).
subclase_de(halcon, ave).
subclase_de(ave, animal).
subclase_de(reptil, animal).
subclase_de(cocodrilo, reptil).
subclase_de(pinguino, ave).

%tiene_propiedad(Clase1, propiedad, Clase2)
tiene_propiedad(canario, come, semillas).
tiene_propiedad(ave,tiene,alas).
tiene_propiedad(ave,tiene,plumas).
tiene_propiedad(ave,puede,volar).
tiene_propiedad(reptil,tiene,escamas).
tiene_propiedad(oviparo, pone, huevos).
tiene_propiedad(pinguino, no_puede, volar).

incompatible(puede(X), no_puede(X)).

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