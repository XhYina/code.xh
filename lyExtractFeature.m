function feat= lyExtractFeature(imdist)
 %%  ��ͼ��DWTת��Ϊ��Ƶ�͸�Ƶ,�Ը�Ƶ��ȡ���־���+������Ϊϸ��������S��-27
%  ��Ƶȡ����ֵ
 [cA,cH,cV,cD]=DWT(imdist);
% ��Ƶ����
F_hf1 = GLCM_1(cH);
F_hf2 = std2(cH)^2;
F_vf1 = GLCM_1(cV);
F_vf2 = std2(cV)^2;
F_df1 = GLCM_1(cD);
F_df2 = std2(cD)^2;
feat_hs = [F_hf1 F_vf1 F_df1 F_hf2 F_vf2 F_df2];

%��Ƶ��������-1
 feat_le = entropy(cA);
 
 %% �����غ���������ͼ����ԭͼ��ˣ���ȡMSCN���� -37
attentionmap = Attention(imdist);

imdist1 = imresize(imdist,size(attentionmap));
imdist1= double(imdist1);
% imdist2= immultiply(imdist1, attentionmap);
imdist2(:,:,1) = immultiply(imdist1(:,:,1) , attentionmap);
imdist2(:,:,2) = immultiply(imdist1(:,:,2) , attentionmap);
imdist2(:,:,3) = immultiply(imdist1(:,:,3) , attentionmap);
imdist3 = rgb2hsv(imdist2);
feat_hg = MSCN(imdist3(:,:,3));

% ��ͼ��imdist2��ȡMSCN -GDD+AGGDϵ����Ϊȫ��������G��-36
%  feat_hg = MSCN(imdist2);
 feat_hl = entropy(imdist2);
%% ֻȡ��ǰ20����ɫ������C��-20
feat = RGBLBP(imdist);
feat_c = feat(:,1:20);

feat = [feat_hs feat_le feat_hg feat_hl feat_c];
%            27+1+36+1+20=85
        
end