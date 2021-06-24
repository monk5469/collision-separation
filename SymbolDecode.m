function y=SymbolDecode(x,k2n)

if k2n==2
    k=1;
    for i=1:length(x)/k2n
        if x(k)~=x(k+1)
            y(i)=0;
        else
            y(i)=1;
        end
        k=k+2;
    end
    
elseif k2n==4
    k=1;
    for i=1:length(x)/k2n
        if x(k)~=x(k+1)
            y(i)=0;
        else
            y(i)=1;
        end
        k=k+4;
    end
    
end