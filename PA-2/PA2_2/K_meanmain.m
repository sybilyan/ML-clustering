img = imread('./images/361010.jpg');

%读取特征
[X, L] = getfeatures(img, 1);
X([3, 4],:) = X([4, 3],:);

%k-means
K = 4;
Y = K_mean(X, 4, 0.5, 0.6, 0.3)  ;
segm = labels2segm(Y, L);
figure(1);
imagesc(segm);
suptitle('KM label result');

%增加色彩
csegm = colorsegm(segm, img);
figure(2);
imagesc(csegm);
suptitle('KM color result');