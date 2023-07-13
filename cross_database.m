clear all;
close all;
clc;
%主观值
    load( sprintf( '360IQA_MOS.mat') );
    MOS_OIQA = MOS;
   load( sprintf( 'xhfeaoiqa.mat'));
   load( sprintf( 'combination.mat') );
   MOS_CVIQ = mos;
   load( sprintf( 'xhfeat_cviq.mat'));
    feature_oiqa = sqrt(featoiqa); 
    feature_cviq = sqrt(xhfeat_cviq); 
    

lower=0;
upper=1;
N1=320;
N2=544;
indices1 = crossvalind('Kfold',N1,5);
indices2 = crossvalind('Kfold',N2,5);
 if size(MOS_OIQA,1) == 1
        MOS_OIQA=MOS_OIQA';
 end
    
  if size(MOS_CVIQ,1) == 1
        MOS_CVIQ=MOS_CVIQ';
    end
%SVR的参数
c = 12; 
g = -8; 
%cmd = ['-s 3 -t 2 -c ',num2str(2^c),' -g ',num2str(2^g)];

    for i=1:1000
        indices = randperm( N1 );%randperm随机函数：返回一行包含从1到n的整数
        train_data = feature_oiqa(indices(1:end),:);
        train_label = MOS_OIQA(indices(1:end));
        test_data = feature_cviq(indices(1:end),:);
        test_label = MOS_CVIQ(indices(1:end));
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

