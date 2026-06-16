function y=interpol_newton(X,F,x)
% ENTRADAS:
% X: vector de nodos
% F: vector de valores a interpolar
% x: punto o vector donde queremos evaluar el polinomio
% SALIDA:
% y: polinomio evaluado en x o en caso de no introducir la variable x,
% el polinomio en funcion de x

% Si no introducimos el valor de x recibiremos el polinomio 
% en función de x
switch nargin
    case 2
        syms x;
end
% En caso de introducir el valor de x recibiremos el valor del polinomio

if nargin==3
    if any(x<min(X))||any(x>max(X))
        error('El punto se encuentra fuera del dominio de interpolacion');
    end
end
% evaluado en x
c=dif_div(X,F);
% Utilizamos el algoritmo de multiplicacion encajada
n=length(c)-1;
y= c(n+1)*ones(size(x));
for i=n:-1:1
    y=c(i)+(x-X(i)).*y;
end
end