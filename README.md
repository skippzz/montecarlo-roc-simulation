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
## MATLAB Original Snippet Explained

Here’s the core loop, cleanly fenced so GitHub will render it as code:

```matlab
% Parameter setup
s   = 2;  % Std dev for healthy group
m   = 5;  % Mean for healthy group
s1  = 2;  % Std dev for patient group
m1  = 7;  % Mean for patient group

% Generate random samples
h = s  .* randn(1000, 100) + m;
p = s1 .* randn(1000, 100) + m1;

% Define thresholds
thresholds = (m - s) : 0.1 : (m1 + s1);
num_pts    = numel(thresholds);
h_fp       = zeros(num_pts, 1);
p_tp       = zeros(num_pts, 1);

% Count FPs & TPs
for idx = 1:num_pts
  thr       = thresholds(idx);
  h_fp(idx) = sum(h(:) > thr);
  p_tp(idx) = sum(p(:) > thr);
end

% Plot ROC curve
figure;
plot(h_fp, p_tp, 'LineWidth', 2);
xlabel('False Positives');
ylabel('True Positives');
title('ROC Curve from Raw Counts');
grid on;


Explanation

Parameter setup: Define each group's mean and variability.

Data generation: Create matrices of normally distributed samples.

Preallocation: Allocate arrays for counting results.

FP/TP counting: Loop through thresholds to record exceedances.

Plot: Visualize raw counts as an ROC curve.
