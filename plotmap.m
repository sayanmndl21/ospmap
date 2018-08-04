function A=plotmap()
figure(1)
A = imread('oilspill.jpg');
%base = [892.0000 557.7500];...=>>for uavmap.jpg
% N = -20.72613271;
% W = -43.81682358;
% S = -20.74471033;
% E = -43.77901375;

%imshow('ufmg.jpg');
%base = 1.0e+03 * [1show.8379    2.6473];
%base = [1.2268e+03 781.2500];...=>>for spill.jpg
%%
base = [1.3903e+03 890.7500]; %...=>>for oilspill.jpg
N = -20.71613271;
W = -43.82682358;
S = -20.74471033;
E = -43.77901375;
 mapWidth = abs(deg2km(E-W)*10);
 mapHeight = abs(deg2km(N-S)*10);
 Rx = base(1)/size(A,2);
 Ry = base(2)/size(A,1);
 %% 
  RA = imref2d(size(A), [-Rx*mapWidth (1-Rx)*mapWidth],...
                        [-Ry*mapHeight (1-Ry)*mapHeight]);
                   
imshow(A,RA,'InitialMagnification',50);

%axis([-1000 1000 -1000 1000]);
grid on; hold on;
%axis equal
end