
clear all;
close all;
clc;

load( sprintf( 'predict_label.mat') );
load( sprintf( 'test_label.mat'));
% save  predict_label_BLUR predict_label_BLUR;
% save  test_label_BLUR test_label;
scatter(predict_label,test_label,'filled');
xlabel('Proposed');
ylabel('DMOS');
figure;
load('predict_label_JPEG.mat');
load('predict_label_JPEG2K.mat');
load('predict_label_WN.mat');
load('predict_label_BLUR.mat');
load('test_label_JPEG.mat');
load('test_label_JPEG2K.mat');
load('test_label_WN.mat');
load('test_label_BLUR.mat');
% 
scatter(predict_label_JPEG,test_label_JPEG,'g','filled');hold on
scatter(predict_label_JPEG2K,test_label_JPEG2K,'r','filled');hold on
scatter(predict_label_WN,test_label_WN,'y','filled');hold on
scatter(predict_label_BLUR,test_label_BLUR,'b','filled');
legend('JPEG','JPEG2K','WN','BLUR');
xlabel('Predicted quality scores')  %x÷·◊¯±Í√Ë ˆ
ylabel('DMOS£©') %y÷·◊¯±Í√Ë ˆ

