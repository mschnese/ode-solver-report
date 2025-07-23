clear;clc
fun1 = @(x,y) -400 * y;
fun2 = @(x,y) cos(pi*x) + y;
N = [10, 20, 40, 80, 120, 360, 640];
a = 0;
b1 = 0.2;
b2 = 1;
n(1) = 0.2;

h1 = zeros(length(N));
h2 = zeros(length(N));
for i=1:length(N)
    h1(i) = (b1-a)/N(i);
    h2(i) = (b2-1)/N(i);
end

F1 = @(y, n_i, h, ~) y * (1 + 400 * h) - n_i;
dF1 = @(y, n_i, h, ~) 1 + 400 * h;
F2 = @(y, n_i, h, x) y * (1 - h) - n_i - h * cos(pi * x);
dF2 = @(y, ~, h, ~) 1 - h;

analytic1 = @(x) 0.2*exp(-400*x);
analytic2 = @(x) (cos(pi*x) + pi*sin(pi*x))/(1+pi^2) + 0.108*exp(x);
x=linspace(0,1,5000);

%Test 1
[x11a,y11a] = euler1(fun1,N(1),a,b1,.2);
[x11b,y11b] = euler1(fun2,N(1),a,b2,.2);
[x12a,y12a] = euler1(fun1,N(2),a,b1,.2);
[x12b,y12b] = euler1(fun2,N(2),a,b2,.2);
[x13a,y13a] = euler1(fun1,N(3),a,b1,.2);
[x13b,y13b] = euler1(fun2,N(3),a,b2,.2);
[x14a,y14a] = euler1(fun1,N(4),a,b1,.2);
[x14b,y14b] = euler1(fun2,N(4),a,b2,.2);
[x15a,y15a] = euler1(fun1,N(5),a,b1,.2);
[x15b,y15b] = euler1(fun2,N(5),a,b2,.2);
[x16a,y16a] = euler1(fun1,N(6),a,b1,.2);
[x16b,y16b] = euler1(fun2,N(6),a,b2,.2);
[x17a,y17a] = euler1(fun1,N(7),a,b1,.2);
[x17b,y17b] = euler1(fun2,N(7),a,b2,.2);

figure(1);clf
subplot(1,2,1)
plot(x11a, y11a, 'color', [1 0 0]);
hold on
plot(x12a, y12a, 'color', [1 0.5 0]);
hold on
plot(x13a, y13a, 'color', [1 1 0]);
hold on
plot(x14a, y14a, 'color', [0 1 0]);
hold on
plot(x15a, y15a, 'color', [0 0 1]);
hold on
plot(x16a, y16a, 'color', [0.29 0 0.51]);
hold on
plot(x17a, y17a, 'color', [0.56 0 1]);
hold on
plot(x, analytic1(x))
xlim([0, 0.025])
ylim([0, 0.2])
legend('N=10','N=20','N=40','N=80','N=160','N=320','N=640','Analytic')
title('Explicit Eulers Method For Function 1 With Changing N')

subplot(1,2,2)
plot(x11b, y11b, 'color', [1 0 0]);
hold on
plot(x12b, y12b, 'color', [1 0.5 0]);
hold on
plot(x13b, y13b, 'color', [1 1 0]);
hold on
plot(x14b, y14b, 'color', [0 1 0]);
hold on
plot(x15b, y15b, 'color', [0 0 1]);
hold on
plot(x16b, y16b, 'color', [0.29 0 0.51]);
hold on
plot(x17b, y17b, 'color', [0.56 0 1]);
hold on
plot(x, analytic2(x))
 xlim([0, 1])
 ylim([0, 1])
legend('N=10','N=20','N=40','N=80','N=160','N=320','N=640','Analytic', 'location','northwest')
title('Explicit Eulers Method For Function 2 With Changing N')

%part 1b
error11a = zeros(1, length(N(1)));
error21a = zeros(1, length(N(2)));
error31a = zeros(1, length(N(3)));
error41a = zeros(1, length(N(4)));
error51a = zeros(1, length(N(5)));
error61a = zeros(1, length(N(6)));
error71a = zeros(1, length(N(7)));
error11b = zeros(1, length(N(1)));
error21b = zeros(1, length(N(2)));
error31b = zeros(1, length(N(3)));
error41b = zeros(1, length(N(4)));
error51b = zeros(1, length(N(5)));
error61b = zeros(1, length(N(6)));
error71b = zeros(1, length(N(7)));

