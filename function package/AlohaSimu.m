% clear all;
% close all;
% 
% addpath(genpath('D:\MATABLE\matable installation document\bin\9527\RFID_cards\wuhaifeng\viterbi'));
% addpath(genpath('D:\MATABLE\matable installation document\bin\9527\RFID_cards\wuhaifeng\simuADDreal'));
function [Idlenum,Succnum,Collnum2,Collnum3,Collnum4,Collnum5,Collnum6,Collnum7,Collnum8]=AlohaSimu(N,L,mento)
% N=128; %ʱ϶��
% L=128; %֡��
% %��ǩѡ��ʱ϶
% mento=100;
for i=1:mento
[NumIdle,NumSucc,NumColl,Num]=TagsChooseSlots(L,N); %��ǩѡ��ʱ϶
Succnum(i)=NumSucc;
Idlenum(i)=NumIdle;
Collnum(i)=NumColl;
[Collnum2(i),Collnum3(i),Collnum4(i),Collnum5(i),Collnum6(i),Collnum7(i),Collnum8(i)]=CollEachTagNum(Num,N);
end
% MeanIdlenum=sum(Idlenum)/mento; %һ��֡�п���ʱ϶ͳ�ƾ�ֵ
% MeanSuccnum=sum(Succnum)/mento; %һ��֡�гɹ�ʱ϶ͳ�ƾ�ֵ
% MeanCollnum=sum(Collnum)/mento; %һ��֡�г�ͻʱ϶ͳ�ƾ�ֵ
% % tag128=MeanIdlenum+MeanSuccnum+MeanCollnum;
% MeanCollnum2=sum(Collnum2)/mento; %2����ǩʱ��ռ��ͻʱ϶��ͳ�ƾ�ֵ
% MeanCollnum3=sum(Collnum3)/mento; %3����ǩʱ��ռ��ͻʱ϶��ͳ�ƾ�ֵ
% MeanCollnum4=sum(Collnum4)/mento; %4����ǩʱ��ռ��ͻʱ϶��ͳ�ƾ�ֵ
% MeanCollnumBeyond4=sum(CollnumBeyond4)/mento; %����4����ǩʱ��ռ��ͻʱ϶��ͳ�ƾ�ֵ
% % CollTag=MeanCollnum2+MeanCollnum3+MeanCollnum4+MeanCollnumBeyond4;
