% read the image and view it
img = imread('./images/56028.jpg');


% extract features (stepsize = 7)
[X, L] = getfeatures(img, 7);
XX = [X(1:2,:) ; X(3:4,:)/10]; 

% initial miu & sigma & pi
K = 10;
[init_miu,init_pi,init_sigma] = init(XX,K);
% Run k-means
Y = em(XX,K,init_miu,init_sigma,init_pi); 

% make a segmentation image from the labels
segm = labels2segm(Y, L);
figure(1); imagesc(segm); axis image;
suptitle('EM label result');

% color the segmentation image
csegm = colorsegm(segm, img);
figure(2); imagesc(csegm); axis image;
suptitle('EM color result');