function r_Pf = Simulate1overN(mu,sigma,rho,N_samples,N_stocks)
% Simulate1overN.m -- version 2011-01-06
% mu, sigma ...: drift and volatility (same for all stocks)
% rho .........: linear correlation
% N_samples ...: number of samples
% N_stocks ....: maximum number of stocks

 CovMat = eye(N_stocks) * sigma^2 + (ones(N_stocks) - eye(N_stocks)) * sigma^2* rho;
e = randn(N_samples,N_stocks)* chol(CovMat);
r = mu + e;
% compute mean return for equally weighted portfolio
% of first 1 ... N_stocks stocks
 r_Pf = NaN(N_samples,N_stocks);
 for i = 1:N_stocks
w = ones(i,1)/i;
r_Pf(:,i) = r(:,1:i) * w;
 end
 
 
subplot(2,2,1)
plot (mean(r_Pf))
title ('Mean portfolio return')

subplot(2,2,2)
boxplot (r_Pf)
title ('Portfolio return')

subplot (2,2,3)
plot (std(r_Pf))
title ('Portfolio volatility')
 
 