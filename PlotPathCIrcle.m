ip=[-15,-15,-45,-30,-45,-30,15,15,20,40]*pi/180;
[x0,y0,z0] = L5DOF10Full(ip);

path = xlsread('pathcircledata.xlsx');
Qs = xlsread('test.xlsx');%TEST

p0=plot3(x0,y0,z0);
p0.LineStyle = ":";
p0.Color = "blue";
p0.Marker = "o";
axis equal
xlabel('x')
ylabel('y')
zlabel('z')
grid on

hold on

for i=2:51 %tamaño del path
    [x1,y1,z1] = L5DOF10Full(Qs(i,:));
    p1=plot3(x1,y1,z1);
    p1.LineStyle = ":";
    p1.Color = "blue";
    p1.Marker = "o";
end

ptodo=plot3(path(1,:),path(2,:),path(3,:));
ptodo.Color = "red";