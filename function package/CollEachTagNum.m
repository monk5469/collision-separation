% function [Collnum2,Collnum3,Collnum4,CollnumBeyond4]=CollEachTagNum(Num,N)
% function [Collnum2,Collnum3,Collnum4,Collnum5,Collnum6,Collnum7,Collnum8]=CollEachTagNum(Num,N)
function [Collnum2,Collnum3,Collnum4,Collnum5,Collnum6,Collnum7,Collnum8]=CollEachTagNum(Num,N)
N=length(Num);
Collnum2=0;
Collnum3=0;
Collnum4=0;
% CollnumBeyond4=0;
Collnum5=0;
Collnum6=0;
Collnum7=0;
Collnum8=0;
for i=1:N
    if Num(i) == 2
        Collnum2=Collnum2+1;
    elseif Num(i) == 3
        Collnum3=Collnum3+1;
    elseif Num(i) == 4
        Collnum4=Collnum4+1;
    elseif Num(i) == 5
        Collnum5=Collnum5+1;
    elseif Num(i) == 6
        Collnum6=Collnum6+1;
    elseif Num(i) == 7
        Collnum7=Collnum7+1;
    elseif Num(i) == 8
        Collnum8=Collnum8+1;
        %     elseif Num(i) > 4
        %         CollnumBeyond4=CollnumBeyond4+1;
    end
end