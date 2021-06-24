function [idx,C]=kmeansfunc(X_snr,h)

X=[real(X_snr)' imag(X_snr)']; %Êµ²¿Ðé²¿
NClust=2^length(h);
%                 opts = statset('Display','final');
%                 [idx,C] = kmeans(X,NClust,'Distance','cityblock',...
%                     'Replicates',50,'Options',opts);
[idx,C] = kmeans(X,NClust,'Distance','cityblock',...
    'Replicates',50);
%% 2tags»­Í¼
% figure(4);
% plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12);
% hold on;
% plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12);
% hold on;
% plot(X(idx==3,1),X(idx==3,2),'g.','MarkerSize',12);
% hold on;
% plot(X(idx==4,1),X(idx==4,2),'c.','MarkerSize',12);
% plot(C(:,1),C(:,2),'k*', 'MarkerSize',12,'LineWidth',3);
% legend('Cluster 1','Cluster 2','Cluster 3','Cluster 4','Centroids', 'Location','NW');

%% 3tags»­Í¼
% figure(4);
% plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12);
% hold on;
% plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12);
% hold on;
% plot(X(idx==3,1),X(idx==3,2),'g.','MarkerSize',12);
% hold on;
% plot(X(idx==4,1),X(idx==4,2),'c.','MarkerSize',12);
% hold on;
% plot(X(idx==5,1),X(idx==5,2),'b.','MarkerSize',12);
% hold on;
% plot(X(idx==6,1),X(idx==6,2),'g.','MarkerSize',12);
% hold on;
% plot(X(idx==7,1),X(idx==7,2),'c.','MarkerSize',12);
% hold on;
% plot(X(idx==8,1),X(idx==8,2),'g.','MarkerSize',12);
% plot(C(:,1),C(:,2),'k*', 'MarkerSize',12,'LineWidth',3);

% %% 4tags»­Í¼
% figure(4);
% plot(X(idx==1,1),X(idx==1,2),'r.','MarkerSize',12);
% hold on;
% plot(X(idx==2,1),X(idx==2,2),'b.','MarkerSize',12);
% hold on;
% plot(X(idx==3,1),X(idx==3,2),'g.','MarkerSize',12);
% hold on;
% plot(X(idx==4,1),X(idx==4,2),'c.','MarkerSize',12);
% hold on;
% plot(X(idx==5,1),X(idx==5,2),'b.','MarkerSize',12);
% hold on;
% plot(X(idx==6,1),X(idx==6,2),'g.','MarkerSize',12);
% hold on;
% plot(X(idx==7,1),X(idx==7,2),'c.','MarkerSize',12);
% hold on;
% plot(X(idx==8,1),X(idx==8,2),'g.','MarkerSize',12);
% hold on;
% plot(X(idx==9,1),X(idx==9,2),'r.','MarkerSize',12);
% hold on;
% plot(X(idx==10,1),X(idx==10,2),'b.','MarkerSize',12);
% hold on;
% plot(X(idx==11,1),X(idx==11,2),'g.','MarkerSize',12);
% hold on;
% plot(X(idx==12,1),X(idx==12,2),'c.','MarkerSize',12);
% hold on;
% plot(X(idx==13,1),X(idx==13,2),'b.','MarkerSize',12);
% hold on;
% plot(X(idx==14,1),X(idx==14,2),'g.','MarkerSize',12);
% hold on;
% plot(X(idx==15,1),X(idx==15,2),'c.','MarkerSize',12);
% hold on;
% plot(X(idx==16,1),X(idx==16,2),'g.','MarkerSize',12);
% plot(C(:,1),C(:,2),'k*', 'MarkerSize',12,'LineWidth',3);