%%
rng(1);
f=@(x,y)1./(1+x.^2+y.^2);

% Generamos valores aleatorios en el intervalo [-5,5]
X_datos=-5+10.*rand([10,1]);
Y_datos=-5+10.*rand([10,1]);
Z_datos=f(X_datos,Y_datos);
alpha=2;

% Generamos una malla 50x50
x_interp=linspace(-5,5,50);
y_interp=linspace(-5,5,50);
[X_malla,Y_malla]=meshgrid(x_interp,y_interp);

[n,m]=size(X_malla);
Z_interp=zeros(size(X_malla));

% Evaluamos la funcion interpolante en los nodos de la malla
for i=1:n
    for j=1:m
        px=X_malla(i,j);
        py=Y_malla(i,j);
        Z_interp(i,j)=shepard(X_datos,Y_datos,Z_datos,px,py,alpha);
    end
end

% Generamos la grafica marcando los nodos que queremos interpolar en rojo
% para comprobar que la superficie interpola a los nodos
figure('Name','Interpolación Shepard');
hold on;
grid on;
surf(X_malla,Y_malla,Z_interp,'EdgeColor','none','FaceAlpha',0.8);
scatter3(X_datos,Y_datos,Z_datos,'MarkerEdgeColor','k','MarkerFaceColor','red');
colormap(parula); 
view(45,30);

%%
rng(1);
f=@(x,y)1./(1+x.^2+y.^2);
X_datos=-5+10.*rand([50,1]);
Y_datos=-5+10.*rand([50,1]);

Z_datos=f(X_datos,Y_datos);
alpha=2;

x_interp=linspace(-5,5,50);
y_interp=linspace(-5,5,50);

[X_malla,Y_malla]=meshgrid(x_interp,y_interp);
[n,m]=size(X_malla);

Z_interp=zeros(size(X_malla));

for i=1:n
    for j=1:m
        px=X_malla(i,j);
        py=Y_malla(i,j);
        Z_interp(i,j)=shepard(X_datos,Y_datos,Z_datos,px,py,alpha);
    end
end

figure('Name','Interpolación Shepard');
hold on;
grid on;
surf(X_malla,Y_malla,Z_interp,'EdgeColor','none','FaceAlpha',0.8);
scatter3(X_datos,Y_datos,Z_datos,'MarkerEdgeColor','k','MarkerFaceColor','red');
colormap(parula); 
view(45,30);

%%
rng(1);
f=@(x,y)1./(1+x.^2+y.^2);
X_datos=-5+10.*rand([150,1]);
Y_datos=-5+10.*rand([150,1]);

Z_datos=f(X_datos,Y_datos);
alpha=2;

x_interp=linspace(-5,5,50);
y_interp=linspace(-5,5,50);

[X_malla,Y_malla]=meshgrid(x_interp,y_interp);
[n,m]=size(X_malla);

Z_interp=zeros(size(X_malla));

for i=1:n
    for j=1:m
        px=X_malla(i,j);
        py=Y_malla(i,j);
        Z_interp(i,j)=shepard(X_datos,Y_datos,Z_datos,px,py,alpha);
    end
end

figure('Name','Interpolación Shepard');
hold on;
grid on;
surf(X_malla,Y_malla,Z_interp,'EdgeColor','none','FaceAlpha',0.8);
scatter3(X_datos,Y_datos,Z_datos,'MarkerEdgeColor','k','MarkerFaceColor','red');
colormap(parula);
view(45,30);

%%
rng(1);
f=@(x,y)1./(1+x.^2+y.^2);
X_datos=-5+10.*rand([500,1]);
Y_datos=-5+10.*rand([500,1]);


Z_datos=f(X_datos,Y_datos);
alpha=2;

x_interp=linspace(-5,5,50);
y_interp=linspace(-5,5,50);

[X_malla,Y_malla]=meshgrid(x_interp,y_interp);
[n,m]=size(X_malla);

Z_interp=zeros(size(X_malla));

for i=1:n
    for j=1:m
        px=X_malla(i,j);
        py=Y_malla(i,j);
        Z_interp(i,j)=shepard(X_datos,Y_datos,Z_datos,px,py,alpha);
    end
end

figure('Name','Interpolación Shepard', 'Color', 'w');
hold on;
grid on;
surf(X_malla,Y_malla,Z_interp,'EdgeColor','none','FaceAlpha',0.8);
scatter3(X_datos,Y_datos,Z_datos,'MarkerEdgeColor','k','MarkerFaceColor','red');
colormap(parula); 
view(45,30);

%% Graficamos ahora la funcion exacta
rng(1);
f=@(x,y)1./(1+x.^2+y.^2);
X_datos=-5+10.*rand([50,1]);
Y_datos=-5+10.*rand([50,1]);


Z_datos=f(X_datos,Y_datos);
alpha=2;

x_interp=linspace(-5,5,50);
y_interp=linspace(-5,5,50);

[X_malla,Y_malla]=meshgrid(x_interp,y_interp);
[n,m]=size(X_malla);

Z_interp=zeros(size(X_malla));

for i=1:n
    for j=1:m
        px=X_malla(i,j);
        py=Y_malla(i,j);
        Z_interp(i,j)=shepard(X_datos,Y_datos,Z_datos,px,py,alpha);
    end
end


