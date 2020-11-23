img = imread("inputSeamCarvingPrague.jpg");
og_img = img;
energyImg = energy_img(img);

for i=1:100
    [img,energyImg] = decrease_width(img,energyImg);
end
imshow(img)
