function index=busqueda_index(v,x)
% ENTRADAS:
% v: vector de puntos que definen los subintervalos.
% x: punto que queremos ver en qué subintervalo se encuentra.
% SALIDAS:
% index: indice del subintervalo en el que se encuentra x.
 
% Utilizaremos esta funcion para interpolacion segmentaria.
N=length(v);
if x<v(1)||x>v(end)
    error('El punto se encuentra fuera del dominio de interpolacion');
end
for i=1:(N-1)
    if x>=v(i)&&x<=v(i+1)
        index=i;  
        return;
    end
end
end