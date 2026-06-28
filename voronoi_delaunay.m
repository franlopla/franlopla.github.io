% Especificamos el numero de vertices
rng(1);
N=20;
x=rand(1,N);
y=rand(1,N);

figure('Name','Diagrama de Voronoi');
hold on;
% Utilizamos la funcion de matlab que genera el diagrama de Voronoi
voronoi(x,y);
plot(x, y, 'r.','MarkerSize',15);
%%
rng(1);

N=20;
x=rand(1,N);
y=rand(1,N);

figure('Name','Triangulación de Delaunay');
hold on;
v=voronoi(x,y);
v(2).Color=[0.8 0.8 0.8];
% Utilizamos la funcion de matlab que devuelve la matriz en la que se
% determina los triangulos de la triangulacion
T=delaunay(x,y);
% Utilizamos la matriz triplot de matlab que dibuja las lineas que unen los
% vertices de la triangulacion utilizando la matriz T
d=triplot(T,x,y);
d.Color='b';
plot(x,y,'r.','MarkerSize',15);


