clear all;
close all;

addpath(genpath('D:\...\viterbi'));
addpath(genpath('D:\...\function package'));

NElement=128; % source number
L=128; % frame size

Tag=4; % Select the number of Tags
SNR=10; % enter the SNR value

k2n=2;  % n bits to k bits:k/n
SInit=1; % the initial state
f=1;
fs=50; % Frequency for signals and samples, respectively
NSample=fs/f;
N=16; % lenth of transmitted bits

[theta,r]=HcoefficientReal(Tag);
h=ComplexChannel(theta,r);

rng('default'); %%% for debugging
SymbolTrans=randi(2,length(h),N)-1;
XTag=SignalFM0(k2n,SInit,SymbolTrans,NSample,h);
X_sum=sum(XTag);
X_snr=awgn(X_sum,SNR,'measured');

y=Sep(X_snr,h,Tag);
for tagloop=1:Tag
    %% H-Viterbi
    HvitYSymbol(tagloop,:)=ViterbiDecode(k2n,SInit,y(tagloop,:),NSample); % viterbi decoding
end

%% C-Viterbi
CvitSymbolEst=cVitDec(SNR,SymbolTrans,h,k2n,SInit,XTag,NSample);

%%  collision separation
if Tag<4
    Seq=perms(1:2^length(h)-1);%%% A point [0 0 0] can be removed from carrier leaks.
    for nth=1:size(Seq,1)
        for m=1:2^length(h)-1
            MatDict(m,:,nth)=D2B(Seq(nth,m),length(h)).';
        end
        MatPinv(:,:,nth)=pinv(MatDict(:,:,nth));
    end
end

[idx,C]=kmeansfunc(X_snr,h); % K-means clustering

if Tag<4
    XSeparated=BsAlgorithm(Seq,MatDict,MatPinv,C,h,idx);
else
    XSeparated=GaAlgorithm(C,h,idx);
end
%% FSVD
FsvdSymbolEst=VitDecforFS(XSeparated',k2n,SInit,NSample,h);
%% FS-jump
FsjumpSymbolEst=FM0DecforFsJump(XSeparated',k2n,NSample,h);

disp(FsvdSymbolEst);
disp(FsjumpSymbolEst);