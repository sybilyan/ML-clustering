load('cluster_data.mat');
[u, pi, M, Nj, zi, zij] = EM(dataA_X, 4); 

%��ͼ
max_k = max(zi);
figure(gcf);
clf;

for i=1:b
    Xi= dataA_X(:,i);
    Xi1 = Xi(1);
    Xi2 = Xi(2);
    scatter(Xi1, Xi2, 10,C(mod(y_x(i),max_k)+1),'filled' );
    hold on;
end
axis([-14 14 -14 14])                 %���û�����С
grid on                               %��������
hold off

