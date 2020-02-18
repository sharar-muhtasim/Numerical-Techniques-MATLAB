clc;close all;
x=0:0.001:3;
y=4.^x+1;
db=30;
yo=awgn(y,db,'measured');

%polyfit%
ap=polyfit(x,yo,2) %for n=2 because a.^x + b
yp=polyval(ap,x);
MSEp=mean(yo-yp.^2)

%lsqcurvefit%
F=@(a,x)(a(1).^x+a(2)); %2nd order
ai=[1 1];%initialized parameters
[al]=lsqcurvefit(F,ai,x,yo)
y1=F(al,x);
MSEl = mean(yo-y1).^2 %MSE


figure;
plot(x,yo,'k',x,yp,'b',x,y1,'r')
xlabel('Value of x')
ylabel('Value of y')
legend('observed','polyfitted','lsqfitted');
grid on