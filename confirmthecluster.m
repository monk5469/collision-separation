function Idx=confirmthecluster(CenT,X_snr)

[r c]=size(CenT);
[R C]=size(X_snr);

for i=1:C
    dis=[];
    loc=0;
    for j=1:r
        dis(j)=sqrt((real(X_snr(i))-CenT(j,1))^2+(imag(X_snr(i))-CenT(j,2))^2);
    end
    [~,loc]=min(dis);
    Idx(i,:)=loc;
end
