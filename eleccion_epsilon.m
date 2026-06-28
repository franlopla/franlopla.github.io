%% Experimentamos con el parametro de la gaussiana 
rng(1);
% Generamos valores aleatorios en el intervalo [-1,1]
X_datos=-5+10.*rand([150,1]);
Y_datos=-5+10.*rand([150,1]);
f=@(x,y)1./(1+x.^2+y.^2);
Z_datos=f(X_datos,Y_datos);

% Especificamos el valor de epsilon y la funcion de base
% radial que vamos a utilizar
epsilon=1; 
rbf=@(r)exp(-(epsilon*r).^2); % Función Gaussiana

% Calculamos la matriz de distancias
r=sqrt((X_datos-X_datos').^2+(Y_datos-Y_datos').^2);

% Obtenemos la matriz de interpolacion y la solucion del sistema
A=rbf(r);
lambda=A\Z_datos;

% Creamos una malla 50x50
x_eval=linspace(-5,5,50);
y_eval=linspace(-5,5,50);
[X_malla,Y_malla]=meshgrid(x_eval,y_eval);
Z_exacta=f(X_malla,Y_malla);

% Numero de condicion
cond_A_gaussiana_1=cond(A);

% Aplicamos el interpolante visto en teoria
r_eval=sqrt((X_malla(:)-X_datos').^2+(Y_malla(:)-Y_datos').^2);
Z_interp=rbf(r_eval)*lambda;
Z_interp=reshape(Z_interp,size(X_malla));
error_gaussiana_1=Z_exacta-Z_interp;   
ecm_gaussiana_1=sqrt(mean(error_gaussiana_1(:).^2));
emax_gaussiana_1=max(abs(error_gaussiana_1(:)));

% Generamos la grafica marcando los nodos que queremos interpolar en rojo
% para comprobar que la superficie interpola a los nodos
figure('Name','Interpolacion rbf(gaussiana) epsilon=15');
hold on;
grid on;
surf(X_malla,Y_malla,Z_interp,'EdgeColor','none','FaceAlpha',0.8);
scatter3(X_datos,Y_datos,Z_datos,'MarkerEdgeColor','k','MarkerFaceColor','red');
colormap(parula); 
view(45,30);
%% Experimentamos con el parametro de la gaussiana 
rng(1);
% Generamos valores aleatorios en el intervalo [-1,1]
X_datos=-5+10.*rand([150,1]);
Y_datos=-5+10.*rand([150,1]);
f=@(x,y)1./(1+x.^2+y.^2);
Z_datos=f(X_datos,Y_datos);

% Especificamos el valor de epsilon y la funcion de base
% radial que vamos a utilizar
epsilon=15; 
rbf=@(r)exp(-(epsilon*r).^2); % Función Gaussiana

% Calculamos la matriz de distancias
r=sqrt((X_datos-X_datos').^2+(Y_datos-Y_datos').^2);

% Obtenemos la matriz de interpolacion y la solucion del sistema
A=rbf(r);
lambda=A\Z_datos;

% Creamos una malla 50x50
x_eval=linspace(-5,5,50);
y_eval=linspace(-5,5,50);
[X_malla,Y_malla]=meshgrid(x_eval,y_eval);
Z_exacta=f(X_malla,Y_malla);

% Numero de condicion
cond_A_gaussiana_1=cond(A);

% Aplicamos el interpolante visto en teoria
r_eval=sqrt((X_malla(:)-X_datos').^2+(Y_malla(:)-Y_datos').^2);
Z_interp=rbf(r_eval)*lambda;
Z_interp=reshape(Z_interp,size(X_malla));
error_gaussiana_1=Z_exacta-Z_interp;   
ecm_gaussiana_1=sqrt(mean(error_gaussiana_1(:).^2));
emax_gaussiana_1=max(abs(error_gaussiana_1(:)));

% Generamos la grafica marcando los nodos que queremos interpolar en rojo
% para comprobar que la superficie interpola a los nodos
figure('Name','Interpolacion rbf(gaussiana) epsilon=15');
hold on;
grid on;
surf(X_malla,Y_malla,Z_interp,'EdgeColor','none','FaceAlpha',0.8);
scatter3(X_datos,Y_datos,Z_datos,'MarkerEdgeColor','k','MarkerFaceColor','red');
colormap(parula); 
view(45,30);
%% Experimentamos con el parametro de la multicuadrica
rng(1);
X_datos=-5+10.*rand([150,1]);
Y_datos=-5+10.*rand([150,1]);
f=@(x,y)1./(1+x.^2+y.^2);
Z_datos=f(X_datos,Y_datos);

epsilon=15; 
rbf=@(r)sqrt(r.^2+epsilon^2); % Función multicuádrica

r=sqrt((X_datos-X_datos').^2+(Y_datos-Y_datos').^2);
A=rbf(r);
lambda=A\Z_datos;

x_eval=linspace(-5,5,50);
y_eval=linspace(-5,5,50);

[X_malla,Y_malla]=meshgrid(x_eval,y_eval);
Z_exacta=f(X_malla,Y_malla);

cond_A_multicuadrica_1=cond(A);

r_eval=sqrt((X_malla(:)-X_datos').^2+(Y_malla(:)-Y_datos').^2);
Z_interp=rbf(r_eval)*lambda;
Z_interp=reshape(Z_interp,size(X_malla));
error_multicuadrica_1=Z_exacta-Z_interp;   
ecm_multicuadrica_1=sqrt(mean(error_multicuadrica_1(:).^2));
emax_multicuadrica_1=max(abs(error_multicuadrica_1(:)));

figure('Name','Interpolacion rbf(multicuadrica) epsilon=1');
hold on;
grid on;
surf(X_malla,Y_malla,Z_interp,'EdgeColor','none','FaceAlpha',0.8);
scatter3(X_datos,Y_datos,Z_datos,'MarkerEdgeColor','k','MarkerFaceColor','red');
colormap(parula);
view(45,30);