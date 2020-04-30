wn=1

f=@(x,y) sin(wn*2*pi*(x-0.5))/2 + sin(wn*2*pi*(y-0.5))/2 + 1;
[X,Y]=meshgrid(0:0.001:1);
z=f(X,Y);
[C,h] = contourf(X,Y,z,9);   
clabel(C,h,'FontSize',11)
%set(gca,'fontsize', 24)

set(gca,'xtick',[0,1])
set(gca,'xticklabel',[0,1])

set(gca,'ytick',[0,1])
set(gca,'yticklabel',[0,1])

xlabel('Continuous parameter x_1')
ylabel('Continuous parameter x_2')