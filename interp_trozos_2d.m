function pz=interp_trozos_2d(X,Y,Z,px,py)
% ENTRADAS:
% X: coordenadas del eje X para los nodos a interpolar
% Y: coordenadas del eje Y para los nodos a interpolar
% Z: vector de valores a interpolar
% (px,py): punto o vector donde queremos evaluar el polinomio
% SALIDAS:
% pz: valor resultante de evaluar el polinomio en el putno (x,y)

if px<min(X)||px>max(X)||py<min(Y)||py>max(Y)
    error('El punto se encuentra fuera del dominio de interpolacion');
end
% Buscamos en que celda se encuentra el punto de interes y aplicamos
% interpolacion bilineal
i=busqueda_index(X,px);
j=busqueda_index(Y,py);
% Aplicamos interpolacion bilineal
X_bilineal=[X(i), X(i+1)];
Y_bilineal=[Y(j), Y(j+1)];
Z_bilineal(1,1)=Z(i,j);
Z_bilineal(1,2)=Z(i,j+1);
Z_bilineal(2,1)=Z(i+1,j);
Z_bilineal(2,2)=Z(i+1,j+1);
pz=interp_bilineal2(X_bilineal, Y_bilineal, Z_bilineal, px, py);
end