function alertCount = triageMonitor(vitalsMatrix)

[numPatients, ~, numSteps] = size(vitalsMatrix);
alertCount = 0;

    for p = 1:numPatients
        for t = 1:numSteps
            hr = vitalsMatrix(p, 1, t);
            sbp = vitalsMatrix(p, 2, t);
            temp = vitalsMatrix(p, 3, t);

            if (hr < 50 || hr > 120) || (sbp < 90 || sbp > 140) || (temp < 36.0 || temp > 38.5)
                alertCount = alertCount + 1;
                fprintf('ALERT: Patient %d at Time %d | HR: %d, SBP: %d, Temp: %.1f\n', p, t, hr, sbp, temp);
            end
        end
    end
end
