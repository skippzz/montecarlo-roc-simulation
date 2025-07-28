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

General Idea Was:

% Parameter setup
s = 2; m = 5;       % Std dev and mean for healthy group
s1 = 2; m1 = 7;     % Std dev and mean for patient group

% Generate random samples: 1000 individuals × 100 runs
h = s .* randn(1000,100) + m;   % Healthy population
p = s1 .* randn(1000,100) + m1; % Patient population

% Prepare for ROC computation
num_points = ((m1 + s1) - (m - s)) / 0.1 + 1;
h_fp = zeros(num_points,1); % False Positives per threshold
p_tp = zeros(num_points,1); % True Positives per threshold

% Count false positives over thresholds
idx = 1;
for thr = (m - s):0.1:(m1 + s1)
    h_fp(idx) = sum(h(:) > thr);
    idx = idx + 1;
end

% Count true positives over thresholds
i = 1;
for thr = (m - s):0.1:(m1 + s1)
    p_tp(i) = sum(p(:) > thr);
    i = i + 1;
end

% Plot ROC curve (raw counts)
plot(h_fp, p_tp);
xlabel('False Positives');
ylabel('True Positives');
title('ROC Curve from Raw Counts');

Explanation

Parameter setup: Define each group's mean and variability.

Data generation: Create matrices of normally distributed samples.

Preallocation: Allocate arrays for counting results.

FP/TP counting: Loop through thresholds to record exceedances.

Plot: Visualize raw counts as an ROC curve.
