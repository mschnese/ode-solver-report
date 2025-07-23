function [x, y] = RK2(fun,N,a,b,yin)

%Modified euler version
x(1) = a;
y(1) = yin;
h = (b-a)/N;

for i=1:(b-a)/h
    x(i+1) = x(i)+h;
    K1 = fun(x(i),y(i));
    K2 = fun(x(i)+h,y(i)+K1*h);
    y(i+1) = y(i) + .5*(K1 + K2)*h;
end

end