function  hShow=img_info(img,s,elip )
%For plotting elipses around the fishes and text saying number of fishes
%detected

if nargin<3
    elip=false;
end

%%Displaying text stating number of fishes
st=strcat(num2str(size(s,1)),' Fishes detected!!');
img = insertText(img,[35,185],st,'FontSize',18,'BoxColor','red','BoxOpacity',0.4,'TextColor','white');

hShow=imshow(img);title(strcat('\color{red}',st));
hold on
%%Plotting elipses if asked for
if elip
phi = linspace(0,2*pi,50);
cosphi = cos(phi);
sinphi = sin(phi);
for k = 1:length(s)
    xbar = s(k).Centroid(1);
    ybar = s(k).Centroid(2);

    a = s(k).MajorAxisLength/2;
    b = s(k).MinorAxisLength/2;

    theta = pi*s(k).Orientation/180;
    R = [ cos(theta)   sin(theta)
         -sin(theta)   cos(theta)];

    xy = [a*cosphi; b*sinphi];
    xy = R*xy;

    x = xy(1,:) + xbar;
    y = xy(2,:) + ybar;

    plot(x,y,'r','LineWidth',2);
end
end

end

