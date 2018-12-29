function[jlabel, u] = K_meanloop(X, K,  k, miu)

%jlabel指经计算此点应该属于哪一类
%u指第k类的聚类中心的做坐标


[a, b] = size(X);
zij = zeros(1, b);

%设置label(zij)
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
    
%迭代估计中心u
    up = zeros(a, 1);
    down = 0;
    for w= 1 : b
        up = up + zij(1, w) * X(: ,w);
        down = down + zij(1, w);
    end
    u(:, k)= up / down;
end
    
    