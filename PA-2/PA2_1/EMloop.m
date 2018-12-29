function[uj, M, pi, Nj, zi, zij] = EMloop(X,  k, miu, MM, pi)
%MM表示sigma
%jlabel指经计算此点应该属于哪一类
%u指第k类的聚类中心的做坐标


[~, b] = size(X);
%E step 计算zij
zij = zeros(1, b);
E_down = 0;
 
for m = 1 : b
    E_up = zeros(1, k);
    for kk = 1: k
        E_up (:,kk) = pi(:,kk) * mvnpdf(X(:,m),miu(:,kk),MM(:,:,kk));
    
        E_down = E_down + E_up (:,kk);
    end 
    maxup = max(E_up);
    mask = find(E_up == maxup);
    if max_pn == 0
        zij(1,ii) = 0;
    else
    zi(1, m) = mask;
    zij(1, m) = E_up./E_dowm;
 end

 %迭代估计第j类中的Nj
    Nj = zeros(1, k);
    for w= 1 : k
        j = find(zi == w);
        for fj = j
        Nj(1, w) = Nj(1, w) + zij(1, fj); 
        end
    end
    
    %迭代估计pi_j
  pii = zeros(1, k);
  for q = 1:k
      pii(1, q) = Nj(1, q)/b;
  end
  
   %迭代估计uj
   uu_x = zeros(d,k); 
for kkk = 1:k
    jj = find(zi == kkk); % find out that whose label is j
    for fjj = jj
        uu_x(:,kkk) = uu_x(:,kkk) + zij(1,fjj) * X(:,fjj);
    end
    uj(:,kkk) = uu_x(:,kkk) / Nj(1,kkk);
end
  
%迭代计算sigma 表示成M
   sigma_x = zeros(a,a,k); 
for kkkk = 1:k
    jj = find(zi == kkkk); % find out that whose label is j
    for fjjj = jjj
    sigma_x(:,kkkk) = sigma_x(:,kkkk) + zij(1,fjjj) * (X(:,fjjj)-uj(:,k))*(X(:,fjjj)-uj(:,k))';
    end    
    M(:,:,kkkk) = sigma_x(:,:,kkkk) / Nj(1,kkkk);
end

end
    
    