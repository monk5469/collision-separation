%矩阵减去矩阵中的某一行
function Y=Matrix_reduction(row,X)
% clear all;
% close all;
% 
% X=[1 2 3 4;5 6 7 8;9 10 11 12;13 14 15 16]; %原矩阵
% row=1; %需要减去的行数
[x,y]=size(X);

if x == 1
    Y=X;
else    
    if row < x
        X_reshape=reshape(X',1,x*y); %%
        X_Reduction1=X_reshape(1:((row-1)*y));
        X_Reduction2=X_reshape((row*y+1):(x*y));
        Y_reshape=[X_Reduction1 X_Reduction2];
        Y=(reshape(Y_reshape,y,(x-1)))'; %减去后矩阵
    elseif row == x
        X_reshape=reshape(X',1,x*y); %%
        X_Reduction1=X_reshape(1:((row-1)*y));
        Y_reshape=X_Reduction1;
        Y=(reshape(Y_reshape,y,(x-1)))'; %减去后矩阵
    end
end


