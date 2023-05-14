function [df,dt] = findsigma(lambda,K)
%hittar standardavvikelse för simuleringen i antal sampel
df = round((1*K) / (lambda * 2* pi));
dt = round(1*lambda);
end

