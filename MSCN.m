function feat = MSCN(imdist)
  if (size(imdist,3)==3)
      imdist=rgb2gray(imdist);
  end
  imdist=double(imdist);
%------------------------------------------------
% Feature Computation
%-------------------------------------------------
scalenum = 2;
window = fspecial('gaussian',7,7/6);%����7*7�ĸ�˹�˲�������׼��Ϊ7/6  
window = window/sum(sum(window));

feat = [];

for itr_scale = 1:scalenum

mu            = filter2(window, imdist, 'same'); %��window��imdist�����˲� 
mu_sq         = mu.*mu;
sigma         = sqrt(abs(filter2(window, imdist.*imdist, 'same') - mu_sq));
structdis     = (imdist-mu)./(sigma+1); %�����й�ʽ(1),����?I(i,j) 
[alpha overallstd]       = estimateggdparam(structdis(:)); %����zero mean GGD���õ�GGD (��, �� ^2 )  
feat                     = [feat alpha overallstd^2]; 


shifts                   = [ 0 1;1 0 ; 1 1; -1 1];
 
for itr_shift =1:4
 
shifted_structdis        = circshift(structdis,shifts(itr_shift,:));
pair                     = structdis(:).*shifted_structdis(:);
[alpha leftstd rightstd] = estimateaggdparam(pair);
const                    =(sqrt(gamma(1/alpha))/sqrt(gamma(3/alpha)));
meanparam                =(rightstd-leftstd)*(gamma(2/alpha)/gamma(1/alpha))*const; %��ʽ15 
feat                     =[feat alpha meanparam leftstd^2 rightstd^2];%����TABLE 1  
%featΪ�������������feature һ������18�� 
end


imdist                   = imresize(imdist,0.5);


end