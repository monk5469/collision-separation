function y=CodeConvert(X)


% SLast=0; % last state
% XBin=1; % binary variable

switch X
    case 0
        y=[1 0];
    case 1
        y=[1 1];
    case 2
        y=[0 1];
    case 3
        y=[0 0];
end