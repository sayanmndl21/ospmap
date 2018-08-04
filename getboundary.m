function [coord,uav]=getboundary(A,N_Agents)
%%Identify colours
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
%%set coordinates of the area needed 
[coord.y,coord.x] = find(matches);
Rx = base(1)/size(A,2);
 Ry = base(2)/size(A,1);
 %shift coordinates to new imref coordinates
  coord.x = ((coord.x/size(A,2))-(Rx))*mapWidth;
 coord.y = ((coord.y/size(A,1))-(Ry))*mapHeight;
%plot(x,y,'*b')
hold on;
%get boundary
k=convhull(coord.x,coord.y);
plot(coord.x(k),coord.y(k),'-r')
x=coord.x(k);
y=coord.y(k);
n=size(k,1)
steps=round(n/N_Agents);
for l=1:N_Agents
t=round((n*l)/N_Agents);
uav.x(l,1)=x(t,1);
uav.y(l,1)=y(t,1);
end
plot(uav.x,uav.y,'k+')
end