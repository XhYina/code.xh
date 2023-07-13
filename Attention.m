function A5 = Attention(imdist)
% imdist = imread('F:\OIQA\distorted-images-1\img1.png');
lab = rgb2lab(imdist);
sum = 0;
A=[];
% a=[];
% a = zeros(257,513);

for k = 1:1:3
   sf =  ysuperfeature(lab(:,:,k));
   if k==1
       A = zeros(size(sf));
%        a = zeros(size(sf));
   end
   for i = -60:5:99
       B = imbinarize(sf,i);
       B = double(B);
%        B=B*255;
       SE = strel ('square',5);
       B = imopen(B,SE);%ø™‘ÀÀ„
% %        B = double(B);
% %        b = imopen(b,SE);
%        a = a+B;
%    end
%    a = imbinarize(a,0);
% %    a=1-a;
   A1 = imfill(B,'holes');
%    
% %        a = imfill(a,'holes');
       
       SEd = strel ('square',7);%≈Ú’Õ‘ÀÀ„  
       
       A1 = imdilate(A1,SEd);
%        A1 = 1-A1;
%        a = imdilate(a,SEd);
       A1 = double(A1);
       
%        A1 = A1*255;
%        a = double(a);
       if A1 ~=0
           A1 = norm(A1,2);
       end
      
       
       A = A+A1;
       
       sum = sum+1;
   end
end
A5 = A/sum;
% A5 = 255-A5;
% imshow(A5);
% x=mean2(A5);
% y = std2(A5);
% z= entropy(A5);
end