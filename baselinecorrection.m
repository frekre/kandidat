function [baselinecorrectedchannel, sum] = baselinecorrection(data, channel, trial)
%BASELINECORRECTION Function that calculates the average energy of the
%baseline activity and subtracts it from the signal. Does not downsample or filter the signal. 
%data: which datasource that should be used.
%channel: channel that should be baseline corrected, number of the channel. 
%trials: over which trial it should be corrected.

%hämta värden för kanalen: 
baselinecorrectedchannel = data.trial{1, trial}(channel, :);

%hitta medelvärdet som ska dras bort (första två sekunderna, 1000 samples)
sum = 0; 
for i= 1:100
    sum = sum + baselinecorrectedchannel(1,i);
end
sum = sum/1000; 

%dra bort värdet från signalen: 
baselinecorrectedchannel = baselinecorrectedchannel-sum;


end

