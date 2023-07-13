% mat = [];
% 加载特征或者主观值：
% load('combination.mat');
load('360IQA_MOS.mat');

% load('xhfeat_cviq.mat');
%定义存储不同噪声的特征或者主观值：
JPEG = [];
JPEG2K = [];
WN = [];
BLUR = [];
% AVC = [];
% HEVC = [];
% % BLUR = [];
% E = [];
for i = 0:15
    
%     JPEG = [JPEG; mos(i*34+1:i*34+11,:)];
%     AVC = [AVC; mos(i*34+12:i*34+22,:)];
%     HEVC = [HEVC; mos(i*34+23:i*34+33,:)];
%     JPEG = [JPEG; xhfeat_cviq(i*34+1:i*34+11,:)];
%     AVC = [AVC; xhfeat_cviq(i*34+12:i*34+22,:)];
%     HEVC = [HEVC; xhfeat_cviq(i*34+23:i*34+33,:)];
%%oiqa分噪声()：
    JPEG = [JPEG; MOS(i*20+1:i*20+5,:)];
    JPEG2K = [JPEG2K; MOS(i*20+6:i*20+10,:)];
    WN = [WN; MOS(i*20+11:i*20+15,:)];
    BLUR = [BLUR; MOS(i*20+16:i*20+20,:)];
    
%     JPEG = [JPEG; featoiqa(i*20+1:i*20+5,:)];
%     JPEG2K = [JPEG2K; featoiqa(i*20+6:i*20+10,:)];
%     WN = [WN; featoiqa(i*20+11:i*20+15,:)];
%     BLUR = [BLUR; featoiqa(i*20+16:i*20+20,:)];
 %%   fendengji 
%     JPEG = [JPEG; feature(i*5+1,:)];
%     JPEG2K = [JPEG2K; feature(i*5+2,:)];
%     WN = [WN; feature(i*5+3,:)];
%     BLUR = [BLUR; feature(i*5+4,:)];
%     E = [E; feature(i*5+5,:)];
end
% 将不同噪声保存下来：
% save('M_c_JPEG','JPEG');
% save('M_c_JPEG2K','JPEG2K');
% save('M_c_WN','WN');
% save('M_c_BLUR','BLUR');
save('so_JPEG','JPEG');
save('so_JPEG2K','JPEG2K');
save('so_WN','WN');
save('so_BLUR','BLUR');

% save('sc_AVC','AVC');
% save('sc_HEVC','HEVC');
% save('sc_JPEG','JPEG');
% save('f_o_5','E');