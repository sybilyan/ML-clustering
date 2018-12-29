function [Y,C] = em(XX,K,init_miu,init_sigma,init_pi)
% using EM to segment a image
% INPUT:
%       XX: d * n matrix -- d-dimensional
%       K:  # of clusters
% OUTPUT:
%       Y: lables of clusters
%       C: ?
fprintf('EM for Gaussian mixture: running ... \n');

[d,n] = size(XX);
% yij is a row vector of indicator
% yi is lables
zij = zeros(1,n);
zi = zeros(1,n);
% k is assumed to be known
%
%----- test -----
%miu = [1,2;3,4]; % test
%sigma = [.9 .4; .4 .3]; % test
%pi = [0.6,0.7]; % test
%[miu,sigma,pi,nj,zij,zi]=iter_process_em(2,X,miu,sigma,pi,zij,zi); % test
%}
%[miu,pi,sigma] = init_theta(X,k);
miu = init_miu;
pi = init_pi;
sigma = init_sigma;

while true
    old_miu = miu;
    old_sigma = sigma;
    old_pi = pi;
    [miu,sigma,pi,nj,zij,zi] = em_loop(K,XX,old_miu,old_sigma,old_pi,zij,zi);
    if norm(miu-old_miu)<1e-5;
        Y = zi;
        break
    end
end
    
end