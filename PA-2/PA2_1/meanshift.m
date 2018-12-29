function [labels,clusters,k] = meanshift(X,h)

[a,b] = size(X);
I = eye(a);
numClust = 0; % 类的数量 初始为零 一点一点加起来
clusters = []; %聚类中心
threshold = 1e-3*h;
labels = zeros(1,b); %每个点的标记
sign = zeros(1,b); %

for i = 1:b
    if sign(i) == 1
        continue; % the signed point is already in the cluster do not need...
                    % to be calculated
    end
    t = 0;
    u0 = X(:,i);
    sigma = (h^2) * I; % [d*d]
    k = []; % the point located in the kernel with h
    x_up = zeros(a,1);
    x_down = zeros(a,1);
    while true
        if t == 0 
            old_miu = u0;
        else
            old_miu = new_miu;
        end
        
        d = sum((repmat(old_miu,1,b) - X).^2);
        k = find(d < (h^2)); 
        for ii = k
            x_up = x_up + X(:,ii) * mvnpdf(X(:,ii),old_miu,sigma);
            x_down = x_down + mvnpdf(X(:,ii),old_miu,sigma);
        end
        new_miu = x_up./x_down;
        
         if norm(new_miu - old_miu) < threshold
            
            % can the new cluster and old cluster be merged?
            merge = 0; 
            for iii = 1:numClust
                dist2other = norm(new_miu-clusters(:,iii));%distance from posible new clust max to old clust max
                if dist2other < h/2  %if its within h/2 merge new and old
                    merge = iii;
                    break
                end  
            end
            
            % merge? -> the max mean of new and old becomes the mean after
            %           merge
            % not merge? -> create a new cluster and record the new mean
            
            if merge > 0    % merge is equal to the number of cluster
                clusters(:,merge) = 0.5*(new_miu+clusters(:,merge)); 
                labels(i) = merge;    %add these votes to the merged cluster
                for s = k
                    if sign(s) == 0
                        sign(s) = 1;
                        labels(s) = merge;
                    end
                end
            else    % create a new cluster
                numClust = numClust+1; %increment clusters
                clusters(:,numClust) = new_miu;     %record the mean  
                labels(i) = numClust;
                for s = k
                    sign(s) = 1;
                    labels(s) = numClust;
                end
            end
            break;
        end
        t = t + 1; % iteration + 
            end
        
end