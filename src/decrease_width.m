function [reducedColorImage,reducedEnergyImg] = decrease_width(im,energyImg)
cumMap = cumulative_min_energy_map(energyImg,'VERTICAL');
verticalSeam = find_vertical_seam(cumMap);

[row_size,col_size] = size(energyImg);

reducedColorImage = uint8(zeros(row_size,col_size-1,3));
reducedEnergyImg = uint8(zeros(row_size,col_size-1));

[~,seam_length] = size(verticalSeam);
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
    reducedEnergyImg(i,:) = cat(2,energyImg(i,1:verticalSeam(i)-1),energyImg(i,verticalSeam(i)+1:end));
    for j=1:3
        reducedColorImage(i,:,j) = cat(2,im(i,1:verticalSeam(i)-1,j),im(i,verticalSeam(i)+1:end,j));
    end
end

end