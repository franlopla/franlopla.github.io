function pz=triangulacion(X,Y,Z,px,py)
% ENTRADAS:
% X: coordenadas del eje X para los nodos a interpolar
% Y: coordenadas del eje Y para los nodos a interpolar
% Z: vector de valores a interpolar
% (px,py): punto o vector donde queremos evaluar el polinomio
% SALIDAS:
% pz: valor resultante de evaluar el polinomio en el punto (x,y)

% Utilizamos la funcion de matlab que genera la triangulacion de Delaunay a
% partir de unos puntos.
DT=delaunayTriangulation(X,Y);

% Buscamos el indice del triangulo que contiene al punto (px,py)
idx_triang=pointLocation(DT,px,py);

if isnan(idx_triang)
    error('El punto se encuentra fuera del dominio de interpolacion');
end

% Buscamos los indices de los vertices del triangulo
idx_vertices=DT.ConnectivityList(idx_triang,:);

% Buscamos las coordenadas de los vertices
v1=DT.Points(idx_vertices(1),:);
v2=DT.Points(idx_vertices(2),:);
v3=DT.Points(idx_vertices(3),:);

% Guardamos en las variables z_i el valor de la funcion en dichos vertices
z1=Z(idx_vertices(1));
z2=Z(idx_vertices(2));
z3=Z(idx_vertices(3));

% Siguiendo la teoria construimos la matriz M y el vector de terminos
% independientes
M=[v1(1),v2(1),v3(1);
    v1(2),v2(2),v3(2);
    1.0,1.0,1.0];
b=[px;py;1];

% Obtenemos la solucion del sistema
lambda=M\b;

% Siguiendo la forma del polinomio interpolador evaluamos el punto
pz=lambda(1)*z1+lambda(2)*z2+lambda(3)*z3;
end