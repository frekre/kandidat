function [channel] = findChannels(data, name)
%Returning the channel number in the trial corresponding to the electrode
%name. 
channel = [];
for a = 1:length(name)
    for i=1:length(data.cfg.channel)
        if isequal(data.cfg.channel{i, 1}, name{a})
            channel(end +1) = i;
        end
    end
    if length(channel) ==0
    'Error: Channel is a reject';
    end
end


