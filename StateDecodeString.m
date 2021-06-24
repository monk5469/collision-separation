
function y=StateDecodeString(x);

for m=1:length(x)
    y(m)=StateDecode(x(m));
end