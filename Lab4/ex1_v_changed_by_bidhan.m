clc;close all;clear all;

x=0:0.0001:100;
a=10;b=50;c=0.1;
temp = -((x-b).^2)/(2*c.^2);
y=a*(exp(temp)); % x and y data
t_M= zeros(10,1);          %creates an empty cell of 11 rows
t_n = zeros(10,1);
for k = 1:1:10
    db = 30;
    y0 = awgn(y,db,'measured');
    n=k;                     %order used
    a=polyfit(x,y0,n);       %gives model parameters
    ym=polyval(a,x);         % gives the fittd values
    MSE= mean((y0-ym).^2);   %gives mean  square error
    t_M(k,1) = MSE;            %stores each value of MSE 
    %in each index of the error matrix
    t_n(k,1) = n;
    
end
%s_e = [t_n:t_M];
%xlswrite('MSE_vs_n.xls',s_e);
n_M = [t_M,t_n];
n = n_M(:,1);
MSE = n_M(:,2);
figure;
plot(n, MSE, '-bs')
xlabel('Order,n')
ylabel('MSE')
grid on
