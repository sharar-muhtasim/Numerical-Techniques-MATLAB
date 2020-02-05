clc;close all;
x=0:0.5:10;
temp_MSE= cell(11,1); %creates an empty cell of 11 rows
temp_db = cell(11,1);
y=2*x+3; %% let it gives observed values
for k = 1:1:11
    db = 19+k;
    y0 = awgn(y,db,'measured');
    n=1; % order used
    %a=polyfit(x,y0,n)  %% gives model parameters
    ym=polyval(a,x); % gives the fittd values
    MSE= mean((y0-ym).^2); %gives mean  square error
    temp_MSE{k} = MSE; %stores each value of MSE in in each index of the error matrix
    temp_db{k} = db;
    
end
s_e = [temp_db,temp_MSE];
xlswrite('Snr vs mse.xls',s_e);

snr_MSE = xlsread('MSE.xls');
snr = snr_MSE(:,1);
MSE = snr_MSE(:,2);

figure;
plot(snr, MSE, '-bs')
xlabel('SNR')
ylabel('MSE')
grid on



