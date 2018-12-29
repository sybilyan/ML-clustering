function[y_x, u]=K_mean(X, k)  
%X为原始数据矩阵   
%k为类数量  
%y_x为正确的分类标签 
    [a,b] = size(X);    %X为a * b的矩阵
    y_x = zeros(1, b);     
    u = zeros(a, k);    %u为聚类中心 
    u(:,1)=[10,-10];
    u(:,2)=[-10,-10];
    u(:,3)=[-10,10];
    u(:,4)=[10,10];
%     for uu=1:k                       
%         u(:,uu) = [-5 * uu + 20,0];
%     end
%     %随机确定初始聚类中心   
%     if numel(k)==1
%         u = ceil(rand(a,k)*10);
%     end
   
%     up = zeros(a,1);
%     down = 0;
%     for w= 1 : n
%         up = up + zij(w) * x(: ,w);
%         down = down + zij(:, w);
%     end
%     u = up / down;
% %    迭代更新聚类中心
%     y_x = 0;
%     u_x = zeros(a,1); 
% %迭代找最优的聚类中心  
 l=1;
 while l
     u_x = u;
    for x = 1:k                               %k=4
        [y_x, u] = K_meanloop(X, k, x, u);    %k=4
        
    end
     if norm(u- u_x)<0.001
         l=0;
         break
     else
         u = u_x;
     end
 end
end

