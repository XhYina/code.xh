function [cA,cH,cV,cD]=DWT(imdist)

[cA,cH,cV,cD]=dwt2(imdist,'haar');


% % X=idwt2(cA,cH,cV,cD,'haar');%�ָ�ͼ��
% Imgjpegdown=imresize(refImg, 1/2);%�²�����ԭ����1/4
% cA=uint8(cA);
% Y=imsubtract(Imgjpegdown,cA);
% 
% 
% % imshow(tesImg3);
% X=uint8(X);
% % A=tesImg-uint8(X);%�ָ�ͼ������ʧͼ��֮��Ĳ��죨����С��������ʧ��
% % B=refImg-uint8(X);%ԭʼͼ��ָ�ͼ֮��Ĳ��죨�����ϸ����ʧ��
% % imshow(B);
% A=imsubtract(tesImg,X);%�ָ�ͼ������ʧͼ��֮��Ĳ���
% B=imsubtract(refImg,X);
% C=imsubtract(refImg,tesImg);
end
