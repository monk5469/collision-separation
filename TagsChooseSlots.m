function [c0,c1,ck,Num]=TagsChooseSlots(L,N)
%L=128
%N=[50,100,150,200,250,300,350]

    c0=0;
    c1=0;
    ck=0;
% tag=randint(N,1,L); %产生N个L进制的数
tag=randi(L-1,1,N); %产生N个L进制的数 %%产生N个标签
for i=1:L
    y=KindofTagSlot(tag,i-1); %(i-1)slot %tag %50(50:50:350)个tags分别在第(1:128)个slot搜寻
    Num(i)=y;
    if y==0
        c0=c0+1; %idle
    elseif y==1
        c1=c1+1; %succ
    else 
        ck=ck+1; %coll
    end
end
    
    

