clc;close all;clear all;
x=0:0.02:1;
y= 10*x.^10 + 9*x.^9 +8*x.^8 +7*x.^7 +6*x.^6 +5*x.^5 +4*x.^4 +3*x.^3 + +2*x.^2 +x +10 ; %% let it gives observed values
db = 20;
y0 = awgn(y,db,'measured');
n=1; % order used
a=polyfit(x,y0,n)  %% gives model parameters
ym=polyval(a,x); % gives the fittd values
MSE= mean((y0-ym).^2) %gives mean  square error
    
figure;	
plot(x,y0,'-bs')
xlabel('value of x')
ylabel('value of y')
hold on
plot(x,ym,'-ro')
grid on
legend('observed','modelled')
