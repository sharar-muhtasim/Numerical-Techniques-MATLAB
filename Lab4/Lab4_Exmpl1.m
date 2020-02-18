clc;close all;
x=0:0.01:5;
y=2*x.^2+3*x+4;
db=30;
yo=awgn(y,db,'measured');

%polyfit%
ap=polyfit(x,yo,2) %for n=2
yp=polyval(ap,x);
MSEp=mean(yo-yp.^2);

figure;
plot(x,yo,'b',x,yp,'r')
xlabel('Value of x')
ylabel('Value of y')
legend('observed','polyfitted');
grid on