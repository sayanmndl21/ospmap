clear
close all
A=imread('oilspill.jpg');
targetR = 0; targetG = 0; targetB = 0;
R = A(:,:,1);
G = A(:,:,2);
B = A(:,:,3);
matches = R == targetR & G == targetG & B == targetB;
base = [1.3903e+03 890.7500];
N = -20.71613271;
W = -43.82682358;
S = -20.74471033;
E = -43.77901375;
 mapWidth = abs(deg2km(E-W)*10);
 mapHeight = abs(deg2km(N-S)*10);
 
[y,x] = find(matches);
Rx = base(1)/size(A,2);
 Ry = base(2)/size(A,1);
 %shift coordinates to new imref coordinates
  x = ((x/size(A,2))-(Rx))*mapWidth;
 y = ((y/size(A,1))-(Ry))*mapHeight;

 RA = imref2d(size(A), [-Rx*mapWidth (1-Rx)*mapWidth],...
                        [-Ry*mapHeight (1-Ry)*mapHeight]);
                   
imshow(A,RA,'InitialMagnification',50);
hold on;
grid on;
plot(x,y,'*b')
hold on;
k=convhull(x,y);
plot(x(k),y(k),'-r')
