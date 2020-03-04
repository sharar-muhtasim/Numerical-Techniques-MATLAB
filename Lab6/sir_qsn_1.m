clc;close all;clear all;
f=@(x) 1+0.5*cos(x)+2*tan(x/2);
diff = @(x) -0.5*sin(x)+(sec(x/2))^2; %ei part experiment korbo pore

r=input('Input a value of root r: ');
tol=input('Percentage of relative error tolerance: ');
rel_error = 1;

xr=r;
i=1;
while(rel_error > tol)
   xr_old = xr;
   xr = xr-(f(xr)/diff(xr));
   xrnew(i) = xr;
   rel_error(i) = abs((xr-xr_old)/xr)*100;
   i=i+1;
end
fprintf('The  root of the function is %f', xr);

n=1:1:i-1;
figure;
subplot(311)
plot(n,rel_error,'-ro')
grid on
xlabel('number of iteration n')
ylabel('percentage of relative error')

m=0:1:i-1;
xru =[r xrnew];
subplot(312)
plot(m,xru,'-bs')
xlabel('number of iteration n')
ylabel('updated xr at each iteration')
grid on

f_xru=subs(f,xru);
subplot(313)
plot(m,f_xru,'-gp')
xlabel('number of iteration n')
ylabel('function value for each updated xr')
grid on
