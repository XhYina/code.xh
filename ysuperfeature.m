function [ mean_Y1] = ysuperfeature(rimg)

% rimg = imread('JPEG.png');

%Downsample
[rows, cols] = size(rimg(:,:,1));
minDimension = min(rows,cols);
F = max(1,round(minDimension/256));
aveKernel = fspecial('average',F);
averimg = imfilter(rimg, aveKernel,'same');
rimg = averimg(1:F:rows,1:F:cols,:);
[rows, cols] = size(rimg(:,:,1));

% superpixel segmentation
Nc=2000; % number of cluster centers
[labels, numlabels] = slicomex(rimg,Nc);


% RGB to YUV
% YUV = rgb2ycbcr(rimg);
% Y1 = YUV(:,:,1); 

% gradient computation with Prewitt operator
% x_mask = [-1 0 1; -1 0 1; -1 0 1]/3;
% y_mask = x_mask';
% Y1x = conv2(Y1, x_mask, 'same');     
% Y1y = conv2(Y1, y_mask, 'same');    
% gradient_Y1 = sqrt(Y1x.^2 + Y1y.^2);


mean_Y1 = zeros(rows, cols);


Texture_complexity1 = zeros(rows, cols);
weight=[0.2 0.8];
% C1 = 600.*ones(rows, cols); %%yun:positive constants
% C2 = 210.*ones(rows, cols);
% T1 = C1;
% T2 = C2;
% tau = 0.6;
% lambda1 = 40000;
% lambda2 = 950;
for k = 1:numlabels   
    rt = find(labels==k-1);
    
    Y1_temp = rimg(rt); %%这一步就是把相同特征的像素归为一个矩阵了  也就是划分成超像素大块了(你需要把这个成分作为像素来进行处理）
    Y1_mean = mean(Y1_temp); 
    mean_Y1(rt) = Y1_mean;
    
%    YEN(rt)=entropy(uint8(Y1_temp));%%计算熵特征
   
 
%     G1_temp(rt) = gradient_Y1(rt);%%%yun: computer IF, to get the new T1 T2 in SSIM
   
end


%%%整理特征熵
%     sort_t = sort(YEN(:),'ascend');
%  len = length(sort_t);
%  t=sort_t(ceil(len*weight(1)):ceil(len*weight(2)));
%  Ymu= mean(t);
%  Yske=skewness(sort_t);
%  Yf=[ Ymu  Yske];

  


end

%%
% function [Y,U,V] = COLOR_SPACE_CONVERSION(img)
% 
% if ndims(img) == 3
%     Y = 0.299 * double(img(:,:,1)) + 0.587 * double(img(:,:,2)) + 0.114 * double(img(:,:,3));
%     U = -0.147 * double(img(:,:,1)) - 0.289 * double(img(:,:,2)) +0.436 * double(img(:,:,3));
%     V = 0.615 * double(img(:,:,1)) - 0.515 * double(img(:,:,2)) -0.100 * double(img(:,:,3));
% else    
%     Y = double(img);
% end
% % 
% % %%
% function w = getTC(pv)
% CI = std(pv,1)+0.01; %contrast intensity
% 
% ui = mean(pv);
% fz = pv-ui;
% fz = fz.^4;
% fz = sum(fz)./length(pv)+0.01;
% fm = CI^4;
% ST = fz/fm; %structureness
% 
% w = CI/ST;
% 
% %%
% function sro = SROCC(SR1,SR2)
% 
% [~,m2] = sort(SR1);
% [~,n2] = sort(SR2);
% [~,m3] = sort(m2);
% [~,n3] = sort(n2);
% s1 = sum((m3-n3).^2);
% 
% sro = 1-6*s1/length(SR1)/(length(SR1)*length(SR1)-1);









