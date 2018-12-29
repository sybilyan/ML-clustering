function [miu,sigma,PiJ,Nj,zij,zi] = em_loop(K,XX,miu,sigma,pi,zij,zi)
[d,n] = size(XX);
% ==== Calculate the new zij ====
for ii=1:n
    Pi_norm = zeros(1,K);
    sum_normK = 0;
    for kk = 1:K
        Pi_norm(:,kk) = pi(:,kk) * mvnpdf(XX(:,ii),miu(:,kk),sigma(:,:,kk)); % if =0
                                                                    ...not in K clusters
                                                                        ... K++
        sum_normK = sum_normK + Pi_norm(:,kk);
    end
    max_pn = max(Pi_norm);
    max_k = find(Pi_norm == max_pn);
    if max_pn == 0
        zij(1,ii) = 0;
    else
        zi(1,ii) = max_k;
        zij(1,ii) = max_pn./sum_normK;
    end
end

% ==== Calculate the new theta ====
% Nj -- the number of point assigned to cluster j
Nj = zeros(1,K);
for kkk = 1:K
    j = find(zi == kkk); % find out that whose label is j
    for fj = j
        Nj(1,kkk) = Nj(1,kkk) + zij(1,fj); % new Nj for cluster j
    end
end

% PiJ -- the prob. of point assigned to cluster j
PiJ = zeros(1,K);
for kv = 1:K
    PiJ(1,kv) = Nj(1,kv) / n; % new pi
end

% miu -- the miu of cluster j
zij_x = zeros(d,K); % zij * xi
for kvv = 1:K
    jj = find(zi == kvv); % find out that whose label is j
    for fjj = jj
        zij_x(:,kvv) = zij_x(:,kvv) + zij(1,fjj) * XX(:,fjj);
    end
    miu(:,kvv) = zij_x(:,kvv) / Nj(1,kvv);
end

% sigma -- the sigma of cluster j
zij_x_miu = zeros(d,d,K); % zij * (xi-miuj) * (xi-miuj)'
for kvi = 1:K
    jjj = find(zi == kvi);
    for fjjj = jjj
        temp = zij(1,fjjj) * (XX(:,fjjj)-miu(:,kvi)) * (XX(:,fjjj)-miu(:,kvi))';
        zij_x_miu(:,:,kvi) = zij_x_miu(:,:,kvi) + temp;
    end
    sigma(:,:,kvi) = zij_x_miu(:,:,kvi) / Nj(1,kvi);
end

end

