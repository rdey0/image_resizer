function [cumulativeEnergyMap] = cumulative_min_energy_map(energyImg,seamDirection)
% start from last row, choose lowest val, and then choose based off that

cumulativeEnergyMap = repmat(energyImg,1);

if strcmp(seamDirection,'HORIZONTAL') == 1
    % transpose matrix if seam direction is horizontal
    cumulativeEnergyMap = transpose(cumulativeEnergyMap);
end

% Calculate via dynamic programming
[num_row, num_col] = size(cumulativeEnergyMap);
if num_row >= 2
    for i=2:1:num_row
        for j=1:1:num_col
            if j == 1
                M = cumulativeEnergyMap(i-1,j:j+1);
            elseif j == num_col
                M = cumulativeEnergyMap(i-1,j-1:j);
            else
                M = cumulativeEnergyMap(i-1,j-1:j+1);
            end
            cumulativeEnergyMap(i,j) = min(M) + cumulativeEnergyMap(i,j);
        end
    end
end

if strcmp(seamDirection,'HORIZONTAL') == 1
    % transpose it back
    cumulativeEnergyMap = transpose(cumulativeEnergyMap);
end

end

