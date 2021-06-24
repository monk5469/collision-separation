function SymbolEst=cVitDec(SNR,SymbolTrans,h,k2n,SInit,XTag,NSample)

for n=1:length(h)
    Tmp=[];
    X_snr=[];
    if length(h)~=1
        X_sum=sum(XTag);
        X_sum=abs(X_sum);
        X_snr=awgn(X_sum,SNR,'measured');
    else
        X_sum=XTag;
        X_sum=abs(X_sum);
        X_snr=awgn(X_sum,SNR,'measured');
    end
%     X_snr=awgn(X_sum,SNR,'measured');
    SymbolEst(n,:)=ViterbiDecode(k2n,SInit,X_snr,NSample);

    for m=1:length(h)
        Tmp(m)=norm( SymbolEst(n,:)-SymbolTrans(m,:));
    end
    [ValTag LocTag]=min(Tmp);
    
    %     ErrorTag(n)=sum(not(SymbolEst==SymbolTrans(LocTag,:)));
    if length(h)~=1
        SymbolTrans=Matrix_reduction(LocTag,SymbolTrans);
        XTag=Matrix_reduction(LocTag,XTag);
        h=(Matrix_reduction(LocTag,h'))';
    end
    
end