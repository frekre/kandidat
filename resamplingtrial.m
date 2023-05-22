function [y] = resamplingtrial(x, p, q)
%RESAMPLING, downsample all trials of given datasubject with a factor of p/q)
%medelvärdesbilda för alla trials, given kanal för subject.
%x = signal, could be one channel or summarised signals

y = resample(x, p, q);

end

