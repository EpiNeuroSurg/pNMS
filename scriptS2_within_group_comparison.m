% Two-sample t-test and group-wise mean visualization

% Extract data and group labels
data = temp_temp(:,1);   % Dependent variable (e.g., feature value)
groups = temp_temp(:,2); % Binary group label (e.g., 0 = NSF, 1 = SF)

% Create a table to combine data and group information
T = table(data, groups);

% Compute the mean of each group
groupMeans = varfun(@mean, T, 'InputVariables', 'data', 'GroupingVariables', 'groups');

% Display the mean of each group
disp(groupMeans);

% Optional: plot bar chart of group means
figure;
bar(groupMeans.mean_data);
set(gca, 'XTickLabel', groupMeans.groups);
xlabel('Groups');

[h,p,ci,stats] = ttest2(data,groups)
