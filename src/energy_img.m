function energyImg = energy_img(im)
%Computes the energy at each pixel of a grayscale converted image

    A = rgb2gray(im);   

    %dX = (imfilter(A,[1,-1]));
    %dY = (imfilter(A,[1;-1]));
    
    %energyImg = sqrt(double(dX.^2 + dY.^2));
    %energyImg = im2double(abs(dX) + abs(dY));
    energyImg = imgradient(A,'prewitt');
    %imagesc(energyImg);
    
end