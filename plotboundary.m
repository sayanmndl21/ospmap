function plotboundary(x,y)
k=convhull(x,y);
plot(x(k),y(k),'-r')
hold on
end