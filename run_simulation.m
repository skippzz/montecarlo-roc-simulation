% RUN_SIMULATION Master script to perform all steps
clear; clc;

% Parameters
N = 100;               % number of simulations
n_samples = 1000;      % samples per group
mu_h = 0; sigma_h = 1; % healthy distribution
mu_p = 1; sigma_p = 1; % patient distribution
thresholds = linspace(-3, 5, 100);

% Preallocate
all_fpr = zeros(numel(thresholds), N);
all_tpr = zeros(numel(thresholds), N);
auc_vals = zeros(N,1);

for k = 1:N
    [h, p] = generate_population(n_samples, mu_h, sigma_h, mu_p, sigma_p);
    [fpr, tpr, auc] = compute_roc(h, p, thresholds);
    all_fpr(:,k) = fpr;
    all_tpr(:,k) = tpr;
    auc_vals(k) = auc;
end

% Plot
plot_average_roc(all_fpr, all_tpr, thresholds);
fprintf('Mean AUC: %.3f ± %.3f
', mean(auc_vals), std(auc_vals));
