function C=GridCluster4Tags(X,A,a)
%% ��������
[~,nn]=size(X);
% A=0.03;a=0.0001;
x=real(X);
y=imag(X);
maxx=max(x);
minx=min(x);
maxy=max(y);
miny=min(y);
Result=zeros((A/a)+1,(A/a)+1);
xfd=(maxx-minx)/(A/a);
yfd=(maxy-miny)/(A/a);

for m=1:nn
    b(m)=floor((x(m)-minx)/xfd)+1;
    c(m)=floor((y(m)-miny)/yfd)+1;
    Result(b(m),c(m))=Result(b(m),c(m))+1;
end
ResultVal=Result;
%% Ѱ�Ҿֲ���ֵ
k=3;
[M,N]=size(Result);
for i=1:(M-2);
    for j=1:(N-2);
        R=[];
        R=Result(i:i+2,j:j+2);
        mid=R(2,2);
        T1=R(1,1:k);
        T2=R(1:k,1);
        T3=R(3,1:k);
        T4=R(1:k,k);
        t1=(mid>=T1); t2=(mid>=T2); t3=(mid>=T3); t4=(mid>=T4);
        if  length(t1)==sum(t1) &&  length(t2)==sum(t2) &&  length(t3)==sum(t3) &&  length(t4)==sum(t4)
            Result(i+1,j+1)=mid;
        else
            Result(i+1,j+1)=0;
        end
        
    end
end
%% ���÷�ֵ����ֵ
[i,j]=size(Result);
for m=1:i
    for n=1:j
        %         if Result(m,n)<15 %2tags
        if Result(m,n)<2.95 %3tags % 4
            Result(m,n)=0;
        end
    end
end
Result(20,12)=0;
%% �жϷ�ֵ����(��һ��)
% [row,col]=find(Result~=0);
% for r=1:length(row)-1
%     dis(r)=sqrt((row(r+1)-row(r)).^2+(col(r+1)-col(r)).^2);
%     if dis(r)<1.5 %3tags
%         %��η�ֵ��ֵһ����
%         Result(row(r),col(r))=max(Result(row(r),col(r)),Result(row(r+1),col(r+1)));
% %         Result(row(r),col(r))=0;
%         Result(row(r+1),col(r+1))=0;   
%     end
% end
%% �жϷ�ֵ����(�ڶ���)
% [row,col]=find(Result~=0);
% for r=1:length(row)-1
%     dis(r)=sqrt((row(r+1)-row(r)).^2+(col(r+1)-col(r)).^2);
%     if dis(r)<2.5 %3tags
%         %��η�ֵ��ֵһ����
%         Result(row(r),col(r))=max(Result(row(r),col(r)),Result(row(r+1),col(r+1)));
% %         Result(row(r),col(r))=0;
%         Result(row(r+1),col(r+1))=0;   
%     end
% end
%% �жϷ�ֵ����(������)
% [row,col]=find(Result~=0);
% for r=1:length(row)-1
%     dis(r)=sqrt((row(r+1)-row(r)).^2+(col(r+1)-col(r)).^2);
%     if dis(r)<3.5 %3tags
%         %��η�ֵ��ֵһ����
%         Result(row(r),col(r))=max(Result(row(r),col(r)),Result(row(r+1),col(r+1)));
% %         Result(row(r),col(r))=0;
%         Result(row(r+1),col(r+1))=0;   
%     end
% end
%% �жϷ�ֵ����(���Ĵ�)
% [row,col]=find(Result~=0);
% for r=1:length(row)-1
%     dis(r)=sqrt((row(r+1)-row(r)).^2+(col(r+1)-col(r)).^2);
%     if dis(r)<2.1 %3tags
%         %��η�ֵ��ֵһ����
%         Result(row(r),col(r))=max(Result(row(r),col(r)),Result(row(r+1),col(r+1)));
% %         Result(row(r),col(r))=0;
%         Result(row(r+1),col(r+1))=0;   
%     end
% end
%% 3 tags
[r,c]=find(Result~=0);
kNum=0;
for i=1:length(r)
            kNum=kNum+1;
            Cx=r(i)*xfd+minx;
            Cy=c(i)*yfd+miny;
            C(kNum,:)=[Cx Cy];
end
