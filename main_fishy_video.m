%% Get video from IR camera
% Serial Comm Here
clear all; close all; clc; imaqreset;
video=VideoReader('Images/Thermal_fishes.MP4');
hShow = imshow(zeros(480,640,3,'uint8'));title('NO fishes present here');

%% Median blur-Scaledown , Color Space from RGB 2 *** , Get logical objects(containing fish)
frames=200;
while (frames) && (hasFrame(video))
    %video('CurrentTime',frame);
img=readFrame(video);

%Scale_Down
%img=imresize(img,0.5);

img_bw1=color_t(img,1);

% Logical Segmentations: bwarea - bwpropflt - Majoraxis
[img_bw2,stats]=bw_segment(img_bw1);

% IF fish then text_image/print()+overlayed output ELSE continue mirroring feed + print() not
if size(stats,1)>0
  %Plot the circles + Text
  hshow=img_info(img,stats,true);
else
    hShow = imshow(img);title('NO fishes present here');
end
frames=frames-1;pause(1/video.FrameRate);
end
%% Stop webcam
delete(video);
close all;
