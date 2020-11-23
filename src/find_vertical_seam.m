function [ verticalSeam ] = find_vertical_seam( cumulativeEnergyMap )
[numRow, numCol] = size(cumulativeEnergyMap);
[~,cur_idx] = min(cumulativeEnergyMap(numRow,:));
verticalSeam = cur_idx;
for i=numRow-1:-1:1
    cur_row = cumulativeEnergyMap(i,:);
    if cur_idx == 1
        [~,next_idx] = min(cur_row(cur_idx:cur_idx+1));
        cur_idx = cur_idx - 1 + next_idx;
    elseif cur_idx == numCol
        [~,next_idx] = min(cur_row(cur_idx-1:cur_idx));
        cur_idx = cur_idx - 2 + next_idx;
    else
        [~,next_idx] = min(cur_row(cur_idx-1:cur_idx+1));
        cur_idx = cur_idx - 2 + next_idx;
    end
    verticalSeam = [cur_idx verticalSeam(1:end)];
end
end