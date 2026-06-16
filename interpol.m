% En este codigo se ha utilizado la matriz de vandermonde pero cabe
% mencionar que esta puede presentae problemas de inestabilidad si
% disponemos de una gran cantidad de nodos
function y=interpol(X,F,x)
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
% evaluado en x
if nargin==3
    if any(x<min(X))||any(x>max(X))
        error('El punto se encuentra fuera del dominio de interpolacion');
    end
end

% Inicializamos el valor de y
y=0;

% Creamos la matriz de vandermonde e invertimos las columnas por como
% trabaja la funcion vander de matlab
M=fliplr(vander(X));

% Resolvemos el sistema M*C=F
C=M\F(:);
l=length(C);

% Reconstruimos el polinomio
for k=1:l
    y=y+C(k).*x.^(k-1);
end