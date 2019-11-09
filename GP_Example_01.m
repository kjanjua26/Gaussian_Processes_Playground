%{
    This is the first implementation of Gaussian Process of random lines.
    Original Code: https://www.youtube.com/watch?v=clMbOOz6yR0
%}
kernel = 1;
switch kernel
    case 1; k = @(x,y) 1*x'*y;
    case 2; k = @(x,y) 1*min(x,y);
    case 3; k = @(x,y) exp(-100*(x-y)'*(x-y));
    case 4; k = @(x,y) exp(-1*sqrt((x-y)'*(x-y)));
    case 5; k = @(x,y) exp(-1*sin(5*pi*(x-y)));
end

x = (0:.005:1);
n = length(x);

% Constructing the covariance matrix
C = zeros(n,n);
for i = 1:n
    for j = 1:n
        C(i,j) = k(x(i), x(j));
    end
end
C
u = randn(n, 1);
[A,S,B] = svd(C);
z = A*sqrt(S)*u;

figure(2); hold on;
plot(x, z, '.-');
axis([0,1,-2,2]);
