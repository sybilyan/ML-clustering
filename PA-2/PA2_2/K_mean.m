function[y_x, u]=K_mean(X, K, l1, l2, l3)  
%XΪԭʼ���ݾ���   
%kΪ������  
%y_xΪ��ȷ�ķ����ǩ 
    [a,b] = size(X);    %XΪa * b�ľ���
    
    y_x = zeros(1, b);  
    %���ȷ����ʼ��������   
   
     u = round((-10)+20*rand(a,K));
    
   
%     up = zeros(a,1);
%     down = 0;
%     for w= 1 : n
%         up = up + zij(w) * x(: ,w);
%         down = down + zij(:, w);
%     end
%     u = up / down;
    %�������¾�������
%     y_x = 0;
%     u_x = zeros(a,1); 
% ���������ŵľ�������  
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

