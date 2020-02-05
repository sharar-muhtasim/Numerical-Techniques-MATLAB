clc;close all;
x=0:0.5:10;
y0=2*x+3; %% let it gives observed values
n=1; % order used
a=polyfit(x,y0,n)  %% gives model parameters
ym=polyval(a,x); % gives the fittd values
MSE=mean((y0-ym).^2) %gives mean  square error

figure;	
plot(x,y0,'-bs')
hold on
plot(x,ym,'-ro')
grid on
legend('observed','modelled')
