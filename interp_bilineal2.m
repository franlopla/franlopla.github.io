% En este caso
% implementaremos la interpolacion bilineal con el razonamiento teorico 
% que hemos hecho de realizar dos interpolaciones unidimensionales a lo 
% largo de las rectas y=y0 e y=y1 para finalmente realizar una ultima 
% interpolacion a lo largo del eje Y
function pz=interp_bilineal2(X,Y,Z,px,py)
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
    % Aplicamos el razonamiento de la teoria haciendo dos interpolaciones
    % unidimensionales a lo largo de las recta y=y0 e y=y1, para hacer
    % finalmente una ultima interpolacion a lo largo del eje Y
    z1=interpol([x0,x1],[z00,z10],px);
    z2=interpol([x0,x1],[z01,z11],px);
    pz=interpol([y0,y1],[z1,z2],py);
end