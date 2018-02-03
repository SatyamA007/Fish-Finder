%%Image 'region_segmentor' is loaded using Image Segmenter app
apple_opt=apple;
apple_opt(repmat(region_segmentor,[1 1 3])==0)=0;
imshow(apple_opt)

%%'Lab' is the filtered image of apple_opt is loaded using Color Threshold app
imshow(Lab)

%%Dilating Lab 
se = strel('line',5,5);
dilated_lab = imdilate(Lab,se);
filled_lab=imfill(dilated_lab,'holes');
figure;imshow(dilated_lab);
figure;imshow(filled_lab);

%%Rotten part is the part filled by imfill
rotten_part=abs(filled_lab-dilated_lab);
figure;imshow(rotten_part);
figure;imshow(apple);

%%Displaying actual apple image and image with apple highlighted side by side using subplot 
rotten_part=logical(rotten_part);
rotten_highlighted=imoverlay(apple,rotten_part,[180 120 80]/256);
figure;imshow(rotten_highlighted);
subplot(1,2,1);
imshow(rotten_highlighted),title('Rotten highlighted with brown');
subplot(1,2,2);
imshow(apple),title('Original');