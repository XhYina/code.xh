clear all;
clc;
for i=201:320
    
  img = imread(['D:\mtlabcode\distorted-images-1\img',num2str(i,'%01d'),'.png']);   
 
% img=imread('D:\mtlabcode\YXH2\yxh2code\JPEG.png');
feat(i,:)= lyExtractFeature(img);

% [phi theta]=select_points(img_dis_rgb);
% spoint_radian = [phi' theta'];
% img_dis_rgb=imresize(img_dis_rgb,[512 1024]);
% % im2fov(img_dis_rgb,spoint_radian,'375');
% [a(i,:,:),aa(i,:)]=im2fov2MSCN(img_dis_rgb,spoint_radian);
% save('a.mat','a')
 save('featoiqa320.mat','feat')
i
end