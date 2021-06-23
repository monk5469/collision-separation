function X=SignalFM0(k2n,SInit,SymbolTrans1,NSample1,h)
  
  for n=1:length(h)
    StateTrans1=StateString(SInit,SymbolTrans1(n,:));
    RecCode1=h(n)*CodeString(StateTrans1);
    [lin col]=size(RecCode1);
%     for m=1:lin
        for c=1:col
            RecCodeSample1((c-1)*NSample1+1:c*NSample1)=RecCode1(c);
        end
%     end
     X(n,:)=RecCodeSample1;
  end

end