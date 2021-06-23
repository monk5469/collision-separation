function y=Sep(table,h,Tag)


switch Tag
    case 2
        for i=1:length(table)
            D1=norm(table(i));
            D2=norm(table(i)-h(1));
            D3=norm(table(i)-h(2));
            D4=norm(table(i)-h(1)-h(2));
%             D1=sqrt((real(table(i)))^2+(imag(table(i)))^2);
%             D2=sqrt((real(table(i))-real(h(1)))^2+(imag(table(i))-imag(h(1)))^2);
%             D3=sqrt((real(table(i))-real(h(2)))^2+(imag(table(i))-imag(h(2)))^2);
%             D4=sqrt((real(table(i))-real(h(1))-real(h(2)))^2+(imag(table(i))-imag(h(1))-imag(h(2)))^2);
            D=[D1,D2,D3,D4];
            %         D=sort(D); %ÉıĞòÅÅÁĞ
            if  min(D)==D(1)
                table1(i,:)=[0 0];
            elseif min(D)==D(2)
                table1(i,:)=[1 0];
            elseif min(D)==D(3)
                table1(i,:)=[0 1];
            elseif min(D)==D(4)
                table1(i,:)=[1 1];
            end
            
        end
        y1=table1(:,1)';
        y2=table1(:,2)';
        y=[y1;y2];
        
    case 3
        for i=1:length(table)
            D1=sqrt((real(table(i)))^2+(imag(table(i)))^2);
            D2=sqrt((real(table(i))-real(h(1)))^2+(imag(table(i))-imag(h(1)))^2);
            D3=sqrt((real(table(i))-real(h(2)))^2+(imag(table(i))-imag(h(2)))^2);
            D4=sqrt((real(table(i))-real(h(3)))^2+(imag(table(i))-imag(h(3)))^2);
            D5=sqrt((real(table(i))-real(h(1)+h(2)))^2+(imag(table(i))-imag(h(1)+h(2)))^2);
            D6=sqrt((real(table(i))-real(h(1)+h(3)))^2+(imag(table(i))-imag(h(1)+h(3)))^2);
            D7=sqrt((real(table(i))-real(h(2)+h(3)))^2+(imag(table(i))-imag(h(2)+h(3)))^2);
            D8=sqrt((real(table(i))-real(h(1)+h(2)+h(3)))^2+(imag(table(i))-imag(h(1)+h(2)+h(3)))^2);
            
            D=[D1,D2,D3,D4,D5,D6,D7,D8];
            if  min(D)==D1
                table1(i,:)=[0 0 0];
            elseif min(D)==D2
                table1(i,:)=[1 0 0];
            elseif min(D)==D3
                table1(i,:)=[0 1 0];
            elseif min(D)==D4
                table1(i,:)=[0 0 1];
            elseif min(D)==D5
                table1(i,:)=[1 1 0];
            elseif min(D)==D6
                table1(i,:)=[1 0 1];
            elseif min(D)==D7
                table1(i,:)=[0 1 1];
            elseif min(D)==D8
                table1(i,:)=[1 1 1];
            end
        end
        y1=table1(:,1)';
        y2=table1(:,2)';
        y3=table1(:,3)';
        y=[y1;y2;y3];
        
    case 4
        for i=1:length(table)
            D1=sqrt((real(table(i)))^2+(imag(table(i)))^2);
            D2=sqrt((real(table(i))-real(h(1)))^2+(imag(table(i))-imag(h(1)))^2);
            D3=sqrt((real(table(i))-real(h(2)))^2+(imag(table(i))-imag(h(2)))^2);
            D4=sqrt((real(table(i))-real(h(3)))^2+(imag(table(i))-imag(h(3)))^2);
            D5=sqrt((real(table(i))-real(h(4)))^2+(imag(table(i))-imag(h(4)))^2);
            D6=sqrt((real(table(i))-real(h(1)+h(2)))^2+(imag(table(i))-imag(h(1)+h(2)))^2);
            D7=sqrt((real(table(i))-real(h(1)+h(3)))^2+(imag(table(i))-imag(h(1)+h(3)))^2);
            D8=sqrt((real(table(i))-real(h(1)+h(4)))^2+(imag(table(i))-imag(h(1)+h(4)))^2);
            D9=sqrt((real(table(i))-real(h(2)+h(3)))^2+(imag(table(i))-imag(h(2)+h(3)))^2);
            D10=sqrt((real(table(i))-real(h(2)+h(4)))^2+(imag(table(i))-imag(h(2)+h(4)))^2);
            D11=sqrt((real(table(i))-real(h(3)+h(4)))^2+(imag(table(i))-imag(h(3)+h(4)))^2);
            D12=sqrt((real(table(i))-real(h(1)+h(2)+h(3)))^2+(imag(table(i))-imag(h(1)+h(2)+h(3)))^2);
            D13=sqrt((real(table(i))-real(h(1)+h(2)+h(4)))^2+(imag(table(i))-imag(h(1)+h(2)+h(4)))^2);
            D14=sqrt((real(table(i))-real(h(1)+h(3)+h(4)))^2+(imag(table(i))-imag(h(1)+h(3)+h(4)))^2);
            D15=sqrt((real(table(i))-real(h(2)+h(3)+h(4)))^2+(imag(table(i))-imag(h(2)+h(3)+h(4)))^2);
            D16=sqrt((real(table(i))-real(h(1)+h(2)+h(3)+h(4)))^2+(imag(table(i))-imag(h(1)+h(2)+h(3)+h(4)))^2);
            D=[D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15,D16];
            if  min(D)==D1
                table1(i,:)=[0 0 0 0];
            elseif min(D)==D2
                table1(i,:)=[1 0 0 0];
            elseif min(D)==D3
                table1(i,:)=[0 1 0 0];
            elseif min(D)==D4
                table1(i,:)=[0 0 1 0];
            elseif min(D)==D5
                table1(i,:)=[0 0 0 1];
            elseif min(D)==D6
                table1(i,:)=[1 1 0 0];
            elseif min(D)==D7
                table1(i,:)=[1 0 1 0];
            elseif min(D)==D8
                table1(i,:)=[1 0 0 1];
            elseif min(D)==D9
                table1(i,:)=[0 1 1 0];
            elseif min(D)==D10
                table1(i,:)=[0 1 0 1];
            elseif min(D)==D11
                table1(i,:)=[0 0 1 1];
            elseif min(D)==D12
                table1(i,:)=[1 1 1 0];
            elseif min(D)==D13
                table1(i,:)=[1 1 0 1];
            elseif min(D)==D14
                table1(i,:)=[1 0 1 1];
            elseif min(D)==D15
                table1(i,:)=[0 1 1 1];
            elseif min(D)==D16
                table1(i,:)=[1 1 1 1];
            end
        end
        y1=table1(:,1)';
        y2=table1(:,2)';
        y3=table1(:,3)';
        y4=table1(:,4)';
        y=[y1;y2;y3;y4];
end