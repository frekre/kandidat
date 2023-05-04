function [averagedres] = avgDataChannel(subject, chvector, trial)
%medelvärdesbildar flera kanaler i ett specifikt trial.

sumtrials = zeros(1,4501);

for ch = 1:length(chvector)
    sumtrials(1, :) = sumtrials(1, :) + subject{1,trial}(chvector(ch) , :);
end

averagedres = sumtrials./length(chvector);

end

