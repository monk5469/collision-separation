function ErrorTag=errorrate(SymbolEst,SymbolTrans,h)

for n=1:length(h)
    Tmp=[];
%     SymbolE=[];
%     SymbolE=SymbolEst(n,:);
    for m=1:length(h)
        Tmp(m)=norm(SymbolEst(n,:)-SymbolTrans(m,:));
    end
    [ValTag LocTag]=min(Tmp);
    ErrorTag(n)=sum(not(SymbolEst(n,:)==SymbolTrans(LocTag,:)));
    if length(h)~=1
        SymbolTrans=Matrix_reduction(LocTag,SymbolTrans);
        %     X_snr=Matrix_reduction(LocTag,X_snr);
        h=(Matrix_reduction(LocTag,h'))';
    end
end