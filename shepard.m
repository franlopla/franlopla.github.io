function pz=shepard(X,Y,Z,px,py,alpha)
% ENTRADAS:
% X: vector de nodos
% F: vector de valores a interpolar
% x: punto o vector donde queremos evaluar el polinomio
% (px,py): punto o vector donde queremos evaluar el polinomio
% alpha: parametro q tomamos en la formula de shepard
% SALIDA:
% pz: valor que devuelve el metodo

% En este caso la longitud del vector X (o Y) coincide con la de Z 
% En la fórmula original de Shepard se toma alpha=2.
dist=sqrt((px-X).^2+(py-Y).^2);
% Si la distancia es cero le damos el valor que aparece en los datos
if min(dist)==0
    idx=find(dist==0, 1);
        pz=Z(idx);
else
    pesos=1./(dist.^alpha);
    pz=sum(pesos.*Z)/sum(pesos);
end