function [df,dt] = findsigma(lambda,K)
%hittar standardavvikelse för simuleringen i antal sampel
df = round((3*K) / (lambda * 2* pi));
dt = round(3*lambda);
end

