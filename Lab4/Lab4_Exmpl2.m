clc;close all;
x=0:0.01:5;
y=2*x.^2+3*x+4;
db=30;
yo=awgn(y,db,'measured');

%polyfit%
ap=polyfit(x,yo,2) %for n=2
yp=polyval(ap,x);
MSEp=mean(yo-yp.^2)

%lsqcurvefit%
F=@(a,x)(a(1)*x.^2+a(2)*x+a(3)); %2nd order
ai=[1 1 1];%initialized parameters
[al]=lsqcurvefit(F,ai,x,yo)
y1=F(al,x);
MSEl = mean(yo-y1).^2


figure;
plot(x,yo,'b',x,yp,'r',x,y1,'g')
xlabel('Value of x')
ylabel('Value of y')
legend('observed','polyfitted','lsqfitted');
grid on