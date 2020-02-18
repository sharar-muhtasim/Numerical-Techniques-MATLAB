clc;close all;
x=0:0.1:100;
y=10*exp((-(x-50).^2)/(2*(0.1.^2)));
db=30;
yo=awgn(y,db,'measured');
%i

n=2;
ap = polyfit(x,yo,n)
yp=polyval(ap,x);
MSEp = mean(yo-yp).^2

figure;
plot(x,yo,'b',x,yp,'r')
xlabel('value of x');ylabel('value of y')
legend('observed','polyfitted');grid on
