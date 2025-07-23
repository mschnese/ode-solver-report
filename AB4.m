function [x, y] = AB4(fun,N,a,b,yin)

%4th order Adams-bashforth
x(1) = a;
y(1) = yin;
h = (b-a)/N;

%first couple of points
[x_rk, y_rk] = RK4(fun,h,a,a + 3*h,yin);

x(1:4) = x_rk;
y(1:4) = y_rk;

for i=4:(b-a)/h
    x(i+1) = x(i) + h;
    y(i+1) = y(i) + (h/24)*(55*fun(x(i),y(i)) - 59*fun(x(i-1),y(i-1)) + 37*fun(x(i-2),y(i-2)) - 9*fun(x(i-3),y(i-3)));
end

end