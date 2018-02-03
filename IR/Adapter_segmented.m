%%Image filtered in YCbCr space using colorThreshold App
imtool(Ycbcr);
%%Remove objects with pixels less than 1000
morph1=bwareaopen(Ycbcr,1000);
imshow(morph1)
%%Remove objects with high orientations/angle wrt X axis
imshow(Ycbcr)
stats=regionprops(morph1,'orientation');
morph2=bwpropfilt(morph1,'orientation',[-70 70]);
imshow(morph2)
%%Create final image
morph2=repmat(morph2,[1 1 3]);
adapter_segmented=adapter;
adapter_segmented(morph2==0)=0;
imshow(adapter_segmented)