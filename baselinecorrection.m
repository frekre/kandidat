function [baselinecorrectedchannel, baseline] = baselinecorrection(data, channel, trial)
%BASELINECORRECTION Function that calculates the average energy of the
%baseline activity and subtracts it from the signal. Does not downsample or filter the signal. 
%data: which datasource that should be used.
%channel: channel that should be baseline corrected, number of the channel. 
%trials: over which trial it should be corrected.

%hämta värden för kanalen: 
baselinecorrectedchannel = data.trial{1, trial}(channel, :);

%hitta medelvärdet som ska dras bort (första två sekunderna, 1000 samples)
baseline=mean(baselinecorrectedchannel(1,1:1000));
baselinecorrectedchannel(1,:)=baselinecorrectedchannel(1,:)-baseline;



end

