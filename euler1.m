function [x, y] = euler1(fun,N,a,b,yin)

x(1) = a;
y(1) = yin;
h = (b-a)/N;

for i=1:(b-a)/h
    x(i+1) = x(i) + h;
    y(i+1) = y(i) + h*fun(x(i),y(i));
end

end