
function [payments, statuses] = simulate_loan_lifetime(monthly_payment)

% Create arrays to store outputs
payments = zeros(1, 12);

% repaying = 1, delinquency = 2, default = 3
statuses = zeros(1, 12);

% Everyone repays in the first month (MATLAB starts counting at 1)
payments(1) = monthly_payment;
statuses(1) = 1;

% Draw probabilities from uniform distribution 
rn = rand(1, 12);

% Simulate
for month=1:11
    if statuses(month) == 1     % presently repaying
        if rn(month) < .85     % with probability .85, continue to repay
            payments(month+1) = monthly_payment;
            statuses(month+1) = 1;
        elseif rn(month) < .95 % with probability .1, go into delinquency
            payments(month+1) = 0;
            statuses(month+1) = 2;
        else            % with probability .05, go into default
            payments(month+1) = 0;
            statuses(month+1) = 3;   
        end

    elseif statuses(month) == 2 % presently delinquent
        if rn(month) < .25     % with probability .25, return to repayment
            payments(month+1) = monthly_payment;
            statuses(month+1) = 1;
        elseif rn(month) < .85 % with probability .6, continue delinquency
            payments(month+1) = 0;
            statuses(month+1) = 2;
        else            % with probability .15, go into default
            payments(month+1) = 0;
            statuses(month+1) = 3;
        end
    
    else                        % presently default
        payments(month+1) = 0;
        statuses(month+1) = 3;
    end
    
end

end

