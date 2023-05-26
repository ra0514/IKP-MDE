ip=[-15,-15,-45,-30,-45,-30,15,15,20,40]*pi/180;
[x0,y0,z0] = L5DOF10Full(ip);
f1=[-0.1562   -0.2370   -0.7750   -0.5493   -0.8630   -0.5608    0.2638    0.2817    0.2832    0.7879];
[x1,y1,z1] = L5DOF10Full(f1);
f2=[-0.0940   -0.1555   -0.7811   -0.6551   -0.8823   -0.5527    0.2642    0.3642    0.1656    0.8533];
[x2,y2,z2] = L5DOF10Full(f2);
f3=[0.0177   -0.1689   -0.8185   -0.7066   -0.8966   -0.5235    0.0745    0.4521    0.4237    0.8515];
[x3,y3,z3] = L5DOF10Full(f3);%min dif (red)
f4=[0.0891   -0.1744   -0.8095   -0.7101   -0.9266   -0.5274    0.0846    0.4273    0.3731    1.0014];
[x4,y4,z4] = L5DOF10Full(f4);
f5=[0.1642   -0.1861   -0.8157   -0.6898   -0.9594   -0.5783    0.1485    0.4893    0.2680    1.0653];
[x5,y5,z5] = L5DOF10Full(f5);%best value (magenta)
f6=[0.2456   -0.1933   -0.7113   -0.7409   -1.1145   -0.5640    0.1218    0.5170    0.2614    1.0117];
[x6,y6,z6] = L5DOF10Full(f6);
f7=[0.2565   -0.1656   -0.6789   -0.7142   -1.1592   -0.6294    0.1204    0.6029    0.3610    1.0427];
[x7,y7,z7] = L5DOF10Full(f7);
f8=[0.3670   -0.2738   -0.7296   -0.6410   -1.1739   -0.6222    0.1072    0.6347    0.4464    1.0710];
[x8,y8,z8] = L5DOF10Full(f8);
f9=[0.4294   -0.2996   -0.7079   -0.6421   -1.2382   -0.5798    0.0803    0.6415    0.4870    1.0677];
[x9,y9,z9] = L5DOF10Full(f9);
f10=[0.4841   -0.2662   -0.7183   -0.6290   -1.2661   -0.5393    0.1072    0.5988    0.5007    1.1095];
[x10,y10,z10] = L5DOF10Full(f10);

p0=plot3(x0,y0,z0);
p0.LineStyle = ":";
p0.Color = "black";
p0.Marker = "o";
axis equal
xlabel('x')
ylabel('y')
zlabel('z')
grid on

hold on
p1=plot3(x1,y1,z1);
p1.LineStyle = ":";
p1.Color = "blue";
p1.Marker = "o";

p2=plot3(x2,y2,z2);
p2.LineStyle = ":";
p2.Color = "blue";
p2.Marker = "o";

p3=plot3(x3,y3,z3);
p3.LineStyle = ":";
p3.Color = "blue";
p3.Marker = "o";

p4=plot3(x4,y4,z4);
p4.LineStyle = ":";
p4.Color = "blue";
p4.Marker = "o";

p5=plot3(x5,y5,z5);
p5.LineStyle = ":";
p5.Color = "blue";
p5.Marker = "o";

p6=plot3(x6,y6,z6);
p6.LineStyle = ":";
p6.Color = "blue";
p6.Marker = "o";

p7=plot3(x7,y7,z7);
p7.LineStyle = ":";
p7.Color = "blue";
p7.Marker = "o";

p8=plot3(x8,y8,z8);
p8.LineStyle = ":";
p8.Color = "blue";
p8.Marker = "o";

p9=plot3(x9,y9,z9);
p9.LineStyle = ":";
p9.Color = "blue";
p9.Marker = "o";

p10=plot3(x10,y10,z10);
p10.LineStyle = ":";
p10.Color = "blue";
p10.Marker = "o";

hold off