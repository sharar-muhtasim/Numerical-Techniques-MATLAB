x=3;
syms x
f = x.^3+2*x.^2-5*x+9;
z=diff(f)
a=subs(z,2)
