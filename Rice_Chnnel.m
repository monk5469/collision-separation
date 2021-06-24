clear all;
close all;
% function randmH=Hcoefficient_temporary(Tag)
mento=10000;
for hNum=1:mento
% h=random('raylrnd',1,11)/sqrt(pi/2)
% Kdb=0.1;
Kdb=6;
M=1;
% N=100;
N=1;
% function [ H ] = rice_matrix(Kdb,M,N)
% H = a*H_los + b*H_nlos
% a^2 + b^2 = 1
% K is the rician factor, denoting as the ratio of the LOS amplitude to the
% rayleigh component
% When K = 0, then rice matrix is reduced to rayleigh matrix.
K=10^(Kdb/10);
% K=15;
H_los=ones(M,N);% LOS
H_nlos=(randn(M,N)+1i*randn(M,N))/sqrt(2);% rayleigh
H=sqrt(K/(K+1))*H_los+sqrt(1/(1+K))*H_nlos;
h_abs=abs(H);
[r c]=min(h_abs);
randmH(1,hNum)=H(M,c);
% randmH(1,hNum)=H;
% end
end

Hsum=sum(randmH)/mento;
Hfinal=Hsum^2;
Hfinal=abs(Hfinal);
disp(Hfinal);


