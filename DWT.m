function [cA,cH,cV,cD]=DWT(imdist)

[cA,cH,cV,cD]=dwt2(imdist,'haar');


% % X=idwt2(cA,cH,cV,cD,'haar');%恢复图像
% Imgjpegdown=imresize(refImg, 1/2);%下采样到原来的1/4
% cA=uint8(cA);
% Y=imsubtract(Imgjpegdown,cA);
% 
% 
% % imshow(tesImg3);
% X=uint8(X);
% % A=tesImg-uint8(X);%恢复图像与损失图像之间的差异（差异小，加性损失）
% % B=refImg-uint8(X);%原始图与恢复图之间的差异（差异大，细节损失）
% % imshow(B);
% A=imsubtract(tesImg,X);%恢复图像与损失图像之间的差异
% B=imsubtract(refImg,X);
% C=imsubtract(refImg,tesImg);
end
