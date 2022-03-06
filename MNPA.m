%1 A)
%-------------------------------------------------------------
% Time Domain:
% v1 = vin;
% (v2-v1)*G1 + v2*G2 +C*d(v2-v1)/dt - d(IL)/dt = 0
% IL = (v3-v2)/L;
% IL = v3*G3
% v4 = a*v3*G3; 
% (v5-v4)*G4 + v5*G5 = 0
%1 B)
%-------------------------------------------------------------
% Frequency Domain:
% v1 = vin; 
% (v2-v1)*G1 + v2*G2 +C*jw(v2-v1) + jwIL = 0
% IL = (v2-v3)/L;
% IL = v3*G3 ;
% v4 = a*v3*G3;
% (v5-v4)*G4 + v5*G5 = 0
% 
% unknowns:
% v1
% v2
% v3
% v4
% v5
% IL
%2 A)
%-------------------------------------------------------------
clearvars; close all
set(0,'DefaultFigureWindowStyle','docked')
G1 = 1/1;
G2 = 1/2;
G3 = 1/10;
G4 = 1/0.1;
G5 = 1/1000;
v1 = 0;
v2 = 0;
v3 = 0;
v4 = 0;
v5 = 0;
IL = 0;
a = 100;
%comment out for part 2 D)
%-------------------------------------------------------------
Cap = 0.25;
%-------------------------------------------------------------
L = 0.2;
n = 6;
step = 100;
G = zeros(n,n);
C = zeros(n,n);
V = zeros(n,1);
F = zeros(n,1);
V_5 = zeros(step,1);
Vin = linspace(-10,10,step);
V_3 = zeros(step,1);
V_1 = zeros(step,1);
freq = linspace(0,100,step);

V(1,1) = v1;
V(2,1) = v2;
V(3,1) = v3;
V(4,1) = v4;
V(5,1) = v5;
V(6,1) = IL;

G(1,1) = 1;
G(2,1) = -G1;
G(2,2) = G1 + G2;
G(3,2) = 1/L;
G(3,3) = -1/L;
G(3,6) = 1;
G(4,3) = G3;
G(4,6) = 1;
G(5,3) = G3*a;
G(5,4) = 1;
G(6,4) = -G4;
G(6,5) = G4 + G5;

C(2,6) = 1;

%comment out for part 2 D)
%-------------------------------------------------------------
C(3,1) = -Cap;
C(3,2) = Cap;
%-------------------------------------------------------------

F(1,1) = v1;

%2 B)
%-------------------------------------------------------------
for i = 1:step
   F(1,1) = Vin(i);
    V = G\F;
    V_5(i) = V(5,1);
    V_3(i) = V(3,1);
end

subplot(1,2,1)
plot(Vin,V_5,Vin,Vin)
subplot(1,2,2)
plot(Vin,V_3,Vin,Vin)



%2 C)
%-------------------------------------------------------------
% for i = 1:step
%    F(1,1) = Vin(i);
%    A = G + 1j*2*pi*freq(i)*C;
%    V = A\F;
%    V_5(i) = V(5,1);
%    V_1(i) = V(1,1);
% end
% 
% subplot(1,2,1)
% plot(freq,V_5)
% 
% subplot(1,2,2)
% plot(freq,(20*log(V_5/V_1)))



%D)
%-------------------------------------------------------------
% Cap = (randn(step) *0.05)+0.25;
% w =  linspace(0,pi,step);
% gain = zeros(step,1);
% for i = 1:step
%    F(1,1) = Vin(i);
%    C(3,1) = -Cap(i);
%    C(3,2) = Cap(i);
%    A = G + 1j*2*pi*w(i)*C;
%    V = A\F;
%    V_5(i) = V(5,1);
%    V_1(i) = V(1,1);
%    gain(i) = (abs(20*log(V_5(i)/V_1(i))));
%  end
% 
%  subplot(1,2,1)
%  histogram(Cap)
% 
%  subplot(1,2,2)
%  histogram(gain)