figure('Name','GRAFICA FUNCION');
hold on;
grid on;
surf(X_malla,Y_malla,f(X_malla,Y_malla),'EdgeColor','none','FaceAlpha',0.8);
colormap(parula); 
view(45,30);

%%
rng(1);
f=@(x,y)1./(1+x.^2+y.^2);
X_datos=-5+10.*rand([150,1]);
Y_datos=-5+10.*rand([150,1]);

Z_datos=f(X_datos,Y_datos);
alpha=1;

x_interp=linspace(-5,5,50);
y_interp=linspace(-5,5,50);
[X_malla,Y_malla]=meshgrid(x_interp,y_interp);
[n,m]=size(X_malla);

Z_interp=zeros(size(X_malla));

for i=1:n
    for j=1:m
        px=X_malla(i,j);
        py=Y_malla(i,j);
        Z_interp(i,j)=shepard(X_datos,Y_datos,Z_datos,px,py,alpha);
    end
end

figure('Name','Interpolación Shepard');
hold on;
grid on;
surf(X_malla, Y_malla, Z_interp,'EdgeColor','none','FaceAlpha',0.8);
scatter3(X_datos,Y_datos,Z_datos,'MarkerEdgeColor','k','MarkerFaceColor','red');
colormap(parula);
view(45,30);
%%
rng(1);
f=@(x,y)1./(1+x.^2+y.^2);
X_datos=-5+10.*rand([150,1]);
Y_datos=-5+10.*rand([150,1]);

Z_datos=f(X_datos,Y_datos);
alpha=2;

x_interp=linspace(-5,5,50);
y_interp=linspace(-5,5,50);
[X_malla,Y_malla]=meshgrid(x_interp,y_interp);
[n,m]=size(X_malla);

Z_interp=zeros(size(X_malla));

for i=1:n
    for j=1:m
        px=X_malla(i,j);
        py=Y_malla(i,j);
        Z_interp(i,j)=shepard(X_datos,Y_datos,Z_datos,px,py,alpha);
    end
end

figure('Name','Interpolación Shepard');
hold on;
grid on;
surf(X_malla, Y_malla, Z_interp,'EdgeColor','none','FaceAlpha',0.8);
scatter3(X_datos,Y_datos,Z_datos,'MarkerEdgeColor','k','MarkerFaceColor','red');
colormap(parula); 
view(45,30);
%%
rng(1);
f=@(x,y)1./(1+x.^2+y.^2);
X_datos=-5+10.*rand([150,1]);
Y_datos=-5+10.*rand([150,1]);

Z_datos=f(X_datos,Y_datos);
alpha=5;

x_interp=linspace(-5,5,50);
y_interp=linspace(-5,5,50);
[X_malla,Y_malla]=meshgrid(x_interp,y_interp);
[n,m]=size(X_malla);

Z_interp=zeros(size(X_malla));

for i=1:n
    for j=1:m
        px=X_malla(i,j);
        py=Y_malla(i,j);
        Z_interp(i,j)=shepard(X_datos,Y_datos,Z_datos,px,py,alpha);
    end
end

figure('Name','Interpolación Shepard');
hold on;
grid on;
surf(X_malla,Y_malla,Z_interp,'EdgeColor','none','FaceAlpha',0.8);
scatter3(X_datos,Y_datos,Z_datos,'MarkerEdgeColor','k','MarkerFaceColor','red');
colormap(parula); 
view(45, 30);
%%
rng(1);
f=@(x,y)1./(1+x.^2+y.^2);
X_datos=-5+10.*rand([150,1]);
Y_datos=-5+10.*rand([150,1]);

Z_datos=f(X_datos,Y_datos);
alpha=10;

x_interp=linspace(-5,5,50);
y_interp=linspace(-5,5,50);

[X_malla,Y_malla]=meshgrid(x_interp,y_interp);
[n,m]=size(X_malla);

Z_interp=zeros(size(X_malla));

for i=1:n
    for j=1:m
        px=X_malla(i,j);
        py=Y_malla(i,j);
        Z_interp(i,j)=shepard(X_datos,Y_datos,Z_datos,px,py,alpha);
    end
end

figure('Name','Interpolación Shepard');
hold on;
grid on;

surf(X_malla,Y_malla,Z_interp,'EdgeColor','none','FaceAlpha',0.8);
scatter3(X_datos,Y_datos,Z_datos,'MarkerEdgeColor','k','MarkerFaceColor','red');
colormap(parula); 
view(45, 30);
%%
rng(1);
f=@(x,y)1./(1+x.^2+y.^2);
X_datos=-5+10.*rand([150,1]);
Y_datos=-5+10.*rand([150,1]);

Z_datos=f(X_datos,Y_datos);
alpha=20;

x_interp=linspace(-5,5,50);
y_interp=linspace(-5,5,50);
[X_malla,Y_malla]=meshgrid(x_interp,y_interp);
[n,m]=size(X_malla);

Z_interp=zeros(size(X_malla));

for i=1:n
    for j=1:m
        px=X_malla(i,j);
        py=Y_malla(i,j);
        Z_interp(i,j)=shepard(X_datos,Y_datos,Z_datos,px,py,alpha);
    end
end

figure('Name','Interpolación Shepard');
hold on;
grid on;

surf(X_malla,Y_malla,Z_interp,'EdgeColor','none','FaceAlpha',0.8);
scatter3(X_datos,Y_datos,Z_datos,'MarkerEdgeColor','k','MarkerFaceColor','red');
colormap(parula);
view(45,30);

