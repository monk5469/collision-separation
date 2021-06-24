function y=StateDecode(XState)


% SLast=0; % last state
% XBin=1; % binary variable

switch XState
    case 0
         y=0;
    case 1
         y=1;
    case 2
        y=0;
    case 3
        y=1;
end
