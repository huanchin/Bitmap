rgb1 = imread('1-30-(2).jpg');
rgb2 = imread('1-50-(2).jpg');

img1 = imresize(rgb1,0.09);
img2 = imresize(rgb2,0.09);

Width = size(img1,2);
Height = size(img1,1);

im1 = rgb2gray(img1);
im2 = rgb2gray(img2);

im1mid = median(median(im1));
im2mid = median(median(im2));

img1_lev1 = find(im1>=im1mid);
img2_lev1 = find(im2>=im2mid);

img1_lev2 = find(im1<im1mid);
img2_lev2 = find(im2<im2mid);

bitmap1 = img1;
bitmap2 = img2;

bitmap1 = reshape(bitmap1,[124416,3]);
bitmap2 = reshape(bitmap2,[124416,3]);

for i = 1:size(img1_lev1)
    bitmap1(img1_lev1(i),:) = [255,255,255];
end

for i = 1:size(img1_lev2)
    bitmap1(img1_lev2(i),:) = [0,0,0];
end

for i = 1:size(img2_lev1)
    bitmap2(img2_lev1(i),:) = [255,255,255];
end

for i = 1:size(img2_lev2)
    bitmap2(img2_lev2(i),:) = [0,0,0];
end

bitmap1 = reshape(bitmap1,[Height,Width,3]);
bitmap2 = reshape(bitmap2,[Height,Width,3]);

bm1 = double(rgb2gray(bitmap1));
bm2 = double(rgb2gray(bitmap2));
bm = bm2 - bm1;

figure(1);
imshow(bm1);
figure(2);
imshow(bm2);

out_pos = find(bm);
display(size(out_pos));
img2 = reshape(img2,[124416,3]);
for i = 1:size(out_pos)
    img2(out_pos(i),:) = [255,0,0];
end
img2 = reshape(img2,[Height,Width,3]);
figure(3);
imshow(img2);

return;