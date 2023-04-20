function [y] = resamplingtrial(x, p, q)
%RESAMPLING, downsample all trials of given datasubject with a factor of p/q)
%   Detailed explanation goes here
%medelvärdesbilda för alla trials, given kanal för subject. 
%x = avgDataChannel(subject, chvector, trial);

y = resample(x, p, q);

end

