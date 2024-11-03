variableLabels = {'ipsi_hippo','AI_hippo','ipsi_amyg','AI_amyg','ipsi_hippo_amyg','ipsi_AI_hippo_amyg','TIV'};
x = data(:,1);
y = data(:,3);

%% 初始化参数
numIterations = 10;
numFolds = 5;
numSamples = size(x, 1);
numFeatures = size(x, 2);

% 初始化结果存储
allPreds = zeros(numSamples, numIterations);
allPredCI_Lower = zeros(numSamples, numIterations);
allPredCI_Upper = zeros(numSamples, numIterations);
allShapleyValues = zeros(numFeatures, numIterations);

for iter = 1:numIterations
    cv = cvpartition(length(y), 'KFold', numFolds);
    yPredCV = zeros(numSamples, 1);
    yPredCI = zeros(numSamples, 2);

    % 内层循环：K折交叉验证
    for k = 1:numFolds
        trainIdx = training(cv, k); % 获取训练集索引
        testIdx = test(cv, k); % 获取测试集索引

        % 训练GAM模型
        gamModel = fitrgam(x(trainIdx, :), y(trainIdx));
        
        % 进行预测
        yPred = predict(gamModel, x(testIdx, :));
        yPredCV(testIdx) = yPred;
        
        % 计算预测区间
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

    % 存储每次迭代的结果
    allPreds(:, iter) = yPredCV;
    allPredCI_Lower(:, iter) = yPredCI(:, 1);
    allPredCI_Upper(:, iter) = yPredCI(:, 2);
    allShapleyValues(:, iter) = a(:, 1);  % 平均每个特征的Shapley值
end

% 计算均值
meanPreds = mean(allPreds, 2);
meanPredCI_Lower = mean(allPredCI_Lower, 2);
meanPredCI_Upper = mean(allPredCI_Upper, 2);
meanShapleyValues = mean(allShapleyValues, 2);

figure;barh(meanShapleyValues)
ax = gca;
ax.YDir = 'reverse';

figure;plot(explainer)

% 绘制实际值和预测值以及 95% 预测区间限制
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


% 计算 Pearson 相关系数作为 p 值
[r, pValue] = corr(yPredCV, y);
disp(['Pearson Correlation Coefficient: ', num2str(r)]);
disp(['p-value: ', num2str(pValue)]);
