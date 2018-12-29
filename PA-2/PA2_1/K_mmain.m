load('cluster_data.mat')
C = 'krgbmcy';
dataX = dataA_X;                   %取数据集的x变量
[~,b] = size(dataX); 
k=4;       %类的数量

[y_x, u] = K_mean(dataX, k);

%画图
max_k = max(y_x);
figure(gcf);
clf;

for i=1:b
    Xi= dataX(:,i);
    Xi1 = Xi(1);
    Xi2 = Xi(2);
    scatter(Xi1, Xi2, 10,C(mod(y_x(i),max_k)+1),'filled' );
    hold on;
end
axis([-14 14 -14 14])                 %设置画布大小
grid on                               %设置网格
hold off

