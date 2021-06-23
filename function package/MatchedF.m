function Ydec=MatchedF(x,NSample1,k2n)

NN=length(x)/NSample1;
Y1=x;
[r c]=size(Y1);
Y1_MFilter=[];
for i=1:r
    h=ones(1,NSample1);
    Y1_conv(i,:)=conv(Y1(i,:),h)/NSample1;
    for t=1:NN
        Y1_MFilter(i,t)=decision(Y1_conv(i,t*NSample1),1); %调用判决函数
% Y1_MFilter(i,t)=decision(Y1_conv(i,t*NSample1),THR); %调用判决函数
    end
end
Ydec=SymbolDecode(Y1_MFilter,k2n);