for i=1:length(x11a)
    error11a(i) = abs((analytic1(x11a(i))-y11a(i)));
    error11b(i) = abs((analytic2(x11b(i))-y11b(i)));
end
for i=1:length(x12a)
    error21a(i) = abs((analytic1(x12a(i))-y12a(i)));
    error21b(i) = abs((analytic2(x12b(i))-y12b(i)));
end
for i=1:length(x13a)
    error31a(i) = abs((analytic1(x13a(i))-y13a(i)));
    error31b(i) = abs((analytic2(x13b(i))-y13b(i)));
end
for i=1:length(x14a)
    error41a(i) = abs((analytic1(x14a(i))-y14a(i)));
    error41b(i) = abs((analytic2(x14b(i))-y14b(i)));
end
for i=1:length(x15a)
    error51a(i) = abs((analytic1(x15a(i))-y15a(i)));
    error51b(i) = abs((analytic2(x15b(i))-y15b(i)));
end
for i=1:length(x16a)
    error61a(i) = abs((analytic1(x16a(i))-y16a(i)));
    error61b(i) = abs((analytic2(x16b(i))-y16b(i)));
end
for i=1:length(x17a)
    error71a(i) = abs((analytic1(x17a(i))-y17a(i)));
    error71b(i) = abs((analytic2(x17b(i))-y17b(i)));
end
figure(2);clf
subplot(1,2,1)
plot(x11a, error11a, 'color', [1 0 0])
hold on
plot(x12a, error21a, 'color', [1 0.5 0]);
hold on
plot(x13a, error31a, 'color', [1 1 0]);
hold on
plot(x14a, error41a, 'color', [0 1 0]);
hold on
plot(x15a, error51a, 'color', [0 0 1]);
hold on
plot(x16a, error61a, 'color', [0.29 0 0.51]);
hold on
plot(x17a, error71a, 'color', [0.56 0 1]);
xlim([0, .2])
ylim([0, 1.2])
legend('N=10','N=20','N=40','N=80','N=160','N=320','N=640','location','northeast')
title('Explicit Eulers Method Error For Function 1 With Changing N')

subplot(1,2,2)
plot(x11b, error11b, 'color', [1 0 0])
hold on
plot(x12b, error21b, 'color', [1 0.5 0]);
hold on
plot(x13b, error31b, 'color', [1 1 0]);
hold on
plot(x14b, error41b, 'color', [0 1 0]);
hold on
plot(x15b, error51b, 'color', [0 0 1]);
hold on
plot(x16b, error61b, 'color', [0.29 0 0.51]);
hold on
plot(x17b, error71b, 'color', [0.56 0 1]);
legend('N=10','N=20','N=40','N=80','N=160','N=320','N=640','location','northwest')
title('Explicit Eulers Method Error For Function 2 With Changing N')

%Part 2a
x21a = x17a; y21a = y17a;
x21b = x17b; y21b = y17b;
[x22a, y22a] = euler2(N(7),a, b1,.2,F1,dF1);
[x22b, y22b] = euler2(N(7),a, b2,.2,F2,dF2);
[x23a, y23a] = RK2(fun1,N(7),a, b1,.2);
[x23b, y23b] = RK2(fun2,N(7),a, b2,.2);
[x24a, y24a] = RK4(fun1,N(7),a, b1,.2);
[x24b, y24b] = RK4(fun2,N(7),a, b2,.2);
[x25a, y25a] = AB4(fun1,N(7),a, b1,.2);
[x25b, y25b] = AB4(fun2,N(7),a, b2,.2);
[x26a, y26a] = euler2(N(7),a, b1,.2,F1,dF1);
[x26b, y26b] = euler2(N(7),a, b2,.2,F2,dF2);

