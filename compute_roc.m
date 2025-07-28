function [fpr, tpr, auc] = compute_roc(healthy, patient, thresholds)
%COMPUTE_ROC Compute ROC curve and AUC for one population
%   healthy, patient: sample vectors
%   thresholds: vector of threshold values

n_h = numel(healthy);
n_p = numel(patient);
n_thresh = numel(thresholds);
tpr = zeros(n_thresh,1);
fpr = zeros(n_thresh,1);

for i = 1:n_thresh
    thr = thresholds(i);
    fp = sum(healthy > thr);
    tp = sum(patient > thr);
    fpr(i) = fp / n_h;
    tpr(i) = tp / n_p;
end

auc = trapz(fpr, tpr);
end
