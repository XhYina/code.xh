% load('combination.mat');

feature_test = [];
tic
for i=1: 10  %ѭ������ͼƬ������������ͼƬ�������
%%         
imgFolder = 'F:\CVIQ_database\CVIQ';    


image= imread(fullfile(imgFolder,[num2str(i,'%03d'),'.png']));    %����ͼ��

feature_test(i,:) = lyExtractFeature(image);  %�������������
i
end   
% save('C:\Users\Administrator\Desktop\jiangjingyu\����2\feature_oiqa_311_320.mat','feature_oiqa_1_20');

toc
