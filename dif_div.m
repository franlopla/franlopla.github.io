function c=dif_div(X,F)
% ENTRADAS:
% X: vector de nodos
% F: vector de valores a interpolar
% SALIDA:
% c:valores de las diferencias divididas del polinomio interpolador

n=length(X);

% Construimos la tabla de diferencias divididas donde la primera columna
% son los valores a interpolar
tabla_dd=zeros(n, n);
tabla_dd(:,1)=F(:);
% Utilizamos la formula recursiva para el calculo de las diferencias
% divididas
for i=2:n
    for j=1:(n-i+1)
        tabla_dd(j, i)=(tabla_dd(j+1,i-1)-tabla_dd(j,i-1))/(X(j+i-1)-X(j));
    end
end

% Los coeficientes de la forma de newton del polinomio se encuentran en la
% primera fila de la matriz tabla_dd
c=tabla_dd(1,:);
end