figure(3);clf
subplot(1,2,1)
plot(x21a, y21a, 'color', [1 0 0])
hold on
plot(x22a, y22a, 'color', [1 0.5 0]);
hold on
plot(x23a, y23a, 'color', [1 1 0]);
hold on
plot(x24a, y24a, 'color', [0 1 0]);
hold on
plot(x25a, y25a, 'color', [0 0 1]);
hold on
plot(x26a, y26a, 'color', [0.29 0 0.51], 'LineStyle', '--');
hold on
plot(x, analytic1(x))
xlim([0, 0.025])
ylim([0, 0.2])
legend('Eulers','imp.Eulers','RK2','RK4','AB4','AM4', 'Analytic')
title('Each Numerical Method for Function 1, N=640')

subplot(1,2,2)
plot(x21b, y21b, 'color', [1 0 0])
hold on
plot(x22b, y22b, 'color', [1 0.5 0]);
hold on
plot(x23b, y23b, 'color', [1 1 0]);
hold on
plot(x24b, y24b, 'color', [0 1 0]);
hold on
plot(x25b, y25b, 'color', [0 0 1]);
hold on
plot(x26b, y26b, 'color', [0.29 0 0.51]);
hold on
plot(x, analytic2(x))
xlim([0, 1])
ylim([0, 1])
legend('Eulers','imp.Eulers','RK2','RK4','AB4','AM4','Analytic','location','northwest')
title('Each Numerical Method for Function 2, N=640')

%part 2b
error1a = zeros(1, length(N(7)));
error2a = zeros(1, length(N(7)));
error3a = zeros(1, length(N(7)));
error4a = zeros(1, length(N(7)));
error5a = zeros(1, length(N(7)));
error6a = zeros(1, length(N(7)));
error1b = zeros(1, length(N(7)));
error2b = zeros(1, length(N(7)));
error3b = zeros(1, length(N(7)));
error4b = zeros(1, length(N(7)));
error5b = zeros(1, length(N(7)));
error6b = zeros(1, length(N(7)));

for i=1:length(x21b)
    error1a(i) = abs((analytic1(x21a(i))-y21a(i)));
    error2a(i) = abs((analytic1(x22a(i))-y22a(i)));
    error3a(i) = abs((analytic1(x23a(i))-y23a(i)));
    error4a(i) = abs((analytic1(x24a(i))-y24a(i)));
    error5a(i) = abs((analytic1(x25a(i))-y25a(i)));
    error6a(i) = abs((analytic1(x26a(i))-y26a(i)));
    error1b(i) = abs((analytic2(x21b(i))-y21b(i)));
    error2b(i) = abs((analytic2(x22b(i))-y22b(i)));
    error3b(i) = abs((analytic2(x23b(i))-y23b(i)));
    error4b(i) = abs((analytic2(x24b(i))-y24b(i)));
    error5b(i) = abs((analytic2(x25b(i))-y25b(i)));
    error6b(i) = abs((analytic2(x26b(i))-y26b(i)));
end

figure(4);clf
subplot(1,2,1)
plot(x21a, error1a, 'color', [1 0 0])
hold on
plot(x22a, error2a, 'color', [1 0.5 0]);
hold on
plot(x23a, error3a, 'color', [1 1 0]);
hold on
plot(x24a, error4a, 'color', [0 1 0]);
hold on
plot(x25a, error5a, 'color', [0 0 1]);
hold on
plot(x26a, error6a, 'color', [0.29 0 0.51], 'LineStyle', '--');
hold on
xlim([0, .03])
ylim([0, 5e-3])
legend('Eulers','imp.Eulers','RK2','RK4','AB4','AM4')
title('Every Error for Function 1, N=640')

subplot(1,2,2)
plot(x21b, error1b, 'color', [1 0 0])
hold on
plot(x22b, error2b, 'color', [1 0.5 0]);
hold on
plot(x23b, error3b, 'color', [1 1 0]);
hold on
plot(x24b, error4b, 'color', [0 1 0]);
hold on
plot(x25b, error5b, 'color', [0 0 1]);
hold on
plot(x26b, error6b, 'color', [0.29 0 0.51]);
hold on
legend('Eulers','imp.Eulers','RK2','RK4','AB4','AM4','location','northwest')
title('Every Error for Function 2, N=640')
xlim([0, 1])

%Sorry my code is so long and inneficient, I did not feel like trying to
%loop all this in an elegant manor. That right was reserved for the script
%files. Hope your PC is as good as mine is :)