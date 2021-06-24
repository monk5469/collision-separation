% clear all;
% close all;
% 
% Rec=[0 1 0 0 1 0];
% 
% PathCodeTmp=[0 1 0 0 1 0
%              1 0 0 1 0 0];


function y=CmptHMDist(x,table,NSample)

[lin col]=size(x);

%%%%%%%%%%%%%%%%%%% compute the distance of HM %%%%%%%%%%%%%%%%%%%%%%%%%%%
% for m=1:lin
%     boll=not(x(m,:)==table);
%     y(m,1)=sum(boll);
% end

%%%%%%%%%%%%%%%%%% compute the Euclidean distance %%%%%%%%%%%%%%%%%%%%%%%
for m=1:lin
    for c=1:col
        xSample(m,(c-1)*NSample+1:c*NSample)=x(m,c);
    end
end
    
for m=1:lin
    EuclDist=norm(xSample(m,:)-table);
    y(m,1)=sum(EuclDist);
end
