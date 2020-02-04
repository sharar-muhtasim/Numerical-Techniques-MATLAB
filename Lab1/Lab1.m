
x=-2*pi:pi/3114:2*pi;
a=length(x)
y=sin(x);
 
db=20;
 
y1=awgn(y,db,'measured');
n=y1-y;
 
figure;
plot(x,y,'r',x,y1,'-bo',x,n,'-ks')
xlabel('value of x')
ylabel('value of y')
legend('clean sinx','noisy sinx','noise')
grid on
 
SNR = (snr(y,n))

a