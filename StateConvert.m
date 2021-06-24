function y=StateConvert(SLast,XBin)


% SLast=0; % last state
% XBin=1; % binary variable

switch SLast
    case 0
        if XBin==0
            y=0;
        elseif XBin==1
            y=1;
        end
    case 1
        if XBin==0
            y=2;
        elseif XBin==1
            y=3;
        end
    case 2
        if XBin==0
            y=2;
        elseif XBin==1
            y=3;
        end
    case 3
        if XBin==0
            y=0;
        elseif XBin==1
            y=1;
        end
end
