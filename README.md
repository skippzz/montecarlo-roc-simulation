# montecarlo-roc-simulation
This repository contains code to simulate and analyze Receiver Operating Characteristic (ROC) curves for two normally distributed populations. The aim is to generate multiple populations, compute ROC curves, and plot their average with confidence intervals.

Getting Started

Clone the repository

git clone https://github.com/your-username/montecarlo-roc-simulation.git
cd montecarlo-roc-simulation

Requirements

GNU Octave 6.4+ or MATLAB R2021a+

No additional toolboxes required (uses core functions)

Run the simulation

% In MATLAB/Octave command window
run_simulation;

View results

Check the figures/ folder for the averaged ROC plot and AUC statistics.

General idea was the following

s = 2;      % Std dev for healthy group (controls variability)
m = 5;      % Mean for healthy group (baseline level)

s1 = 2;     % Std dev for patient group (controls variability)
m1 = 7;     % Mean for patient group (elevated level)

% Generate random samples: 1000 individuals × 100 runs
h = s .* randn(1000,100) + m;   % Healthy population matrix
p = s1 .* randn(1000,100) + m1; % Patient population matrix

% Preallocate arrays for counting positives across thresholds
num_points = ((m1 + s1) - (m - s)) / 0.1 + 1;
tp = zeros(num_points, 1); % True Positives per threshold
fp = zeros(num_points, 1); % False Positives per threshold

i = 1;
% Iterate threshold from (m - s) to (m1 + s1) in 0.1 steps
for tho = m - s : 0.1 : m1 + s1
    h_fp(i) = sum(h(:) > tho);  % Count healthy samples above threshold = FP
    i = i + 1;
end

clear tho;
j = 1;
for tho = m - s : 0.1 : m1 + s1
    p_tp(j) = sum(p(:) > tho);  % Count patient samples above threshold = TP
    j = j + 1;
end

% Plot FP on x-axis vs TP on y-axis to form the ROC curve
plot(h_fp, p_tp);
xlabel('False Positives');
ylabel('True Positives');
title('ROC Curve from Raw Counts');
