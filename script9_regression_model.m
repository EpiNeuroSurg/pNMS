variableLabels = {'ipsi_hippo','AI_hippo','ipsi_amyg','AI_amyg','ipsi_hippo_amyg','ipsi_AI_hippo_amyg','TIV'};
x = data(:,5：11);
y = data(:,3);

% Initialize parameters
numIterations = 10;
numFolds = 5;
numSamples = size(x, 1);
numFeatures = size(x, 2);

% Initialize arrays for storing results
allPreds = zeros(numSamples, numIterations);
allPredCI_Lower = zeros(numSamples, numIterations);
allPredCI_Upper = zeros(numSamples, numIterations);
allShapleyValues = zeros(numFeatures, numIterations);

for iter = 1:numIterations
    cv = cvpartition(length(y), 'KFold', numFolds);
    yPredCV = zeros(numSamples, 1);
    yPredCI = zeros(numSamples, 2);

    % Inner loop: K-fold cross-validation
    for k = 1:numFolds
        trainIdx = training(cv, k); % Get training set indices
        testIdx = test(cv, k); % Get test set indices

        % Train GAM model
        gamModel = fitrgam(x(trainIdx, :), y(trainIdx));
        
        % Make predictions
        yPred = predict(gamModel, x(testIdx, :));
        yPredCV(testIdx) = yPred;
        
        % Compute prediction interval
        residuals = y(testIdx) - yPred;
        stdResiduals = std(residuals);
        yPredCI(testIdx, :) = [yPred - 1.96 * stdResiduals, yPred + 1.96 * stdResiduals];
        
        explainer = shapley(gamModel,x);
        queryPoint = x(1,:);
        explainer = fit(explainer,queryPoint);
        explainer.ShapleyValues;
        a = table2array(explainer.ShapleyValues(:,2));
        
        
%         figure;
%         for i = 1:5
%             [pd, x] = partialDependence(gamModel, i);
%             subplot(2, 3, i);
%             plot(x, pd);
%             hold on
%             title(['Variable ' num2str(i)]);
%             xlabel(['Predictor ' num2str(i)]);
%             ylabel('Partial Dependence');
%         end
% figure
% plotPartialDependence(gamModel,1)
        
        
    end

    % Store results from each iteration
    allPreds(:, iter) = yPredCV;
    allPredCI_Lower(:, iter) = yPredCI(:, 1);
    allPredCI_Upper(:, iter) = yPredCI(:, 2);
    allShapleyValues(:, iter) = a(:, 1);  % Average Shapley values for each feature
end

% Compute mean values across iterations
meanPreds = mean(allPreds, 2);
meanPredCI_Lower = mean(allPredCI_Lower, 2);
meanPredCI_Upper = mean(allPredCI_Upper, 2);
meanShapleyValues = mean(allShapleyValues, 2);

figure;barh(meanShapleyValues)
ax = gca;
ax.YDir = 'reverse';

figure;plot(explainer)

% Plot actual vs. predicted values with 95% prediction intervals
[~, sortIndex] = sort(y);
figure;
hold on;
plot(1:length(y), y(sortIndex), 'bo-', 'DisplayName', 'Actual');
plot(1:length(y), meanPreds(sortIndex), 'rx-', 'DisplayName', 'Predicted');
plot(1:length(y), meanPredCI_Lower(sortIndex, 1), 'g--', 'DisplayName', '95% Prediction Interval Lower');
plot(1:length(y), meanPredCI_Upper(sortIndex, 1), 'g--', 'DisplayName', '95% Prediction Interval Upper');
xlabel('Sample');
ylabel('Value');
legend('Location', 'best');
hold off;


% Compute Pearson correlation coefficient and p-value
[r, pValue] = corr(yPredCV, y);
disp(['Pearson Correlation Coefficient: ', num2str(r)]);
disp(['p-value: ', num2str(pValue)]);
