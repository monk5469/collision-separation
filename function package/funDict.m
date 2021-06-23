
function y=funDict(x,ObsClust)

N=log2(length(x)+1);

for nth=1:length(x)

MatDict(nth,:)=D2B(x(nth),N).';

end

% MatDict=reshape(x,4,15).';


MatPinv=pinv(MatDict);
hEst=MatPinv*ObsClust;
ObsEst=MatDict*hEst;
y=norm((ObsClust-ObsEst),'fro');

