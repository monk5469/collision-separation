
function y=StateString(SLast,x)

for m=1:length(x)
    y(m)=StateConvert(SLast,x(m));
    SLast=y(m);
end