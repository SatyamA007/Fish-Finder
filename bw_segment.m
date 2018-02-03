function [bw,state]=bw_segment( bw )

if nargin<1
bw = color_t();
end

%bwarea - Remove small ibjects less with than 2000 pixels
bw=bwareaopen(bw,2000);

%bwpropfilt - Removal based on property
bw=imfill(bw,'holes');
imageStats = regionprops(bw, 'Centroid', 'MajorAxisLength','MinorAxisLength','Orientation','Eccentricity');
if ~isempty(imageStats)
stats_ma=imageStats.MajorAxisLength;
imageStats(stats_ma<80)=[];
end
if ~isempty(imageStats)
stats_mi=imageStats.MinorAxisLength;
imageStats(stats_mi<50)=[];
end
state=imageStats;
end

