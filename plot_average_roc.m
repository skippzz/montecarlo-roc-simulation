function plot_average_roc(all_fpr, all_tpr, thresholds)
%PLOT_AVERAGE_ROC Plot mean ROC curve with ±1 SD shading
%   all_fpr, all_tpr: matrices n_thresh x N_simulations
%   thresholds: vector of threshold values

mean_fpr = mean(all_fpr, 2);
mean_tpr = mean(all_tpr, 2);
std_tpr = std(all_tpr, 0, 2);

figure; hold on;
fill([mean_fpr; flipud(mean_fpr)], ...
     [mean_tpr+std_tpr; flipud(mean_tpr-std_tpr)], ...
     'b', 'FaceAlpha', 0.2, 'EdgeColor', 'none');
plot(mean_fpr, mean_tpr, 'b-', 'LineWidth', 2);
xlabel('False Positive Rate');
ylabel('True Positive Rate');
title('Average ROC Curve with ±1 SD');
grid on;
end
