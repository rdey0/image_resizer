function [reducedColorImage,reducedEnergyImg] = decrease_height(im,energyImg)

cumMap = cumulative_min_energy_map(energyImg,'HORIZONTAL');
horizontalSeam = find_horizontal_seam(cumMap);

[row_size,col_size] = size(energyImg);

reducedColorImage = uint8(zeros(row_size-1,col_size,3));
reducedEnergyImg = uint8(zeros(row_size-1,col_size-1));

[~,seam_length] = size(horizontalSeam);
for i=1:seam_length
%     for k=1:col_size-1
%         if k >= verticalSeam(i)
%             seam_idx = k+1;
%         else
%             seam_idx = k;
%         end
%         reducedEnergyImg(i,k) = energyImg(i,seam_idx);
%         for j=1:3
%             % build Color Img
%             reducedColorImage(i,k,j) = im(i,seam_idx,j);
%         end
%     end
    reducedEnergyImg(:,i) = cat(1,energyImg(1:horizontalSeam(i)-1,i),energyImg(horizontalSeam(i)+1:end,i));
    for j=1:3
        reducedColorImage(:,i,j) = cat(1,im(1:horizontalSeam(i)-1,i,j),im(horizontalSeam(i)+1:end,i,j));
    end
end

end