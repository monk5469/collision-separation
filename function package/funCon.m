function [c,ceq]=funCon(x,N)
ceq=[];

c = length(unique(x))-N;

% MatTmp1=reshape(x,4,15).';
% MatTmp2=unique(MatTmp1,'rows');
% 
% c= size(MatTmp2,1)-15;


