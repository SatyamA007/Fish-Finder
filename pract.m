video=webcam;
hShow = imshow(zeros(480,640,3,'uint8'));title('NO fishes present here');
frames=200;
for i =1:frames
img=snapshot(video);
end