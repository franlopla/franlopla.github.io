rng(1);
% Generamos valores aleatorios en el intervalo [-1,1]
X_datos=-1+2.*rand([50,1]);
Y_datos=-1+2.*rand([50,1]);
f=@(x,y)exp(-2.5^2.*(x.^2+y.^2)./2);
Z_datos=f(X_datos, Y_datos);

% Especificamos el valor de epsilon y la funcion de base
% radial que vamos a utilizar
epsilon=2; 
rbf=@(r)exp(-(epsilon*r).^2); % Función Gaussiana

% Calculamos la matriz de distancias
r=sqrt((X_datos-X_datos').^2 +(Y_datos-Y_datos').^2);

% Obtenemos la matriz de interpolacion y la solucion del sistema
A=rbf(r);
lambda=A\Z_datos;

% Creamos una malla 50x50
x_eval=linspace(-1,1,50);
y_eval=linspace(-1,1,50);
[X_malla,Y_malla]=meshgrid(x_eval,y_eval);

% Aplicamos el interpolante visto en teoria
r_eval=sqrt((X_malla(:)-X_datos').^2+(Y_malla(:)-Y_datos').^2);
Z_interp=rbf(r_eval)*lambda;
Z_interp=reshape(Z_interp,size(X_malla));

% Generamos la grafica marcando los nodos que queremos interpolar en rojo
% para comprobar que la superficie interpola a los nodos
figure('Name','Interpolacion rbf(gaussiana)');
hold on;
grid on;
surf(X_malla,Y_malla,Z_interp,'EdgeColor','none','FaceAlpha',0.8);
scatter3(X_datos,Y_datos,Z_datos,'MarkerEdgeColor','k','MarkerFaceColor','red');
colormap(parula); 
view(45,30);

%%
rng(1);
X_datos=-1+2.*rand([50,1]);
Y_datos=-1+2.*rand([50,1]);
f=@(x,y)exp(-2.5^2.*(x.^2+y.^2)./2);
Z_datos=f(X_datos, Y_datos);

epsilon=1; 
rbf=@(r)sqrt(r.^2+epsilon^2); % Función multicuádrica

r=sqrt((X_datos-X_datos').^2+(Y_datos-Y_datos').^2);
A=rbf(r);
lambda=A\Z_datos;

x_eval=linspace(-1,1,50);
y_eval=linspace(-1,1,50);

[X_malla,Y_malla]=meshgrid(x_eval,y_eval);

r_eval=sqrt((X_malla(:)-X_datos').^2+(Y_malla(:)-Y_datos').^2);
Z_interp=rbf(r_eval)*lambda;
Z_interp=reshape(Z_interp,size(X_malla));


figure('Name','Interpolacion rbf(multicuadrica)');
hold on;
grid on;
surf(X_malla,Y_malla,Z_interp,'EdgeColor','none','FaceAlpha',0.8);
scatter3(X_datos,Y_datos,Z_datos,'MarkerEdgeColor','k','MarkerFaceColor','red');
colormap(parula);
view(45,30);

%%
rng(1);

% Generamos valores aleatorios en el intervalo [-1,1]
X_datos=-1+2.*rand([50,1]);
Y_datos=-1+2.*rand([50,1]);

f=@(x,y)exp(-2.5^2.*(x.^2+y.^2)./2);
Z_datos=f(X_datos, Y_datos);
N=length(X_datos);

% Especificamos la funcion de base radial que vamos a utilizar
rbf=@(r)r.^2.*log(r);

% Calculamos la matriz de distancias
r=sqrt((X_datos-X_datos').^2+(Y_datos-Y_datos').^2);
A=rbf(r);
% En caso de que r=0, tomamos limites y rellenamos con un cero, que es el
% valor del limite cuando r tiende a cero de la rbf
A(isnan(A))=0;

% Resolvemos el sistema matricial visto en teoria
P=[ones(N, 1),X_datos,Y_datos];
M=[A,P;P',zeros(3,3)];
rhs=[Z_datos;zeros(3,1)];
sol=M\rhs;
for i=1:N
    lambda(i)=sol(i);
end

coef_pol=zeros(1,3);
for j=1:3
    coef_pol(j)=sol(N+j);
end

% Creamos una malla 50x50
x_eval=linspace(-1,1,50);
y_eval=linspace(-1,1,50);
[X_malla,Y_malla]=meshgrid(x_eval,y_eval);

% Aplicamos el interpolante visto en teoria
r_eval=sqrt((X_malla(:)-X_datos').^2+(Y_malla(:)-Y_datos').^2);
Z_interp=rbf(r_eval)*lambda'+coef_pol(1)+coef_pol(2).*X_malla(:)+coef_pol(3).*Y_malla(:);
Z_interp=reshape(Z_interp,size(X_malla));

% Generamos la grafica marcando los nodos que queremos interpolar en rojo
% para comprobar que la superficie interpola a los nodos
figure('Name','Interpolacion rbf(TSP)');
hold on;
grid on;
surf(X_malla,Y_malla,Z_interp,'EdgeColor','none','FaceAlpha',0.8);
scatter3(X_datos,Y_datos,Z_datos,'MarkerEdgeColor','k','MarkerFaceColor','red');
colormap(parula); 
view(45,30);
%%
%GRAFICAMOS AHORA LA FUNCIoN
rng(1);
X_datos=-1+2.*rand([50,1]);
Y_datos=-1+2.*rand([50,1]);
f=@(x,y)exp(-2.5^2.*(x.^2+y.^2)./2);
Z_datos=f(X_datos, Y_datos); 

x_eval=linspace(-1,1,50);
y_eval=linspace(-1,1,50);

[X_malla,Y_malla]=meshgrid(x_eval,y_eval);


figure('Name','GRAFICA FUNCION');
hold on;
grid on;
surf(X_malla,Y_malla,f(X_malla,Y_malla),'EdgeColor','none','FaceAlpha',0.8);
colormap(parula);
view(45,30);

