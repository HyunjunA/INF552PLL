function logisticregression()
load 'classification.txt';

x1 = classification(:,1);
x2 = classification(:,2);
x3 = classification(:,3);
y =  classification(:,5);

X = classification(:,1:3);
[m,n] = size(X);

pos = find(y == 1);
neg = find(y == -1);
figure;
scatter3(x1(pos), x2(pos), x3(pos),'+')
hold on
scatter3(x1(neg), x2(neg), x3(neg),'.') 
hold on

X = [ones(m,1),X];
X = X';
y = y';
iteration = 7000;
alpha0 = 0.1;           % the larger the alpha is£¬the smaller the W value
W = zeros(1,n+1);       % W0,(W1,W2,W3)
% J = zeros(iteration,1);   %Cost function
 grad = zeros(1,1+n);
for i = 1 : iteration
    s = sum( W' .* X, 1);       %2000x1
    h = theta((-1) * y .* s);   %theta(s) = es/(1+es)
     
    grad = (1/m) * sum( ((-1 * y .* X) .* h),  2 );         %Gradient descent
    grad = grad';

    W = W - alpha0 * grad ;
    
end

[d1,d2] = meshgrid(0:0.01:1);
d3 = (W(1) + W(2) * d1 + W(3) * d2 )/((-1)*W(4));
mesh(d1,d2,d3);
title('Logistic Regression')
hold off;

%print paramaters W
fprintf('[Logistic Regression] Paramaters W is: ');W

end
%% Sigmoid Function

function h = theta(s)

h = exp(s)  ./ (1 + exp(s)); 

end

