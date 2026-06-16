function pz=interp_polinomica_2d(X,Y,Z,px,py)
% ENTRADAS:
% X: coordenadas del eje X para los nodos a interpolar
% Y: coordenadas del eje Y para los nodos a interpolar
% Z: vector de valores a interpolar
% (px,py): punto o vector donde queremos evaluar el polinomio
% SALIDAS:
% pz: valor resultante de evaluar el polinomio en el punto (x,y)

if px<min(X)||px>max(X)||py<min(Y)||py>max(Y)
    error('El punto se encuentra fuera del dominio de interpolacion');
end
z=zeros(size(Y));
% Realizamos m+1 interpolaciones (considerando m la longitud del vector Y)
% a lo largo de las rectas  y=y_j
for i=1:length(Y)
    z(i)=interpol(X,Z(:,i),px);
end
% Realizamos una ultima interpolacion a lo largo del eje Y
pz=interpol(Y,z,py);
end