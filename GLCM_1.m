function F_glcm = GLCM_1(GI)

% GI = imread('00.jpg');
GI = rgb2gray(GI);
% GI= AD3;
F_glcm =[];
% % 计算共现矩阵
offset = [0 1;-1 1;-1 0;-1 -1];
glcm0 = graycomatrix(GI,'offset',[0 1]); %水平
glcm90 = graycomatrix(GI,'offset',[-1 0]); %垂直
glcm45 = graycomatrix(GI,'offset',[-1 1]); %45度
glcm135 = graycomatrix(GI,'offset',[-1 -1]);%135度
% % 共现矩阵归一化
% glcm_norm0 = glcm0/sum(glcm0(:));
% glcm_norm90 = glcm90/sum(glcm90(:));
% glcm_norm45 = glcm45/sum(glcm45(:));
% glcm_norm135 = glcm135/sum(glcm135(:));

% len = length(glcm_norm0);
% % 计算同质性值
HOMO0 = graycoprops(glcm0,'Homogeneity');
HOMO90 = graycoprops(glcm90,'Homogeneity');
HOMO45 = graycoprops(glcm45,'Homogeneity');
HOMO135 = graycoprops(glcm135,'Homogeneity');

% % 计算能量值
ENER0 = graycoprops(glcm0,'Energy');
ENER90 = graycoprops(glcm90,'Energy');
ENER45 = graycoprops(glcm45,'Energy');
ENER135 = graycoprops(glcm135,'Energy');

% % 对比值
% CONT0 = graycoprops(glcm0,'Contrast');
% CONT90 = graycoprops(glcm90,'Contrast');
% CONT45 = graycoprops(glcm45,'Contrast');
% CONT135 = graycoprops(glcm135,'Contrast');


% % 计算相关性
% CORR0 = graycoprops(glcm0,'Correlation');
% CORR90 = graycoprops(glcm90,'Correlation');
% CORR45 = graycoprops(glcm45,'Correlation');
% CORR135 = graycoprops(glcm135,'Correlation');


% % % 计算熵
% ENTRO0 = wentropy(glcm0,'shannon');%直接调用函数
% ENTRO90 = wentropy(glcm90,'shannon');
% ENTRO45 = wentropy(glcm45,'shannon');
% ENTRO135 = wentropy(glcm135,'shannon');


F_glcm_ENER = [ENER0.Energy  ENER90.Energy  ENER45.Energy ENER135.Energy];
% F_glcm_CONT = [CONT0.Contrast CONT90.Contrast  CONT45.Contrast CONT135.Contrast];
F_glcm_HOMO = [HOMO0.Homogeneity HOMO90.Homogeneity  HOMO45.Homogeneity HOMO135.Homogeneity];
% F_glcm_CORR = [CORR0.Correlation CORR90.Correlation CORR45.Correlation CORR135.Correlation];
% F_glcm_ENTR = [ENTRO0 ENTRO90  ENTRO45 ENTRO135];
F_glcm = [F_glcm_ENER F_glcm_HOMO];
% 4*2  



end