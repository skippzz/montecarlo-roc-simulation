function [healthy, patient] = generate_population(n_samples, mu_h, sigma_h, mu_p, sigma_p)
%GENERATE_POPULATION Create healthy and patient samples
%   n_samples: number of samples per group
%   mu_h, sigma_h: mean and std for healthy
%   mu_p, sigma_p: mean and std for patient

healthy = mu_h + sigma_h .* randn(n_samples, 1);
patient = mu_p + sigma_p .* randn(n_samples, 1);
end
