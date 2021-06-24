

function YSymbol=ViterbiDecode(k2n,SInit,RecCode,NSample)

%%%%%%%%%%%%%%%%%%%%%%% The first 3 paths %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


Rec=RecCode(1:k2n*3*NSample);
PathTable1=[0 0 0;
      0 0 1;
      0 1 0;
      0 1 1;
      1 0 0;
      1 0 1;
      1 1 0;
      1 1 1;]; % all existed paths
  


[NumPath1 NumState1]=size(PathTable1); % 

for m=1:NumPath1
    Path1(m,:)=StateString(SInit,PathTable1(m,:)); % gives a string of states
end

for n=1:NumState1+1
    i=1;
    for m=1:NumPath1
        if Path1(m,NumState1)==n-1
            PathTmp(i,:)=Path1(m,:);
            PathCodeTmp(i,:)=CodeString(PathTmp(i,:)); % gives a string of codes which are converted from states
            i=i+1;
        end
    end
    Cost=CmptHMDist(PathCodeTmp,Rec,NSample); % compute the hanming distances of paths
    [val loc]=min(Cost);
    PathSave(n,:)=PathTmp(loc,:); % saves the minimum paths
    PathVal(n,:)=val; % saves the value of paths
end

%%%%%%%%%%%%%%%%%%%%%%%%%% Subsequent paths %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Rec2=RecCode(k2n*3*NSample+1:length(RecCode));
PathTable2=[0;
            1];
  


m=1;
for state0=1:NumState1+1
    for XInput=1:2
        PathEvery(m,:)=StateConvert(state0-1,XInput-1); % all states converting next states
        m=m+1;
    end
end

%%%%% all existing paths saves in PathNext, and all existing values of
%%%%% paths saves in PathValNext %%%%%%%%%%%%%%%%%%%%%%
for bit=1:length(Rec2)/(k2n*NSample)
PathPre=PathSave;
PathValPre=PathVal;
PathNext=[];
PathValNext=[];
m=1;
for state0=1:NumState1+1
    for XInput=1:2
        PathNext(m,:)=[PathPre(state0,:),PathEvery(m,:)];
        PathValNext(m,:)=PathValPre(state0,:);
        m=m+1;
    end
end


%%%%%%%%%%%%%%%%% Selects the minimum paths form all existing paths%%%%%%%%%%%%%%%%% 

% PathTmp=zeros(2,length(PathNext(1,:)));
% PathValTmp=zeros(2,1);
% PathCodeTmp=zeros(2,k2n);
% PathSave=zeros((NumState1+1)/2,length(PathNext(1,:)));
% PathVal=zeros((NumState1+1)/2,1);

PathTmp=[];
PathValTmp=[];
PathCodeTmp=[];
PathSave=[];
PathVal=[];

for n=1:NumState1+1
    i=1;
    for m=1:NumPath1
        if PathNext(m,length(PathNext(1,:)))==n-1
            PathTmp(i,:)=PathNext(m,:);
            PathValTmp(i,:)=PathValNext(m,:);
            PathCodeTmp(i,:)=CodeConvert(n-1);
            i=i+1;
        end
    end
    Cost=CmptHMDist(PathCodeTmp,Rec2((bit-1)*k2n*NSample+1:bit*k2n*NSample),NSample)+PathValTmp;
    [val loc]=min(Cost);
    PathSave(n,:)=PathTmp(loc,:);
    PathVal(n,1)=val;
end
end

[YVal YLoc]=min(PathVal);
YState=PathSave(YLoc,:);
YCode=CodeString(YState);
YSymbol=StateDecodeString(YState);
