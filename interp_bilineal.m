function z=interp_bilineal(X,Y,Z,px,py)
% ENTRADAS:
% X: coordenadas del eje X para los nodos a interpolar
% Y: coordenadas del eje Y para los nodos a interpolar
% Z: vector de valores a interpolar
% (px,py): punto o vector donde queremos evaluar el polinomio
% SALIDAS:
% pz: valor resultante de evaluar el polinomio en el punto (x,y)
    if length(X)~=2||length(Y)~=2
        error('Los vectores X e Y deben tener longitud 2.');
    end
    if size(Z, 1)~=2||size(Z, 2)~=2
        error('La matriz Z debe ser de tamaño 2x2');
    end
    if px<X(1)||px>X(2)||py<Y(1)||py>Y(2)
        error('El punto se encuentra fuera del dominio de interpolacion');
    end
    % Extraemos los elementos de cada vector y matriz y los guardamos en
    % nuevos parametros utilizando la notacion de la teoria
    x0=X(1);
    x1=X(2);
    y0=Y(1);
    y1=Y(2);
    z00=Z(1,1);
    z01=Z(1,2);
    z10=Z(2,1);
    z11=Z(2,2);
    a00=z00;
    a10=(z10-z00)/(x1-x0);
    a01=(z01-z00)/(y1-y0);
    a11=(z11-z10-z01+z00)/((x1-x0)*(y1-y0));
    z=a00+a10.*(px-x0)+a01.*(py-y0)+a11.*(px-x0).*(py-y0);
end