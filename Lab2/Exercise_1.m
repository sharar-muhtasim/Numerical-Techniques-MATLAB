%Exercise 1 by Sharar and Bidhan
clc;close all;clear all;
x=[-3*pi:pi/20:3*pi];
y=sin(x)+sin(2*x)+sin(3*x)+sin(4*x);
x_y = [x;y];
xlswrite('Exercise_1',x_y)

db=15;
y1 = awgn(y,db,'measured');
xlswrite('Exercise_1_AWGN',y1)
info = xlsread('Exercise_1');
new_y1=xlsread('Exercise_1_AWGN');
new_y=info(2,:);


n=new_y1-new_y;


plot(x,y,'r',x,y1,'-bo',x,n,'-ks')
xlabel('value of x')
ylabel('value of y')
legend('clean sinx','noisy sinx','noise')
grid on

SNR = (snr(y,n))

