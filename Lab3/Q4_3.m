clc;close all;

x=0:0.02:1;
y= 10*x.^10 + 9*x.^9 +8*x.^8 +7*x.^7 +6*x.^6 +5*x.^5 +4*x.^4 +3*x.^3 + +2*x.^2 +x +10 ; %% let it gives observed values
temp_MSE= cell(11,1); %creates an empty cell of 11 rows
temp_n = cell(11,1);
db = 20;

for n = 1:1:10
    
    y0 = awgn(y,db,'measured');
    a=polyfit(x,y0,n)  %% gives model parameters
    ym=polyval(a,x); % gives the fittd values
    MSE= mean((y0-ym).^2); %gives mean  square error
    temp_MSE{n} = MSE; %stores each value of MSE in in each index of the error matrix
    temp_n{n} = n;
    
end
n_e = [temp_n,temp_MSE];
xlswrite('Order vs mse.xls',n_e);

n_MSE = xlsread('Order vs mse.xls');
order = n_MSE(:,1);
MSE = n_MSE(:,2);

figure;
plot(order, MSE, '-bs')
xlabel('Order, n')
ylabel('MSE')
grid on



