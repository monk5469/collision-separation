
function y=funDict2(x,CnsX,xPos,ObsClust)

N=log2(length(CnsX)+1);

for m=1:length(x)
    CnsX(xPos(m))=x(m);
end

for nth=1:length(CnsX)

MatDict(nth,:)=D2B(CnsX(nth),N).';

end

% MatDict=reshape(x,4,15).';


MatPinv=pinv(MatDict);
hEst=MatPinv*ObsClust;
ObsEst=MatDict*hEst;
y=norm((ObsClust-ObsEst),'fro');

