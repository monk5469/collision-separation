function [c,ceq]=funCon2(x,CnsX,xPos)
  ceq=[];
  N=length(CnsX);
  for m=1:length(x)
    CnsX(xPos(m))=x(m);
  end
  c = length(unique(CnsX))-N;

% MatTmp1=reshape(x,4,15).';
% MatTmp2=unique(MatTmp1,'rows');
% 
% c= size(MatTmp2,1)-15;


