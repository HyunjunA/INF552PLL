function linearregression
data = load("linear-regression.txt");
D = data(:,1:2);
D1 = D(:,1);
D2 = D(:,2);
[N,d] = size(D);
Y = data(:,3);
D = [ones(N,1),D];
D = D';

TEMP1=D*D';
TEMP2=TEMP1\D;
W=TEMP2*Y;

scatter3(D1, D2, Y,'.')
hold on


[d1,d2] = meshgrid(0:0.01:1);
d3 = W(1)+W(2)*d1+W(3)*d2;
mesh(d1,d2,d3)
hold off

end

