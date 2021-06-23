% clear all;
% close all;

function y=RankTheNum(x)
% x=[6 3
%    4 6
%    2 1
%    5 7];
[r c]=size(x);
y=zeros(r,c);
for i=1:r
    k=1;
   d(i)=sqrt((x(i,k))^2+(x(i,k+1))^2);
    k=k+1;
end
D=d;
for j=1:r
[value1 row]=max(D);
y(j,:)=x(row,:);
D(row)=0;
end

