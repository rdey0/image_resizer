img = imread("inputSeamCarvingPrague.jpg");
og_img = img;
energyImg = energy_img(img);

for i=1:50
    [img,energyImg] = decrease_height(img,energyImg);
end
imshow(img)