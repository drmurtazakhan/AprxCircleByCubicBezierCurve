function [Qx,Qy]=CubicBezier1(Px,Py,n)
% Input:
% Px contains x-coordinates of control points [Px0,Px1,Px2,Px3]
% Py contains y-coordinates of control points [Py0,Py1,Py2,Py3]
% n is number of intervals (uniform parameterization)

%Output:
% Qx contains parameteric evaluted x-value
% Qy contains parameteric evaluted y-value

% Equation of Bezier Curve, utilizes Horner's rule for efficient computation.
% Q(t)=(-P0 + 3*(P1-P2) + P3)*t^3 + 3*(P0-2*P1+P2)*t^2 + 3*(P1-P0)*t + Px0


Px0=Px(1);
Py0=Py(1);
Px1=Px(2);
Py1=Py(2);
Px2=Px(3);
Py2=Py(3);
Px3=Px(4);
Py3=Py(4);

cx3=-Px0 + 3*(Px1-Px2) + Px3;
cy3=-Py0 + 3*(Py1-Py2) + Py3;
cx2=3*(Px0-2*Px1+Px2); 
cy2=3*(Py0-2*Py1+Py2);
cx1=3*(Px1-Px0);
cy1=3*(Py1-Py0);
cx0=Px0;
cy0=Py0;

dt=1/n;
Qx(1)=Px0; % Qx at t=0
Qy(1)=Py0; % Qy at t=0
for i=1:n  
    t=i*dt;
    Qx(i+1)=((cx3*t+cx2)*t+cx1)*t + cx0;
    Qy(i+1)=((cy3*t+cy2)*t+cy1)*t + cy0;    
end


% % % --------------------------------
% % % Author: Dr. Murtaza Khan
% % % Email : drkhanmurtaza@gmail.com
% % % --------------------------------

