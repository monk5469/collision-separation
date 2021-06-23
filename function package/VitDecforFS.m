function  SymbolEst=VitDecforFS(XSeparated,k2n,SInit,NSample,h)
% ErrorTag=VitDecforFS(XSeparated,k2n,SInit,NSample,h,SymbolTrans);
%%%%%% Step 5. Viterbi Decode %%%%%%
for n=1:length(h)
%     SymbolEst(n,:)=ViterbiDecode(k2n,SInit,XSeparated(:,n).',NSample);
SymbolEst(n,:)=ViterbiDecode(k2n,SInit,XSeparated(n,:),NSample);
%     for m=1:length(h)
%         Tmp(m)=norm(SymbolEst(n,:)-SymbolTrans(m,:));
%     end
%     [ValTag LocTag]=min(Tmp);
%     ErrorTag(n)=sum(not(SymbolEst(n,:)==SymbolTrans(LocTag,:)));
end