function[y_x, u]=K_mean(X, K, l1, l2, l3)  
%X为原始数据矩阵   
%k为类数量  
%y_x为正确的分类标签 
    [a,b] = size(X);    %X为a * b的矩阵
    
    y_x = zeros(1, b);  
    %随机确定初始聚类中心   
   
     u = round((-10)+20*rand(a,K));
    
   
%     up = zeros(a,1);
%     down = 0;
%     for w= 1 : n
%         up = up + zij(w) * x(: ,w);
%         down = down + zij(:, w);
%     end
%     u = up / down;
    %迭代更新聚类中心
%     y_x = 0;
%     u_x = zeros(a,1); 
% 迭代找最优的聚类中心  
 l=1;
 while l
     u_x = u;
    for x = 1:K
        [y_x, u] = K_meanloop(X, K, x, u, l1, l2, l3);
        
    end
     if norm(u- u_x)<0.001
         l=0;
         break
     else
         u = u_x;
     end
 end
end

