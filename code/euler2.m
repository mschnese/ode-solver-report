function [x,n] = euler2(N,a,b,yin,f,df)

x(1) = a;
n(1) = yin;
h = (b-a)/N;

for i=1:N
    x(i+1) = x(i) + h;
    y = n(i);

    %newton's method
    for j = 1:20
        F_val = f(y, n(i), h, x(i+1));
        dF_val = df(y, n(i), h, x(i+1)); 

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

end