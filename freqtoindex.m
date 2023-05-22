function [indexlow,indexhigh,df] = freqtoindex(y, F, deltaf)
%freq to index turns a frequency to an index.

indexlow = 0;
indexhigh = 0;
findstep= F(1)-F(2);

df = round(deltaf/findstep);

for ind=1:1:length(F)
    if F(ind) == y-deltaf
        indexlow= ind;
    end
    if F(ind)== y+deltaf
        indexhigh=ind;
    end
end
df = (indexhigh -indexlow)/2;

end

