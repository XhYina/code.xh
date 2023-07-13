clear all;
close all;
clc;
%主观值
    load( sprintf( '360IQA_MOS.mat') );
   load( sprintf( 'xhfeaoiqa.mat'));
%     
%  load( sprintf( 'so_BLUR.mat') );
%  MOS=BLUR;
%    feature= load( sprintf( 'fo_BLUR.mat'));

%      feature = featoiqa(:,29:85);
    feature = sqrt(feature); 
%     feature3 = sqrt(w3.feature(:,1:2)); 
%     feature3 = sqrt(w2.feature(:,41:52)); 
%   feature_live2= [feature1() feature2() feature3() feature4()];
lower=0;
upper=1;
N=320;
indices = crossvalind('Kfold',N,5);
 if size(MOS,1) == 1
        MOS=MOS';
    end
%SVR的参数
c = 12; 
g = -8; 
%cmd = ['-s 3 -t 2 -c ',num2str(2^c),' -g ',num2str(2^g)];

    for i=1:1000
        indices = randperm( N );%randperm随机函数：返回一行包含从1到n的整数
        train_data = feature(indices(1:floor(N*0.8)),:);
        train_label = MOS(indices(1:floor(N*0.8)));
        test_data = feature(indices(floor(N*0.8)+1:end),:);
        test_label = MOS(indices(floor(N*0.8)+1:end));
        [train_data_norm,MAX,MIN]=normalization(train_data,lower,upper);
        model =svmtrain(train_label,train_data_norm,['-s 3 -t 2 -c ',num2str(2^c),'-g ',num2str(2^g)]);
        testdata_norm=normalization(test_data,lower,upper,MAX,MIN);
        predict_label= svmpredict(test_label,testdata_norm,model);
        plcc(i) = corr(predict_label,test_label);
        srcc(i) = corr(predict_label,test_label,'type','spearman');
        krcc(i) = corr(predict_label,test_label,'type','Kendall');
        rmse(i) = sqrt(sum((predict_label-test_label).^2)/length(test_label));
        
i
    end
   
    %迭代1000次中值：
    plccmedian =  median(plcc,'omitnan')
    srccmedian =  median(srcc,'omitnan')
    krccmedian =  median(krcc,'omitnan')
    rmsemedian =  median(rmse,'omitnan')

%    save  feature_live2 feature;


% save  predict_label_BLUR predict_label_BLUR;
% save  test_label_BLUR test_label;
% scatter(predict_label,test_label,'filled');
% xlabel('Proposed');
% ylabel('DMOS');
% load('predict_label_JPEG_oiqa.mat');
% load('predict_label_JPEG2K.mat');
% load('predict_label_WN.mat');
% load('predict_label_BLUR.mat');
% load('test_label_JPEG_oiqa.mat');
% load('test_label_JPEG2K.mat');
% load('test_label_WN.mat');
% load('test_label_BLUR.mat');
% 
% scatter(predict_label_JPEG,test_label_JPEG,'g','filled');hold on
% scatter(predict_label_JPEG2K,test_label_JPEG2K,'r','filled');hold on
% scatter(predict_label_WN,test_label_WN,'y','filled');hold on
% scatter(predict_label_BLUR,test_label_BLUR,'b','filled');
% legend('JPEG','JPEG2K','WN','BLUR');
% xlabel('Predicted quality scores')  %x轴坐标描述
% ylabel('DMOS）') %y轴坐标描述

