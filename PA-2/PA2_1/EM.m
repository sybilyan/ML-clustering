function[u, pi, M_x, Nj, zi, zij]=EM(X, k)  
%XΪԭʼ���ݾ���   a * b
%kΪ�������ĸ��� 
%y_xΪ��ȷ�ķ����ǩ 
%��ʼ��
    [a,b] = size(X);    %XΪa * b�ľ���
    
    pi = zeros(1, k);
    M_x = zeros(a, a, k); %sigma���ΪM_x
    u = zeros(a, k);    %uΪ��������
    %����ȷ����ʼ��������
%     for uu=1:k                       
    init_miu(:,1)=[10,-10];
    init_miu(:,2)=[-10,-10];
    init_miu(:,3)=[-10,10];
    init_miu(:,4)=[10,10];
 %   end
    
%calcute distance of ||x-init_miu||^2
aa=repmat(sum(X'.*X',2),1,k);
bb=repmat(sum(u'.*u',2)',b,1);%b=200
cc=2 * X' * u;
distance = aa+bb-cc;

[~,labels] = min(distance,[],2);

for j=1:k
    Xj = X(:,labels == j);
    pi(j) = size(Xj,1)/b;
    cc = cov(Xj');

    M_x(:,:,j) = cc;
end

    l=1;    
while l
    u_x = u;
    MM = M_x;
    pi_x = pi;  

    [u, M_x, pi, Nj, zi, zij] = EMloop(X, k, u_x, MM, pi_x);
    if norm(u- u_x)<0.0000000001
         l=0;
         break
     else
         u = u_x;
     end
 end
end
        
        
    
    
%����x-u��ŷ�Ͼ���
%     x = repmat(sum(X'.*X', 2), 1, k);
%     y = repmat(sum(u'.*u', 2), n, 1);
%     z = 2* X'* u;
%     distance = x+y-c;
    