clc;
clear;
close all;

% Creating Sample Dataset
vitalsData = zeros(2, 3, 5);

% Patient 1(Normal)
vitalsData(1, 1, :) = [90, 115, 57, 79, 109]; % hr normal
vitalsData(1, 2, :) = [115, 119, 117, 116, 115]; % sbp normal
vitalsData(1, 3, :) = [36.6, 36.9, 36.4, 37.0, 37.1]; % temp normal

% Patient 2(Abnormal)
vitalsData(2, 1, :) = [69, 32, 129, 78, 80]; % hr ab at 2,3
vitalsData(2, 2, :) = [121, 88, 152, 110, 118]; % sbp ab at 2,3
vitalsData(2, 3, :) = [40.9, 38.4, 36.0, 37.2, 34.0]; % temp ab at 1,5

% Calling Function
totalAlerts = triageMonitor(vitalsData);
fprintf('\n Total Critical Incidents Logged: %d\n', totalAlerts);

% Visualization
time = 1:5;
figure('color','b');

% Heart Rate Quadrant
subplot(3, 1, 1);
plot(time, squeeze(vitalsData(1, 1, :)), '-bo', 'DisplayName', 'Patient 1'); hold on;
plot(time, squeeze(vitalsData(2, 1, :)), '-rs', 'DisplayName', 'Patient 2');
yline([50, 120], ':g', 'Safe Zone');
ylabel('HR (bpm)'); title('Heart Rate'); grid on; legend;

% Systolic Blood Pressure Quadrant
subplot(3, 1, 2);
plot(time, squeeze(vitalsData(1, 2, :)), '-bo', 'DisplayName', 'Patient 1'); hold on;
plot(time, squeeze(vitalsData(2, 2, :)), '-rs', 'DisplayName', 'Patient 2');
yline([90, 140], ':g', 'Safe Zone');
ylabel('SBP (mmHg)'); title('Systolic Blood Pressure'); grid on;

% Body Temperature Quadrant
subplot(3, 1, 3);
plot(time, squeeze(vitalsData(1, 3, :)), '-bo', 'DisplayName', 'Patient 1'); hold on;
plot(time, squeeze(vitalsData(2, 3, :)), '-rs', 'DisplayName', 'Patient 2');
yline([36.0, 38.5], ':g', 'Safe Zone');
xlabel('Time Interval'); ylabel('Temp (C)'); title('Body Temperature'); grid on;
