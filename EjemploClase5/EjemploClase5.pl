% Comentarios inician con %
% Instrucciones finalizan con .
% Variables inician con may�scula
% Atmos inician con min�scula

%Hechos

stock(etp, 'Energy Transfer Partners, L.P', 15.93).
stock(jpm, 'JPMorgan Chase &amp; Co.', 107.52).
stock(bab, 'AAlibaba Group Holding Limited', 172.15).
stock(kmi, 'Kinder MOrgan, Inc.', 14.75).
stock(avgo, 'Broadcom Limited', 15.93).
stock(feye, 'FireEye, Inc.', 16.80).
stock(sep, 'Spectra Energy Prtners, LP', 15.93).
stock(ddd, '3D Systems 0', 11.082).
stock(ihrt, 'iHeartMedia, INC.', 0.52).
stock(sjm, 'The J. M. Smucker company', 15.93).


%Reglas
%Gui�n bajo significa que no me importa el valor que tenga
price(Symbol, Price) :- stock(Symbol, _Name, Price),price(Symbol, Price).
name(Symbol, Name) :- stock(Symbol, Name).


