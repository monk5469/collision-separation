clear all;
close all;

k2n=2;  % n bits to k bits:k/n
SInit=1; % the initial state
h1=1;
h2=1;
h3=1;
NSample1=700;
NSample2=600;
NSample3=500;

N=16;

Mento=50;
SNR=[0 5 10 15 20 25];
for mento=1:Mento
    for snr=1:length(SNR)
SymbolTrans1=randint(1,N,2);
StateTrans1=StateString(SInit,SymbolTrans1);
RecCode1=h1*CodeString(StateTrans1);
[lin col]=size(RecCode1);
for m=1:lin
    for c=1:col
        RecCodeSample1(m,(c-1)*NSample1+1:c*NSample1)=RecCode1(m,c);
    end
end
RecCodeSample1=awgn(RecCodeSample1,SNR(snr),'measured');

SymbolTrans2=randint(1,N,2);
StateTrans2=StateString(SInit,SymbolTrans2);
RecCode2=h2*CodeString(StateTrans2);
[lin col]=size(RecCode2);
for m=1:lin
    for c=1:col
        RecCodeSample2(m,(c-1)*NSample2+1:c*NSample2)=RecCode2(m,c);
    end
end

SymbolTrans3=randint(1,N,2);
StateTrans3=StateString(SInit,SymbolTrans3);
RecCode3=h3*CodeString(StateTrans3);
[lin col]=size(RecCode3);
for m=1:lin
    for c=1:col
        RecCodeSample3(m,(c-1)*NSample3+1:c*NSample3)=RecCode3(m,c);
    end
end

X=RecCodeSample1+[RecCodeSample2 zeros(1,length(RecCodeSample1)-length(RecCodeSample2))]+[RecCodeSample3 zeros(1,length(RecCodeSample1)-length(RecCodeSample3))];


% for m=1:length(X)
%     if X(m)>=0.5
%         XDecision(m)=1;
%     elseif X(m)<0.5
%         XDecision(m)=0;
%     end
% end
% XDecision=X;
% XTmp=Code2State(XDecision);
% XDecisionDecode=StateDecodeString(XTmp);
% RecCode1=[0 1 0 0 1 0 1 0 1 1];

YSymbol1=ViterbiDecode(k2n,SInit,X,NSample1);
YSymbolCode1=CodeString(StateString(SInit,YSymbol1));
[lin col]=size(YSymbolCode1);
for m=1:lin
    for c=1:col
        YSymbolCodeSample1(m,(c-1)*NSample1+1:c*NSample1)=YSymbolCode1(m,c);
    end
end

YSymbol2=ViterbiDecode(k2n,SInit,(X-YSymbolCodeSample1)/h2,NSample2);
YSymbolCode2=CodeString(StateString(SInit,YSymbol2(1:N)));
YSymbolCodeSample2=zeros(1,length(X));
[lin col]=size(YSymbolCode2);
for m=1:lin
    for c=1:col
        YSymbolCodeSample2(m,(c-1)*NSample2+1:c*NSample2)=YSymbolCode2(m,c);
    end
end

YSymbol3=ViterbiDecode(k2n,SInit,(X-YSymbolCodeSample1-YSymbolCodeSample2)/h3,NSample3);
% ErrorDecision(k)=sum(not(XDecisionDecode==SymbolTrans1));
% SERDecision(k)=ErrorDecision(k)/N

ErrorViterbi1=sum(not(YSymbol1==SymbolTrans1));
SERViterbi1=ErrorViterbi1/N;

ErrorViterbi2=sum(not(YSymbol2(1:N)==SymbolTrans2));
SERViterbi2=ErrorViterbi2/N;

ErrorViterbi3=sum(not(YSymbol3(1:N)==SymbolTrans3));
SERViterbi3=ErrorViterbi3/N;

SERViterbi(mento,snr)=(SERViterbi1+SERViterbi2+SERViterbi3)/3;
end
end

% SERDecisionMean=mean(SERDecision);
SERViterbiMean=mean(SERViterbi);


