function feat= lyExtractFeature(imdist)
 %%  将图像DWT转化为低频和高频,对高频提取共现矩阵+方差作为细节特征（S）-27
%  低频取其熵值
 [cA,cH,cV,cD]=DWT(imdist);
% 高频分量
F_hf1 = GLCM_1(cH);
F_hf2 = std2(cH)^2;
F_vf1 = GLCM_1(cV);
F_vf2 = std2(cV)^2;
F_df1 = GLCM_1(cD);
F_df2 = std2(cD)^2;
feat_hs = [F_hf1 F_vf1 F_df1 F_hf2 F_vf2 F_df2];

%低频特征：熵-1
 feat_le = entropy(cA);
 
 %% 超像素后求显著性图，与原图相乘，提取MSCN和熵 -37
attentionmap = Attention(imdist);

imdist1 = imresize(imdist,size(attentionmap));
imdist1= double(imdist1);
% imdist2= immultiply(imdist1, attentionmap);
imdist2(:,:,1) = immultiply(imdist1(:,:,1) , attentionmap);
imdist2(:,:,2) = immultiply(imdist1(:,:,2) , attentionmap);
imdist2(:,:,3) = immultiply(imdist1(:,:,3) , attentionmap);
imdist3 = rgb2hsv(imdist2);
feat_hg = MSCN(imdist3(:,:,3));

% 对图像imdist2提取MSCN -GDD+AGGD系数作为全局特征（G）-36
%  feat_hg = MSCN(imdist2);
 feat_hl = entropy(imdist2);
%% 只取其前20个颜色特征（C）-20
feat = RGBLBP(imdist);
feat_c = feat(:,1:20);

feat = [feat_hs feat_le feat_hg feat_hl feat_c];
%            27+1+36+1+20=85
        
end