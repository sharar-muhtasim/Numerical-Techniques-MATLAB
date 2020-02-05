clc; close all; clear all;

x = 0:0.1:10;
y=2+3*x;
n = length(x);
term_1 = n*(sum(x.*y));
term_2 = sum(x)*sum(y);
x_sq = x.^2;
term_3 = n*sum(x_sq);
term_4 = (sum(x)).^2;
y_bar = mean(y);
x_bar = mean(x);

a1 = (term_1 - term_2)/(term_3 - term_4)
a0 = y_bar - (a1*x_bar)