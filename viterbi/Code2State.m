
function y=Code2State(x)
for m=1:length(x)/2
    tmp=x((m-1)*2+1)*2^1+x(m*2);
    switch tmp
        case 0
            y(m)=3;
        case 1
            y(m)=2;
        case 2
            y(m)=0;
        case 3
            y(m)=1;
    end
    
end