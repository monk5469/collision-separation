function x=measured_dataOutput(fi_1,Tag)

x_inter_1 = fread(fi_1,'float32');%fread读书fi_1中的二进制数据
fclose(fi_1);
x_1 = x_inter_1(1:2:end) + 1i*(x_inter_1(2:2:end));

if Tag==2
%% %%%%%%%% 4 clusters  %%%%%%%%%% 2 collision tags
Start_RN16=7.443074*10e5; 
End_RN16=Start_RN16+1099; 

elseif Tag==3
%% %%%%%%%% 8 clusters  %%%%%%%%%% 3 collision tags
Start_RN16=8.366691*10e5; 
End_RN16=Start_RN16+1099; 

elseif Tag==4
%% %%%%%%%% 16 clusters %%%%%%%%%% 4 collision tags
Start_RN16=1.0310365*10e6;
End_RN16=Start_RN16+799;
end 

x = x_1(Start_RN16:End_RN16);
x=x.';

