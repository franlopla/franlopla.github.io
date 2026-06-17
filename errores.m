%%
% ERROR SHEPARD
rng(1);
f=@(x,y) exp(-2.5^2.*(x.^2+y.^2)./2);
alpha=2;

X_datos = -1+2.*rand([150,1]);
Y_datos = -1+2.*rand([150,1]);
Z_datos = f(X_datos,Y_datos);

x_interp=linspace(min(X_datos),max(X_datos),50);
y_interp=linspace(min(Y_datos),max(Y_datos),50);

[X_malla,Y_malla]=meshgrid(x_interp,y_interp);
[n,m]=size(X_malla);
Z_exacta=f(X_malla,Y_malla);
for i=1:n
    for j=1:m
        px=X_malla(i,j);
        py=Y_malla(i,j);
        Z_interp(i,j)=shepard(X_datos,Y_datos,Z_datos,px,py,alpha);
    end
end
error_shepard=Z_exacta-Z_interp;   
ecm_shepard = sqrt(mean(error_shepard(:).^2));
emax_shepard = max(abs(error_shepard(:)));
%%
% ERROR SHEPARD GENERALIZADO
rng(1);
f=@(x,y) exp(-2.5^2.*(x.^2+y.^2)./2);
alpha=2;

X_datos = -1+2.*rand([150,1]);
Y_datos = -1+2.*rand([150,1]);
Z_datos = f(X_datos,Y_datos);

W=@(t) exp(-2.5^2.*(t.^2)./2);
L=0.3;

x_interp=linspace(min(X_datos),max(X_datos),50);
y_interp=linspace(min(Y_datos),max(Y_datos),50);

[X_malla,Y_malla]=meshgrid(x_interp,y_interp);
[n,m]=size(X_malla);
Z_exacta=f(X_malla,Y_malla);
for i=1:n
    for j=1:m
        px=X_malla(i,j);
        py=Y_malla(i,j);
        Z_interp(i,j)=shepard_generalizado(X_datos,Y_datos,Z_datos,px,py,W,L);
    end
end
error_shepard_generalizado=Z_exacta-Z_interp;   
ecm_shepard_generalizado = sqrt(mean(error_shepard_generalizado(:).^2));
emax_shepard_generalizado = max(abs(error_shepard_generalizado(:)));
%%
% ERROR RBF GAUSSIANA
rng(1);
% Generamos valores aleatorios en el intervalo [-1,1]
X_datos=-1+2.*rand([50,1]);
Y_datos=-1+2.*rand([50,1]);
f=@(x,y) exp(-2.5^2.*(x.^2+y.^2)./2);
Z_datos = f(X_datos, Y_datos);

% Especificamos el valor de epsilon y la funcion de base
% radial que vamos a utilizar
epsilon = 2; 
rbf = @(r) exp(-(epsilon * r).^2); % Función Gaussiana

% Calculamos la matriz de distancias
r = sqrt((X_datos - X_datos').^2 + (Y_datos - Y_datos').^2);

% Obtenemos la matriz de interpolacion y la solucion del sistema
A=rbf(r);
lambda=A\Z_datos;

% Creamos una malla 50x50
x_eval=linspace(-1,1,50);
y_eval=linspace(-1,1,50);
[X_malla,Y_malla]=meshgrid(x_eval,y_eval);
Z_exacta=f(X_malla,Y_malla);

% Aplicamos el interpolante visto en teoria
r_eval = sqrt((X_malla(:) - X_datos').^2 + (Y_malla(:) - Y_datos').^2);
Z_interp = rbf(r_eval) * lambda;
Z_interp = reshape(Z_interp, size(X_malla));
error_gaussiana=Z_exacta-Z_interp;   
ecm_gaussiana= sqrt(mean(error_gaussiana(:).^2));
emax_gaussiana = max(abs(error_gaussiana(:)));

%%
% ERROR MULTICUADRICA
rng(1);
X_datos=-1+2.*rand([50,1]);
Y_datos=-1+2.*rand([50,1]);
f=@(x,y) exp(-2.5^2.*(x.^2+y.^2)./2);
Z_datos = f(X_datos, Y_datos);

epsilon = 1; 
rbf = @(r) sqrt(r.^2+epsilon^2); % Función multicuádrica

r = sqrt((X_datos - X_datos').^2 + (Y_datos - Y_datos').^2);
A=rbf(r);
lambda=A\Z_datos;

x_eval=linspace(-1,1,50);
y_eval=linspace(-1,1,50);

[X_malla,Y_malla]=meshgrid(x_eval,y_eval);
Z_exacta=f(X_malla,Y_malla);

r_eval = sqrt((X_malla(:) - X_datos').^2 + (Y_malla(:) - Y_datos').^2);
Z_interp = rbf(r_eval) * lambda;
Z_interp = reshape(Z_interp, size(X_malla));

error_multicuadrica=Z_exacta-Z_interp;   
ecm_multicuadrica = sqrt(mean(error_multicuadrica(:).^2));
emax_multicuadrica = max(abs(error_multicuadrica(:)));
%%
% ERROR TSP
rng(1);

% Generamos valores aleatorios en el intervalo [-1,1]
X_datos=-1+2.*rand([50,1]);
Y_datos=-1+2.*rand([50,1]);

f=@(x,y) exp(-2.5^2.*(x.^2+y.^2)./2);
Z_datos = f(X_datos, Y_datos);
N=length(X_datos);

% Especificamos la funcion de base radial que vamos a utilizar
rbf = @(r) r.^2.*log(r);

% Calculamos la matriz de distancias
r = sqrt((X_datos - X_datos').^2 + (Y_datos - Y_datos').^2);
A=rbf(r);
% En caso de que r=0, tomamos limites y rellenamos con un cero, que es el
% valor del limite cuando r tiende a cero de la rbf
A(isnan(A)) = 0;

% Resolvemos el sistema matricial visto en teoria
P = [ones(N, 1), X_datos, Y_datos];
M = [A, P; P', zeros(3,3)];
rhs = [Z_datos; zeros(3,1)];
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
Z_exacta=f(X_malla,Y_malla);

% Aplicamos el interpolante visto en teoria
r_eval = sqrt((X_malla(:) - X_datos').^2 + (Y_malla(:) - Y_datos').^2);
Z_interp = rbf(r_eval) * lambda'+ coef_pol(1)+ coef_pol(2).*X_malla(:) + coef_pol(3).*Y_malla(:);
Z_interp = reshape(Z_interp, size(X_malla));

error_TSP=Z_exacta-Z_interp;   
ecm_TSP = sqrt(mean(error_TSP(:).^2));
emax_TSP = max(abs(error_TSP(:)));