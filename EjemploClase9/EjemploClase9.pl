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


%%%%%%REGLAS
%Regla para saber si un objeto es una instancia de una clase en concreto
es(Clase, Obj):-instancia_de(Obj, Clase).
es(Clase, Obj):-instancia_de(Obj, Clasep),
                subc(Clasep, Clase).


%Regla para saber si una clase es subclase de otra
subc(C1, C2):-subclase_de(C1,C2).
subc(C1, C2):-subclase_de(C1,C3),
              subc(C3,C2).


%Regla para saber las propiedades de un objeto
propiedad(Obj,Prop):-es(Clase,Obj),
                     tiene_propiedad(Clase,Propiedad,Clase2),
                     Prop =.. [Propiedad, Clase2].
