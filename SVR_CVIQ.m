clear all;
close all;
clc;
%����ֵ
      load( sprintf( 'combination.mat') );
   load( sprintf( 'feature_test_gm.mat'));
%  load( sprintf( 'sc_HEVC.mat') );
%  mos = HEVC;
%   load( sprintf( 'fc_HEVC.mat'));
 feature = feature_test_gm();
%  mos = HEVC();

% feature = [w1.feature(:,1:150) w2.aa() w3.color()];
% feature = [feature(:,1:28) feature(:,49:85)];
   feature = sqrt(feature());     %%% normalize features

lower=0;
upper=1;
N=544;
indices = crossvalind('Kfold',N,5);
 if size(mos,1) == 1
        mos=mos';
    end
%SVR�Ĳ���
c = 12; 
g = -8; 
% cmd = ['-s 3 -t 2 -c ',num2str(2^c),' -g ',num2str(2^g)];

    for i=1:1000
        indices = randperm( N );%randperm�������������һ�а�����1��n������
        train_data = feature(indices(1:floor(N*0.8)),:);
        train_label = mos(indices(1:floor(N*0.8)));
        test_data = feature(indices(floor(N*0.8)+1:end),:);
        test_label = mos(indices(floor(N*0.8)+1:end));
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
%     ����1000����ֵ��
    plccmedian =  median(plcc,'omitnan')
    srccmedian =  median(srcc,'omitnan')
    krccmedian =  median(krcc,'omitnan')
    rmsemedian =  median(rmse,'omitnan')
%    save  feature_live2 feature;

