clc;close all;
x=0:0.1:100;
a=10;b=50;c=0.1
y=a*exp((-(x-b).^2)/(2*(c.^2)));
db=30;
yo=awgn(y,db,'measured');
%i

%%%% lsqcurvefit %%%
F = @(z,x)(z(1)*exp((-(x-z(2)).^2)/(2*(z(3).^2)))); %% 2nd order polynomial
ai=[10 50 0.1];  %% model parameters, needs to initialize/guess this
[al] = lsqcurvefit(F,ai,x,yo)  %% model parameters  
yl=F(al,x);  %Fitted data
MSEl=mean((yo-yl).^2)  %% MSE
 


figure;
plot(x,yo,'b',x,yl,'r')
xlabel('value of x');ylabel('value of y')
legend('observed','lfitted');grid on
