function bw=color_t( rgb,mb )

if nargin<1
rgb = imread('Images\ratfish.jpg');mb=0;
elseif nargin<2
mb=false;
end
%Median Blur
if mb
    noise=rgb;
    for c = 1 : 3
    rgb(:, :, c) = medfilt2(noise(:, :, c), [3, 3]);
    end
end


%COLOR_T takes rgb from video and changes to apt colorspace used for
%segmenting here itself
bw=createMask(rgb);
end

