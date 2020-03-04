close all; clear all; clc;

clc; close all; clear all;
f=@(x)(x-2); % [0 3]
xl=input ('please input the value of Xl : ');
xu=input ('please input the value of Xu : ');
tol=input('Percentage of relative error tolerance : ');
rel_error=10;  % Error must be greater than tol
%%% To check if there is root in between xl and xu
a=subs(f,xl);
b=subs(f,xu);

while (a*b>0)
    disp ('wrong guess of xl and xu. Try other values')
    xl=input ('please input the value of Xl : ');
    xu=input ('please input the value of Xu : ');
    tol=input('Percentage of relative error tolerance : ');
    a=subs(f,xl);
    b=subs(f,xu);
end

xr=(xl+xu)/2;

if (a*b<0 & subs(f,xr)==0);
    fprintf('Root of given function is %f',xr)
else
    i=1;
    if (a*b<0)
        xr=(xl+xu)/2;
        xri=(xl+xu)/2;  %%% Initail value which will be upfated later
        while(rel_error>tol)
            xr_old=xr;
            c=subs(f,xr);
            d=subs(f,xl);
            
           
            if(c*d<0)
                xu=xr;
            else
                xl=xr;
            end
            xr=(xl+xu)/2;
             if (c*d<0 & subs(f,xr)==0);
            break;
            end
            xrnew(i)=xr;  %%%% xrupdatecd after ithiteratiom
            rel_error(i)=abs((xr-xr_old)/xr*100);
            i=i+1;
        end
    end
end

fprintf('Root of given function is %f\n',xr)

% n=1:1:i-1;
% figure;
% subplot(311)
% plot(n,rel_error,'-bo')
% grid on
% xlabel('number of iteration n')
% ylabel('percentage of relative error')
% 
% m=1:1:i;
% xru=[xri xrnew];
% f_xru=subs(f,xru);
% 
% 
% subplot(312)
% plot(m,xru,'-rs')
% xlabel('number of iteration n')
% ylabel('updated xr at each iteration')
% grid on
% 
% 
% subplot(313)
% plot(m,f_xru,'-g*')
% xlabel('number of iteration n')
% ylabel('function value for each updated xr')
% grid on
% 
