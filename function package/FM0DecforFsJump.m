function  SymbolEst=FM0DecforFsJump(XSeparated,k2n,NSample,h)

%%%%%% Step 5. Viterbi Decode %%%%%%
for n=1:length(h)
    Y_ori=[];
    Y_ori=MatchedF(XSeparated(n,:),NSample,k2n);
    SymbolEst(n,:)=Y_ori;
%     for m=1:length(h)
%         Tmp(m)=norm(Y_ori(n,:)-SymbolTrans(m,:));
%     end
%     [ValTag LocTag]=min(Tmp);
%     ErrorTag(n)=sum(not(Y_ori(n,:)==SymbolTrans(LocTag,:)));
end