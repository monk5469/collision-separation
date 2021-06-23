
function XSeparated=BsAlgorithm(Seq,MatDict,MatPinv,C,h,idx)

[ZeroVal ZeroLoc]=min(sum(abs(C),2));
% ObsClust=C;
% ObsClust(ZeroLoc,:)=[];
% Seq=perms(1:2^length(h)-1);%%% A point [0 0 0] can be removed from carrier leaks.
% for nth=1:size(Seq,1)
%     for m=1:2^length(h)-1
%         MatDict(m,:,nth)=D2B(Seq(nth,m),length(h)).';
%     end
%     MatPinv(:,:,nth)=pinv(MatDict(:,:,nth));
% end
%% BS
%                 X=[real(X_snr)' imag(X_snr)'];
%                 NClust=2^length(h);
%                 opts = statset('Display','final');
%                 opts =[];
%                 [idx,C] = kmeans(X,NClust,'Distance','cityblock',...
%                     'Replicates',50,'Options',opts);
%                 [ZeroVal ZeroLoc]=min(sum(abs(C),2));
                ObsClust=C;
                ObsClust(ZeroLoc,:)=[];

for nth=1:size(Seq,1)
    hEst=MatPinv(:,:,nth)*ObsClust;
    ObsEst=MatDict(:,:,nth)*hEst;
    ValSet(nth)=norm((ObsClust-ObsEst),'fro');
end
[CVal CLoc]=min(ValSet);
DictEst=MatDict(:,:,CLoc);
%%%%%%% Insert cluser [0 0 ... 0] %%%%%%%%
DictEst=[DictEst(1:ZeroLoc-1,:);zeros(1,length(h));DictEst(ZeroLoc:end,:)];

%%%%%% Step 4. Separation from the estimated dictionary %%%%%%
for m=1:length(idx)
    XSeparated(m,:)=DictEst(idx(m),:);
end

