clc; close all; clear all;
x_y = xlsread('x_vs_sinx_column.xls');

x = x_y(:,1);
y = x_y(:,2);

figure;
plot(x,y)
xlabel('value of x')
ylabel('value of y')
grid on
