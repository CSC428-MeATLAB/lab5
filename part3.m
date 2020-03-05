% rng(420);
% 
% mu1    = [80 130];
% sigma1 = [40 12; 12 20];
% X1     = mvnrnd(mu1,sigma1,1000);
% C1     = ones(1000,1) * 1;
% 
% mu2    = [102 100];
% sigma2 = [49 44; 44 44];
% X2     = mvnrnd(mu2,sigma2,1500);
% C2     = ones(1500,1) * 2;
% 
% mu3    = [103 170];
% sigma3 = [69 3; 3 420];
% X3     = mvnrnd(mu3,sigma3,1700);
% C3     = ones(1700,1) * 3;
% 
% mu4    = [70 90];
% sigma4 = [40 30; 30 30];
% X4     = mvnrnd(mu4,sigma4,200);
% C4     = ones(200,1) * 4;
% 
% mu5    = [20 110];
% sigma5 = [20 10; 10 10];
% X5     = mvnrnd(mu5,sigma5,400);
% C5     = ones(400,1) * 5;

X = [X1; X2; X3; X4; X5];
C = [C1; C2; C3; C4; C5];

figure(1);
gscatter(X(:,1), X(:,2), C);
title('Original Gaussian Clusters')

% K-Means
clusters = kmeans(X, 5);
figure(2);
gscatter(X(:,1), X(:,2), clusters);
title('K-Means Clustering')

% EM
gmm = fitgmdist(X,5, 'Options',statset('MaxIter',1500));
clusters = cluster(gmm, X);
figure(3);
gscatter(X(:,1), X(:,2), clusters);
title('EM Clustering')
