clc; close all; clear all;
x=-2*pi:pi/32:2*pi;
y=sin(x);


db=20;
y1=awgn(y,db,'measured');
n=y1-y;


figure;
plot(x,y,'r',x,y1,'-bo',x,n,'-ks')
xlabel('value of x')
ylabel('value of sinx')
legend('clean sin(x)','noisy sin(x)', 'noise')
grid on

