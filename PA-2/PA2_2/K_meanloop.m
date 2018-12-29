function[jlabel, u] = K_meanloop(X, K,  k, uu, l1, l2, l3)
%KΪ�м���
%k��1-4
%jlabelָ������˵�Ӧ��������һ��
%uָ��k��ľ������ĵ�������


[a, b] = size(X);
zij = zeros(1, b);

%����label(zij)
    for m = 1 : b
        disxu = zeros(1, K);
        for n = 1 : K
            disxu (1, n)= ((X(1,m)-uu(1,n))'*(X(1,m)-uu(1,n)))+l1*((X(2,m)-uu(2,n))'*(X(2,m)-uu(2,n))) +l2*((X(3,m)-uu(3,n))'*(X(3,m)-uu(3,n)))+l3*((X(4,m)-uu(4,n))'*(X(4,m)-uu(4,n)));
        end
        jlab = find(disxu == min(disxu));
        jlabel (1, m) = jlab;
        if k == jlab
            zij(1, m)=1;i
        else
            zij(1, m)=0;
        end
    end 
    
%������������u
    up = zeros(a, 1);
    down = 0;
    for w= 1 : b
        up = up + zij(1, w) * X(: ,w);
        down = down + zij(1, w);
    end
    u(:, k)= up / down;
end
    
    