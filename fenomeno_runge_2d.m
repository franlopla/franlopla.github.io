%%
% Fenomeno de Runge 2D
f=@(x,y)1./(1+x.^2+y.^2);
N=5;
X_global=linspace(-5,5,N); 
Y_global=linspace(-5,5,N);

% Inicializamos la matriz que contiene los valores f(x_i,y_j))
Z_global=zeros(length(X_global),length(Y_global));
for i=1:length(X_global)
    for j=1:length(Y_global)
        Z_global(i,j)=f(X_global(i),Y_global(j));
    end
end

% Creamos una malla 50x50
x_eval=linspace(min(X_global),max(X_global),50);
y_eval=linspace(min(Y_global),max(Y_global),50);
[X_malla,Y_malla]=meshgrid(x_eval,y_eval);

Z_interp=zeros(size(X_malla));

% Evaluamos el polinomio interpolador en cada punto de la malla
for i=1:size(X_malla,1)
    for j=1:size(X_malla,2)
        px=X_malla(i,j);
        py=Y_malla(i,j);
        Z_interp(i,j)=interp_polinomica_2d(X_global,Y_global,Z_global,px,py);
    end
end

[X_puntos,Y_puntos]=ndgrid(X_global,Y_global);

% Generamos la grafica marcando los nodos que queremos interpolar en rojo
% para comprobar que la superficie interpola a los nodos
figure('Name','Fenomeno de Runge');
hold on; 
grid on;
surf(X_malla,Y_malla,Z_interp,'EdgeColor','none','FaceAlpha',0.8);
scatter3(X_puntos(:),Y_puntos(:),Z_global(:),'MarkerEdgeColor','k','MarkerFaceColor','red');
colormap(parula); 
view(45,30);

%%
% Fenomeno de Runge
f=@(x,y)1./(1+x.^2+y.^2);
N=9;
X_global=linspace(-5,5,N); 
Y_global=linspace(-5,5,N);

Z_global=zeros(length(X_global), length(Y_global));
for i=1:length(X_global)
    for j=1:length(Y_global)
        Z_global(i,j)=f(X_global(i),Y_global(j));
    end
end

x_eval=linspace(min(X_global),max(X_global),50);
y_eval=linspace(min(Y_global),max(Y_global),50);
[X_malla,Y_malla]=meshgrid(x_eval,y_eval);

Z_interp=zeros(size(X_malla));

for i=1:size(X_malla, 1)
    for j=1:size(X_malla, 2)
        px=X_malla(i,j);
        py=Y_malla(i,j);
        Z_interp(i,j)=interp_polinomica_2d(X_global,Y_global,Z_global,px,py);
    end
end

[X_puntos,Y_puntos]=ndgrid(X_global,Y_global);

figure('Name','Fenomeno de Runge');
hold on; 
grid on;
surf(X_malla,Y_malla,Z_interp,'EdgeColor','none','FaceAlpha',0.8);
scatter3(X_puntos(:),Y_puntos(:),Z_global(:),'MarkerEdgeColor','k','MarkerFaceColor','red');
colormap(parula); 
view(45,30);

%%
% Fenomeno de Runge
f=@(x,y)1./(1+x.^2+y.^2);
N=13;
X_global=linspace(-5,5,N); 
Y_global=linspace(-5,5,N);


Z_global=zeros(length(X_global),length(Y_global));
for i=1:length(X_global)
    for j=1:length(Y_global)
        Z_global(i,j)=f(X_global(i),Y_global(j));
    end
end

x_eval=linspace(min(X_global),max(X_global),50);
y_eval=linspace(min(Y_global),max(Y_global),50);
[X_malla,Y_malla]=meshgrid(x_eval,y_eval);

Z_interp=zeros(size(X_malla));

for i=1:size(X_malla,1)
    for j=1:size(X_malla,2)
        px=X_malla(i,j);
        py=Y_malla(i,j);
        Z_interp(i,j)=interp_polinomica_2d(X_global,Y_global,Z_global,px,py);
    end
