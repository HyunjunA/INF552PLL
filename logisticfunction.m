function logisticfunction()

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

for i = 1:size(neg)
    y(neg(i)) = 0;
end


iteration = 7000;
w =glmfit(X,y,'binomial', 'link', 'logit');

[d1,d2] = meshgrid(0:0.01:1);
d3 = (w(1) + w(2) * d1 + w(3) * d2 )/((-1)*w(4));
mesh(d1,d2,d3);
title('Logistic Regression use Matlab Library');
hold off;

%print paramaters W
fprintf('[Logistic Regression] Paramaters W(use library) is: ');w

end