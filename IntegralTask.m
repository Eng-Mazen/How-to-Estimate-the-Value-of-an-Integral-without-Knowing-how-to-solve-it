%% In this task we will discover how we can solve a hard-to-solve integeral using Monte Carlo

% Integral is: exp(-x^2 / 2) over the interval [a, b] where a = 1 and b=20
a = 1 ; b = 20;

% We can convert the integral to a series with very large sumption of the function values 
% "outputs of very large number of x-values applied in function" which must
% be not duplicated
noEpochs = input("Enter the no. Generated Numbers: ");
val_list = zeros([1,1000]);
sum = 0;
repeated = 0;
for epoch = 1:noEpochs
    x = 1 + (20 - 1) * rand();
     y = func(x);
    if ismember(y, val_list)
    repeated = repeated + 1;
    else
    val_list(epoch) = y;
    sum = sum + y;    
    end
end
estimated_val = (sum / noEpochs) * (b - a);
real_val = 0.3976897454233514; % Taking from "Integral Calculator" website
err = (abs(real_val - estimated_val)) * 100;
fprintf(['Integral Estimated Value = ' num2str(estimated_val) ' Number of Repeated Values = ' num2str(repeated)])
fprintf(['\nError Percentage = ' num2str(err) ' %'])
    
function y=func(x)
y = exp((-x^2) / 2);
end