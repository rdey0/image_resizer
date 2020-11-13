function view_seam(im, seam, seamDirection)
%VIEW_SEAM Summary of this function goes here
%   Detailed explanation goes here
    imshow(im)
    hold on
    if seamDirection == "HORIZONTAL"  
        dim = linspace(1,size(im,1),size(im,1));
        disp(dim);
        plot(dim,seam,"r");
    elseif seamDirection == "VERTICAL"
        dim = linspace(1,size(im,1),size(im,1));
        disp(dim);
        plot(seam,dim,"r");
    end
    
   
end

