function y=KindofTagSlot(N_sum,n)

% y=KindofTagSlot(tag,i-1); 
%N_sum   %tag=randi(L-1,1,N); %����N��128���Ƶ���
%n       %i=1:L
    y=0;
for j=1:length(N_sum)
    if N_sum(j)==n
       y=y+1;
    end
end