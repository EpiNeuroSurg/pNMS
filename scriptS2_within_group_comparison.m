data = temp_temp(:,1);
groups = temp_temp(:,2);

% Create a table to combine data and group information
T = table(data, groups);

% Compute the mean of each group
groupMeans = varfun(@mean, T, 'InputVariables', 'data', 'GroupingVariables', 'groups');

% Display the mean of each group
disp(groupMeans);

% Plot bar chart of group means if needed
figure;
bar(groupMeans.mean_data);
set(gca, 'XTickLabel', groupMeans.groups);
xlabel('Groups');

[h,p,ci,stats] = ttest2(data,groups)
