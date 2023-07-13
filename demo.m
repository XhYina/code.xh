% load('combination.mat');

feature_test = [];
tic
for i=1: 10  %循环计算图片的特征，几张图片就输多少
%%         
imgFolder = 'F:\CVIQ_database\CVIQ';    


image= imread(fullfile(imgFolder,[num2str(i,'%03d'),'.png']));    %读入图像

feature_test(i,:) = lyExtractFeature(image);  %计算结果存入矩阵
i
end   
% save('C:\Users\Administrator\Desktop\jiangjingyu\代码2\feature_oiqa_311_320.mat','feature_oiqa_1_20');

toc
