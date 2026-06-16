% Definimos la funcion de Runge
f=@(x)1./(1+x.^2);

% Determinamos el numero de nodos equiespaciados que utilizaremos
n=6;
X_nodos=linspace(-5,5,n); 
Y_nodos=f(X_nodos);

% Generamos los puntos para hacer la grafica original 
x_eval=linspace(-5,5,100);
y_exacta=f(x_eval);

% Realizamos la interpolacion
y_interp=interpol_newton(X_nodos,Y_nodos,x_eval);

% Generamos la figura superponiendo la interpolación realizada con
% circulos sobre la grafica original 
figure('Name','Fenomeno de Runge');
hold on; 
grid on;
plot(x_eval,y_interp, 'ko');
plot(x_eval,y_exacta);

%%
f=@(x)1./(1+x.^2);

n=11;
X_nodos=linspace(-5, 5, n);
Y_nodos=f(X_nodos);

x_eval=linspace(-5,5,100);
y_exacta=f(x_eval);

y_interp=interpol_newton(X_nodos,Y_nodos,x_eval);

figure('Name','Fenomeno de Runge');
hold on; 
grid on;
plot(x_eval,y_interp,'ko');
plot(x_eval,y_exacta);
