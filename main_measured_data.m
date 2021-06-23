clear all;
close all;

addpath(genpath('D:\...\viterbi'));
addpath(genpath('D:\...\function package'));

fi_1 = fopen('D:\...\source_2tags','rb');% 2 collision tags
% fi_1 = fopen('D:\...\source_3tags','rb');% 3 collision tags
% fi_1 = fopen('D:\...\source_4tags','rb');% 4 collision tags

k2n=2;  % n bits to k bits:k/n
SInit=1; % the initial state
f=1;
fs=25; % Frequency for signals and samples, respectively
NSample=fs/f;
N=16; % lenth of transmitted bits
TagNum=[2,3,4];
Tag=TagNum(1); % Select the number of Tags  % TagNum(1) is 2 collision tags
x=measured_dataOutput(fi_1);% need to choose the tag number in function:"realdataOutput"

mento=500; 
NElement=128; % source number
L=128; % frame size
[Idlenum,NumSucc,Collnum2,Collnum3,Collnum4,Collnum5,Collnum6,Collnum7,Collnum8]=AlohaSimu(NElement,L,mento);

MatDict=[];
MatPinv=[];
X_snr=x;

%% BS GA
h=[1:Tag];
if Tag<4
    Seq=perms(1:2^length(h)-1);%%% A point [0 0 0] can be removed from carrier leaks.
    for nth=1:size(Seq,1)
        for m=1:2^length(h)-1
            MatDict(m,:,nth)=D2B(Seq(nth,m),length(h)).';
        end
        MatPinv(:,:,nth)=pinv(MatDict(:,:,nth));
    end
end

%% K-means clustering
[idx,C]=kmeansfunc(X_snr,h);

%% grid clustering
Grid=0.03;EachDis=0.001;%3tags
if     Tag==2
    C=GridCluster2Tags(X_snr,Grid,EachDis);
elseif Tag==3
    C=GridCluster3Tags(X_snr,Grid,EachDis);
elseif Tag==4
    C=GridCluster4Tags(X_snr,Grid,EachDis);
end
idx=confirmthecluster(C,X_snr);

%% collision separation
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
