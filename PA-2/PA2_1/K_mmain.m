load('cluster_data.mat')
C = 'krgbmcy';
dataX = dataA_X;                   %ȡ���ݼ���x����
[~,b] = size(dataX); 
k=4;       %�������

[y_x, u] = K_mean(dataX, k);

%��ͼ
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
axis([-14 14 -14 14])                 %���û�����С
grid on                               %��������
hold off

