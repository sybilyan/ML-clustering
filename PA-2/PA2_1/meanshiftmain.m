load('cluster_data.mat');

h = 4.75;%bandwith
[labels_A,clusters_a,pt_in_h_a] = meanshift(dataB_X,h); % h=5 is the best
color = 'krgbmcy';
max_cluster = max(labels_A);
figure(gcf);
clf;
[a,b] = size(dataB_X);
for i=1:b
    Xi= dataB_X(:,i);
    Xi1 = Xi(1);
    Xi2 = Xi(2);
    scatter(Xi1, Xi2, 16,color(mod(labels_A(i),max_cluster)+1),'filled' );
    hold on;
end
axis([-14 14 -14 14])                 %设置画布大小
grid on                               %设置网格
hold off
xlabel('x1'),ylabel('x2')
title('Mean-Shift for GMM,h=4.75');

% figure;
% [labels_b,clusters_b,pt_in_h_b] = meanshift(dataB_X,4.55);
% plotCluster(dataB_X,labels_b);
% 
% figure;
% [labels_c,clusters_c,pt_in_h_c] = meanshift(dataC_X,5); % h=5 is the best
% plotCluster(dataC_X,labels_c);