end

[X_puntos,Y_puntos]=ndgrid(X_global,Y_global);

figure('Name', 'Fenomeno de Runge');
hold on; 
grid on;
surf(X_malla,Y_malla,Z_interp,'EdgeColor','none','FaceAlpha',0.8);
scatter3(X_puntos(:),Y_puntos(:),Z_global(:),'MarkerEdgeColor','k','MarkerFaceColor','red');
colormap(parula); 
view(45,30);

%%
% Fenomeno de Runge
f=@(x,y)1./(1+x.^2+y.^2);
N=17;
X_global=linspace(-5,5,N); 
Y_global=linspace(-5,5,N);

Z_global=zeros(length(X_global),length(Y_global));

for i=1:length(X_global)
    for j=1:length(Y_global)
        Z_global(i,j)=f(X_global(i),Y_global(j));
    end
end

x_eval=linspace(min(X_global),max(X_global),50);
y_eval=linspace(min(Y_global),max(Y_global),50);
[X_malla,Y_malla]=meshgrid(x_eval,y_eval);

Z_interp=zeros(size(X_malla));
for i=1:size(X_malla,1)
    for j=1:size(X_malla,2)
        px=X_malla(i,j);
        py=Y_malla(i,j);
        Z_interp(i,j)=interp_polinomica_2d(X_global,Y_global,Z_global,px,py);
    end
end

[X_puntos,Y_puntos]=ndgrid(X_global,Y_global);

figure('Name', 'Fenomeno de Runge');
hold on;
grid on;

surf(X_malla,Y_malla,Z_interp,'EdgeColor','none','FaceAlpha',0.8);
scatter3(X_puntos(:),Y_puntos(:),Z_global(:),'MarkerEdgeColor','k','MarkerFaceColor','red');
colormap(parula); 
view(45,30);


%%
% Interpolacion a trozos para el Fenomeno de Runge
f=@(x,y)1./(1+x.^2+y.^2);
X_datos=linspace(-5,5,17); 
Y_datos=linspace(-5,5,17);

Z_datos=zeros(length(X_datos),length(Y_datos));

N=length(X_datos);
M=length(Y_datos);

for i=1:length(X_datos)
    for j=1:length(Y_datos)
        Z_datos(i,j)=f(X_datos(i),Y_datos(j));
    end
end

figure('Name','Interpolacion a trozos para Fenomeno de Runge');
hold on; 
grid on;

for i=1:N-1
    for j=1:M-1
        x_eval=linspace(X_datos(i),X_datos(i+1),50);
        y_eval=linspace(Y_datos(j),Y_datos(j+1),50);
        [X_malla,Y_malla]=meshgrid(x_eval,y_eval);

        Z_interp=zeros(size(X_malla));
        for k=1:size(X_malla,1)
            for h=1:size(X_malla,2)
                px=X_malla(k,h);
                py=Y_malla(k,h);
                X_bilineal=[X_datos(i),X_datos(i+1)];
                Y_bilineal=[Y_datos(j),Y_datos(j+1)];
                Z_bilineal(1,1)=Z_datos(i,j);
                Z_bilineal(1,2)=Z_datos(i,j+1);
                Z_bilineal(2,1)=Z_datos(i+1,j);
                Z_bilineal(2,2)=Z_datos(i+1,j+1);
                Z_interp(k, h)=interp_bilineal(X_bilineal,Y_bilineal,Z_bilineal,px,py);
            end
        end

        surf(X_malla,Y_malla,Z_interp,'EdgeColor','none','FaceAlpha',0.8);
        colormap(parula); 
        view(45,30);
    end
end
[X_datos,Y_datos]=ndgrid(X_datos,Y_datos);
scatter3(X_datos(:),Y_datos(:),Z_datos(:),'MarkerEdgeColor','k','MarkerFaceColor','red');