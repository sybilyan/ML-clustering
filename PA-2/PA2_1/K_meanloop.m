function[jlabel, u] = K_meanloop(X, K,  k, miu)

%jlabelָ������˵�Ӧ��������һ��
%uָ��k��ľ������ĵ�������


[a, b] = size(X);
zij = zeros(1, b);

%����label(zij)
    for m = 1 : b
        disxu = zeros(1, K);
        for n = 1 : K
            disxu (1, n)= dot((X(:,m)-miu(:,n)),(X(:,m)-miu(:,n)));
        end
        jlab = find(disxu == min(disxu));
        jlabel (1, m) = jlab;
        if k == jlab
            zij(1, m)=1;
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
    
    