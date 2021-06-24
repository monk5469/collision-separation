
function y=CodeString(x)
for m=1:length(x)
    tmp=CodeConvert(x(m));
    y((m-1)*length(tmp)+1:m*length(tmp))=tmp;
end