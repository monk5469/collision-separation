function h=DeclineCoefficient(Tag)

switch Tag
    case 2
        %%%% Case 2. Three tags %%%%%
        theta=[pi/4 3*pi/8];
        r=[0.3 0.5];
    case 3
        %%%% Case 3. Three tags %%%%%
        theta=[pi/8 pi/4 3*pi/8];
        r=[0.3 0.5 0.8];
        %     case 4
        %         %%%% Case 4. four tags %%%%%
        %         theta=[3*pi/8 5*pi/8 pi/4 pi/3];
        %         r=[0.2 0.3 0.1 0.4];
    case 4
        %%%% Case 4. four tags %%%%%
        theta=[3*pi/8 5*pi/8 pi/4 pi/11];
        r=[0.2 0.3 0.1 0.4];
end
h=ComplexChannel(theta,r);