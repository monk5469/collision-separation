function XSeparated=GaAlgorithm(C,h,idx)

[ZeroVal ZeroLoc]=min(sum(abs(C),2));
ObsClust=C;
ObsClust(ZeroLoc,:)=[];
%% GA
%                 X=[real(X_snr)' imag(X_snr)']; %实部虚部
%                 NClust=2^length(h);
%                 opts = statset('Display','final');
%                 [idx,C] = kmeans(X,NClust,'Distance','cityblock',...
%                     'Replicates',50,'Options',opts);
%                 %%%%% Step 2. Cluster from kmeans is adpted as observations for LS
%                 %%%%% where a cluster [0 0 ...0] is removed becuase of carrier leak.
%                 [ZeroVal ZeroLoc]=min(sum(abs(C),2));
%                 ObsClust=C;
%                 ObsClust(ZeroLoc,:)=[];

%%%%%% Step 3. Estimate a dictinary via maximum likelihood %%%%%%
%%%%%% Step 3.1 Integral GA optimization
nvars=2^length(h)-1;
lb = zeros(1,nvars)+1;
ub = zeros(1,nvars)+nvars;
IntCon=1:nvars;
[x,fval,exitflag] = ga( @(x)funDict(x,ObsClust),nvars,[],[],[],[],...
    lb,ub,@(x)funCon(x,nvars),IntCon);

%%%%%% Step 3.2 Further optimization if possible
xPos=[];
for m=1:length(x)
    for n=1:length(x)
        if x(m)==x(n) && m~=n
            xPos=[xPos,m];%% find the same rows in the first estimated dictionary.
            break;
        end
    end
end

if length(xPos)~=0
    nvars=length(xPos); lb = zeros(1,nvars)+1; ub = zeros(1,nvars)+2^length(h)-1;
    IntCon=1:nvars;
    CnsX=x;
    x=[];
    [x,fval,exitflag] = ga( @(x)funDict2(x,CnsX,xPos,ObsClust),nvars,[],[],[],[],...
        lb,ub,@(x)funCon2(x,CnsX,xPos),IntCon);
    for m=1:length(x)
        CnsX(xPos(m))=x(m);
    end
    x=CnsX;
end
for m=1:2^length(h)-1
    DictEst(m,:)=D2B(x(m),length(h)).'; %十进制转换为二进制
end
%%%%%%% Insert cluser [0 0 0] %%%%%%%%
DictEst=[DictEst(1:ZeroLoc-1,:);zeros(1,length(h));DictEst(ZeroLoc:end,:)];

%%%%%% Step 4. Separation from the estimated dictionary %%%%%%
for m=1:length(idx)
    XSeparated(m,:)=DictEst(idx(m),:);
end
%                 %%%%%% Step 5. Viterbi Decode %%%%%%
%                 for n=1:length(h)
%                     SymbolEst(n,:)=ViterbiDecode(k2n,SInit,XSeparated(:,n).',NSample);
%                     for m=1:length(h)
%                         Tmp(m)=norm(SymbolEst(n,:)-SymbolTrans(m,:));
%                     end
%                     [ValTag LocTag]=min(Tmp);
%                     ErrorTag(n)=sum(not(SymbolEst(n,:)==SymbolTrans(LocTag,:)));
%                 end
