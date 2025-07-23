function [x, y] = RK4(fun,N,a,b,yin)

%classical
x(1) = a;
y(1) = yin;
h = (b-a)/N;

for i=1:(b-a)/h
    x(i+1) = x(i)+h;
    K1 = fun(x(i),y(i));
    K2 = fun(x(i)+.5*h,y(i)+.5*K1*h);
    K3 = fun(x(i)+.5*h,y(i)+.5*K2*h);
    K4 = fun(x(i)+h,y(i)+K3*h);
    y(i+1) = y(i) + ((1/6)*K1 + (1/3)*K2 + (1/3)*K3 + (1/6)*K4)*h;
end

end