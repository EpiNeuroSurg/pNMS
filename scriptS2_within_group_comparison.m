data = temp_temp(:,1);
groups = temp_temp(:,2);

% 创建一个表格，将数据和分组信息结合在一起
T = table(data, groups);

% 根据分组计算每个组的均值
groupMeans = varfun(@mean, T, 'InputVariables', 'data', 'GroupingVariables', 'groups');

% 显示每个分组的均值
disp(groupMeans);

% 如果需要绘制每个分组的均值条形图
figure;
bar(groupMeans.mean_data);
set(gca, 'XTickLabel', groupMeans.groups);
xlabel('Groups');

[h,p,ci,stats] = ttest2(data,groups)