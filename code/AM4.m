function [x,n] = AM4(fun,N,a,b,yin,f,df)

%4th order adams moulton
x(1) = a;
n(1) = yin;
h = (b-a)/N;

%first couple of points
[x_rk, y_rk] = RK4(fun,h,a,a + 2*h,yin);

x(1:3) = x_rk;
n(1:3) = y_rk;

for i=3:N
    x(i+1) = x(i) + h;
    y = n(i);
    %newton's method
    for j = 1:20
        F_val = f(y, n(i));
        dF_val = df(y, n(i)); 

        ynew = y - F_val / dF_val;
        
        if abs(ynew - y) < 10e-12
            break;
        else
            y = ynew;
        end
    end

    if j==20
        fprintf('Numerical Solution could not be calculated in 20 iterations')
        break
    end
    n(i+1) = ynew;
end

y = n(i) + (h/24)*(9*fun(x(i+1),n(i+1)) + 19*fun(x(i),n(i) - 5*fun(x(i-1),n(i-1)) + fun(x(i-2),n(i-2))));

end