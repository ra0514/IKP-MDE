function posxyz = L5DOF10F(q)
    
L11=0;
alpha11=pi/2;
theta11=q(1);
D11=0;

L12=10;
alpha12=-pi/2;
theta12=q(2);
D12=0;

L21=0;
alpha21=pi/2;
theta21=q(3);
D21=0;

L22=10;
alpha22=-pi/2;
theta22=q(4);
D22=0;

L31=0;
alpha31=pi/2;
theta31=q(5);
D31=0;

L32=10;
alpha32=-pi/2;
theta32=q(6);
D32=0;

L41=0;
alpha41=pi/2;
theta41=q(7);
D41=0;

L42=10;
alpha42=-pi/2;
theta42=q(8);
D42=0;

L51=0;
alpha51=pi/2;
theta51=q(9);
D51=0;

L52=10;
alpha52=-pi/2;
theta52=q(10);
D52=0;

H11=[cos(theta11) -sin(theta11)*cos(alpha11) sin(theta11)*sin(alpha11) L11*cos(theta11);...
    sin(theta11) cos(theta11)*cos(alpha11) -cos(theta11)*sin(alpha11) L11*sin(theta11);...
    0 sin(alpha11) cos(alpha11) D11;...
    0 0 0 1];
H12=[cos(theta12) -sin(theta12)*cos(alpha12) sin(theta12)*sin(alpha12) L12*cos(theta12);...
    sin(theta12) cos(theta12)*cos(alpha12) -cos(theta12)*sin(alpha12) L12*sin(theta12);...
    0 sin(alpha12) cos(alpha12) D12;...
    0 0 0 1];
H21=[cos(theta21) -sin(theta21)*cos(alpha21) sin(theta21)*sin(alpha21) L21*cos(theta21);...
    sin(theta21) cos(theta21)*cos(alpha21) -cos(theta21)*sin(alpha21) L21*sin(theta21);...
    0 sin(alpha21) cos(alpha21) D21;...
    0 0 0 1];
H22=[cos(theta22) -sin(theta22)*cos(alpha22) sin(theta22)*sin(alpha22) L22*cos(theta22);...
    sin(theta22) cos(theta22)*cos(alpha22) -cos(theta22)*sin(alpha22) L22*sin(theta22);...
    0 sin(alpha22) cos(alpha22) D22;...
    0 0 0 1];
H31=[cos(theta31) -sin(theta31)*cos(alpha31) sin(theta31)*sin(alpha31) L31*cos(theta31);...
    sin(theta31) cos(theta31)*cos(alpha31) -cos(theta31)*sin(alpha31) L31*sin(theta31);...
    0 sin(alpha31) cos(alpha31) D31;...
    0 0 0 1];
H32=[cos(theta32) -sin(theta32)*cos(alpha32) sin(theta32)*sin(alpha32) L32*cos(theta32);...
    sin(theta32) cos(theta32)*cos(alpha32) -cos(theta32)*sin(alpha32) L32*sin(theta32);...
    0 sin(alpha32) cos(alpha32) D32;...
    0 0 0 1];
H41=[cos(theta41) -sin(theta41)*cos(alpha41) sin(theta41)*sin(alpha41) L41*cos(theta41);...
    sin(theta41) cos(theta41)*cos(alpha41) -cos(theta41)*sin(alpha41) L41*sin(theta41);...
    0 sin(alpha41) cos(alpha41) D41;...
    0 0 0 1];
H42=[cos(theta42) -sin(theta42)*cos(alpha42) sin(theta42)*sin(alpha42) L42*cos(theta42);...
    sin(theta42) cos(theta42)*cos(alpha42) -cos(theta42)*sin(alpha42) L42*sin(theta42);...
    0 sin(alpha42) cos(alpha42) D42;...
    0 0 0 1];
H51=[cos(theta51) -sin(theta51)*cos(alpha51) sin(theta51)*sin(alpha51) L51*cos(theta51);...
    sin(theta51) cos(theta51)*cos(alpha51) -cos(theta51)*sin(alpha51) L51*sin(theta51);...
    0 sin(alpha51) cos(alpha51) D51;...
    0 0 0 1];
H52=[cos(theta52) -sin(theta52)*cos(alpha52) sin(theta52)*sin(alpha52) L52*cos(theta52);...
    sin(theta52) cos(theta52)*cos(alpha52) -cos(theta52)*sin(alpha52) L52*sin(theta52);...
    0 sin(alpha52) cos(alpha52) D52;...
    0 0 0 1];
%HF12=H11*H12;
%HF23=H11*H12*H21*H22;
HFF=H11*H12*H21*H22*H31*H32*H41*H42*H51*H52;
%x=[0,HF12(1,4),HF23(1,4),HFF(1,4)];
%y=[0,HF12(2,4),HF23(2,4),HFF(2,4)];
%z=[0,HF12(3,4),HF23(4,4),HFF(3,4)];
%p=plot3(x,y,z);
%p.LineStyle = ":";
%p.Color = "red";
%p.Marker = "o";
%axis equal
%xlabel('x(t)')
%ylabel('y(t)')
%zlabel('z(t)')

posxyz=[HFF(1,4),HFF(2,4),HFF(3,4)];

end