function [theta,r]=HcoefficientReal(Tag)

switch Tag
    case 2
        %% sinr
        theta=[3*pi/4 pi/4];
        r=[0.5 0.3];
%         theta=[3*pi/4 3*pi/4];
%         r=[0.9 0.1];
        
        %% sinr
                %% final  3
%         theta=[pi/4 pi/8];
%         r=[0.3 0.5];
%         theta=[pi/8 pi/4];
%         r=[0.5 0.3]; % 0.3(T1)¹Ì¶¨

                %% final  3
        %%%% Case 2. Three tags %%%%%
%         theta=[pi/4 3*pi/8];
%         r=[0.3 0.5];
%% final realdata 1
%         theta=[pi/4 3*pi/8];
%         r=[-0.3 -0.5];
%% final realdata 2
%           theta=[1*pi/7 1*pi/7];
%           r=[0.3 0.31];
%% final realdata 2
%           theta=[pi/4 pi/4];
%           r=[0.3 0.3];
%% final 
    case 3
        %%%% Case 3. Three tags %%%%%
%         theta=[pi/4 5*pi/8 pi/11];
%         r=[0.2 0.3 0.5];
        %% final  3
        theta=[pi/8 pi/4 3*pi/8];
        r=[0.2 0.3 0.6];
        %% final  3
%         %% final 1 realdata
%         theta=[pi/8 pi/11 3*pi/8];
%         r=[-0.2 -0.3 -0.5];
%         %% final 1
%         theta=[pi/8 pi/11 3*pi/8];
%         r=[0.02 0.03 0.05];
%% final realdata 3
%         theta=[pi/12 1.1*pi/12 1.2*pi/12];
%         r=[0.22 0.21 0.2];
    case 4
        %%%% Case 4. four tags %%%%%
%                 theta=[3*pi/8 5*pi/8 pi/4 pi/11];
%                 r=[0.2 0.3 0.1 0.4];
%% final
%         theta=[3*pi/8 2*pi/8 pi/4 pi/11];
%         r=[-0.2 -0.3 -0.1 -0.4];
%% final
        %% final  3
        theta=[2*pi/9 3*pi/8 pi/8 pi/7];
        r=[0.3 0.4 0.2 0.1];
        %% final  3
%         theta=[pi/8 11*pi/8 7*pi/11 1*pi/7];
%         r=[0.1 0.2 0.4 0.6];

% 
%         theta=[pi/8 1.1*pi/8 0.9*pi/8 1.2*pi/8];
%         r=[0.21 0.19 0.23 0.22];
end
