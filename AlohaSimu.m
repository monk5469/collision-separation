% clear all;
% close all;
% 
% addpath(genpath('D:\MATABLE\matable installation document\bin\9527\RFID_cards\wuhaifeng\viterbi'));
% addpath(genpath('D:\MATABLE\matable installation document\bin\9527\RFID_cards\wuhaifeng\simuADDreal'));
function [Idlenum,Succnum,Collnum2,Collnum3,Collnum4,Collnum5,Collnum6,Collnum7,Collnum8]=AlohaSimu(N,L,mento)
% N=128; %时隙数
% L=128; %帧长
% %标签选择时隙
% mento=100;
for i=1:mento
[NumIdle,NumSucc,NumColl,Num]=TagsChooseSlots(L,N); %标签选择时隙
Succnum(i)=NumSucc;
Idlenum(i)=NumIdle;
Collnum(i)=NumColl;
[Collnum2(i),Collnum3(i),Collnum4(i),Collnum5(i),Collnum6(i),Collnum7(i),Collnum8(i)]=CollEachTagNum(Num,N);
end
% MeanIdlenum=sum(Idlenum)/mento; %一个帧中空闲时隙统计均值
% MeanSuccnum=sum(Succnum)/mento; %一个帧中成功时隙统计均值
% MeanCollnum=sum(Collnum)/mento; %一个帧中冲突时隙统计均值
% % tag128=MeanIdlenum+MeanSuccnum+MeanCollnum;
% MeanCollnum2=sum(Collnum2)/mento; %2个标签时所占冲突时隙数统计均值
% MeanCollnum3=sum(Collnum3)/mento; %3个标签时所占冲突时隙数统计均值
% MeanCollnum4=sum(Collnum4)/mento; %4个标签时所占冲突时隙数统计均值
% MeanCollnumBeyond4=sum(CollnumBeyond4)/mento; %超过4个标签时所占冲突时隙数统计均值
% % CollTag=MeanCollnum2+MeanCollnum3+MeanCollnum4+MeanCollnumBeyond4;
