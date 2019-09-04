%% Perceptron algorithms and Pocket algorithms Plot
%Part1-1 

Perceptron;


%Part1-2
Pocket(5);

hold on
hold off
%comparing
%%compare linearly seperable data-Pocekt(4) with unseperable data-Pocket(5)
Pocket(4);

%% Logistic Regression
logisticregression;


%% Linear Regression
figure;linearregression;



%% Part2
%Compare my Perceptron code with matlab linear classification function call
%fitclinear
eachData = importdata('classification.txt');

label=eachData(:,4);
    
eachData(:,5)=[];
eachData(:,4)=1;

Mdl = fitclinear(eachData,label)
 


% Logistic Regression use Matlab Library
logisticfunction;


% Linear Regression use Matlab Library
figure;linearregression2;
