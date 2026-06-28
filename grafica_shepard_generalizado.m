%%
rng(1);
f=@(x,y)1./(1+x.^2+y.^2);

% Generamos valores aleatorios en el intervalo [-5,5]
X_datos=-5+10.*rand([150,1]);
Y_datos=-5+10.*rand([150,1]);

% Escogemos la funcion de peso y determinamos el valor de L
W=@(t)exp(-2.5^2.*(t.^2)./2);
L=0.1;

Z_datos=f(X_datos,Y_datos);

% Generamos una malla 50x50
x_interp=linspace(-5,5,50);
y_interp=linspace(-5,5,50);
[X_malla,Y_malla]=meshgrid(x_interp,y_interp);

[n,m]=size(X_malla);

Z_interp=zeros(size(X_malla));

% Determinamos los valores resultantes del metodo en los puntos de la malla
for i=1:n
    for j=1:m
        px=X_malla(i,j);
        py=Y_malla(i,j);
        Z_interp(i,j)=shepard_generalizado(X_datos,Y_datos,Z_datos,px,py,W,L);
    end
end

% Generamos la grafica
figure('Name','Shepard generalizado');
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
W=@(t)exp(-2.5^2.*(t.^2)./2);
L=0.3;

Z_datos=f(X_datos,Y_datos);

x_interp=linspace(-5,5,50);
y_interp=linspace(-5,5,50);

[X_malla,Y_malla]=meshgrid(x_interp,y_interp);
[n,m]=size(X_malla);

Z_interp=zeros(size(X_malla));

for i=1:n
    for j=1:m
        px=X_malla(i,j);
        py=Y_malla(i,j);
        Z_interp(i,j)=shepard_generalizado(X_datos,Y_datos,Z_datos,px,py,W,L);
    end
end

figure('Name','Shepard generalizado');
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
W=@(t)exp(-2.5^2.*(t.^2)./2);
L=0.5;

Z_datos=f(X_datos,Y_datos);

x_interp=linspace(-5,5,50);
y_interp=linspace(-5,5,50);

[X_malla,Y_malla]=meshgrid(x_interp,y_interp);
[n,m]=size(X_malla);

Z_interp=zeros(size(X_malla));

for i=1:n
    for j=1:m
        px=X_malla(i,j);
        py=Y_malla(i,j);
        Z_interp(i,j)=shepard_generalizado(X_datos,Y_datos,Z_datos,px,py,W,L);
    end
end
figure('Name','Shepard generalizado');
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
W=@(t)exp(-2.5^2.*(t.^2)./2);
L=1;

Z_datos=f(X_datos,Y_datos);

x_interp=linspace(-5,5,50);
y_interp=linspace(-5,5,50);

[X_malla,Y_malla]=meshgrid(x_interp,y_interp);
[n,m]=size(X_malla);

Z_interp=zeros(size(X_malla));

for i=1:n
    for j=1:m
        px=X_malla(i,j);
        py=Y_malla(i,j);
        Z_interp(i,j)=shepard_generalizado(X_datos,Y_datos,Z_datos,px,py,W,L);
    end
end

figure('Name','Shepard generalizado');
hold on;
grid on;

surf(X_malla,Y_malla,Z_interp,'EdgeColor','none','FaceAlpha',0.8);
scatter3(X_datos,Y_datos,Z_datos,'MarkerEdgeColor','k','MarkerFaceColor','red');
colormap(parula); 
view(45,30);