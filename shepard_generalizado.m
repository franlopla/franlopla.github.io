function pz=shepard_generalizado(X,Y,Z,px,py,W,L)
% ENTRADAS:
% X: vector de nodos
% F: vector de valores a interpolar
% (px,py): punto o vector donde queremos evaluar el polinomio
% SALIDA:
% pz: valor que devuelve el metodo

% En este caso la longitud del vector X (o Y) coincide con la de Z 
dist=sqrt((px-X).^2+(py-Y).^2);
pesos=W(dist/L);
if sum(pesos)<1e-12
    pz=0; % Por si (px,py) está muy lejos de nuestros datos y el sumatorio es cero
else
    pz=sum(Z.*pesos)/sum(pesos);
end
end
