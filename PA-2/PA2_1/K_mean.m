function[y_x, u]=K_mean(X, k)  
%XΪԭʼ���ݾ���   
%kΪ������  
%y_xΪ��ȷ�ķ����ǩ 
    [a,b] = size(X);    %XΪa * b�ľ���
    y_x = zeros(1, b);     
    u = zeros(a, k);    %uΪ�������� 
    u(:,1)=[10,-10];
    u(:,2)=[-10,-10];
    u(:,3)=[-10,10];
    u(:,4)=[10,10];
%     for uu=1:k                       
%         u(:,uu) = [-5 * uu + 20,0];
%     end
%     %���ȷ����ʼ��������   
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
% %    �������¾�������
%     y_x = 0;
%     u_x = zeros(a,1); 
% %���������ŵľ�������  
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

