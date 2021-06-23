function y=D2B(m,l)

  if l==2
    switch m
        case 0      
            y=[0 0]';
        case 1     
            y=[0 1]';
        case 2      
            y=[1 0]';
        case 3     
            y=[1 1]';
    end
  elseif l==3
    switch m
        case 0      
            y=[0 0 0]';
        case 1     
            y=[0 0 1]';
        case 2     
            y=[0 1 0]';
        case 3      
            y=[0 1 1]';
        case 4      
            y=[1 0 0]';
        case 5     
            y=[1 0 1]';
        case 6     
            y=[1 1 0]';
        case 7     
            y=[1 1 1]';
    end
  elseif l==4
     switch m
        case 0      
            y=[0 0 0 0]';
        case 1     
            y=[0 0 0 1]';
        case 2     
            y=[0 0 1 0]';
        case 3     
            y=[0 0 1 1]';
        case 4     
            y=[0 1 0 0]';
        case 5      
            y=[0 1 0 1]';
        case 6      
            y=[0 1 1 0]';
        case 7      
            y=[0 1 1 1]';
        case 8      
            y=[1 0 0 0]';
        case 9      
            y=[1 0 0 1]';
        case 10     
            y=[1 0 1 0]';
        case 11     
            y=[1 0 1 1]';
        case 12     
            y=[1 1 0 0]';
        case 13     
            y=[1 1 0 1]';
        case 14     
            y=[1 1 1 0]';
        case 15     
            y=[1 1 1 1]';
     end
  elseif l==5
      switch m
          case 0
              y=[0	0	0	0	0]';
          case 1
              y=[0	0	0	0	1]';
          case 2
              y=[0	0	0	1	0]';
          case 3
              y=[0	0	0	1	1]';
          case 4
              y=[0	0	1	0	0]';
          case 5
              y=[0	0	1	0	1]';
          case 6
              y=[0	0	1	1	0]';
          case 7
              y=[0	0	1	1	1]';
          case 8
              y=[0	1	0	0	0]';
          case 9
              y=[0	1	0	0	1]';
          case 10
              y=[0	1	0	1	0]';
          case 11
              y=[0	1	0	1	1]';
          case 12
              y=[0	1	1	0	0]';
          case 13
              y=[0	1	1	0	1]';
          case 14
              y=[0	1	1	1	0]';
          case 15
              y=[0	1	1	1	1]';
          case 16
              y=[1	0	0	0	0]';
          case 17
              y=[1	0	0	0	1]';
          case 18
              y=[1	0	0	1	0]';
          case 19
              y=[1	0	0	1	1]';
          case 20
              y=[1	0	1	0	0]';
          case 21
              y=[1	0	1	0	1]';
          case 22
              y=[1	0	1	1	0]';
          case 23
              y=[1	0	1	1	1]';
          case 24
              y=[1	1	0	0	0]';
          case 25
              y=[1	1	0	0	1]';
          case 26
              y=[1	1	0	1	0]';
          case 27
              y=[1	1	0	1	1]';
          case 28
              y=[1	1	1	0	0]';
          case 29
              y=[1	1	1	0	1]';
          case 30
              y=[1	1	1	1	0]';
          case 31
              y=[1	1	1	1	1]';
     end
  end

end