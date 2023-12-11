% values with alpha = 0.036
e_i_old = 0;
e_f_old = 0;
KP = 211.7;
KI = 1971.9;
KD = 11.45;
alpha = 0.07053;
beta = 0.008763;
alpha_G = 0.7575;
beta_G = 0.2045;
Ts = 0.025;
Input_op = 10;
Analog_op = 600;
state_old = 650-Analog_op;
state = state_old;
timeArray = []
forceArray = []
sineArray = []

% Define parameters
period = 500; % Period of the sine wave in seconds
amplitude_max = 750; % Maximum amplitude
amplitude_min = 680; % Minimum amplitude      

desired_force = 600-Analog_op;

for i=0:1000
    timeArray = [timeArray, i];
    sine = (amplitude_max - amplitude_min) / 2 * sin(2 * pi / period * i) + (amplitude_max + amplitude_min) / 2;
    sineArray = [sineArray, sine-Analog_op];
    desired_force = sine-Analog_op;
    %desired_force = 700-Analog_op;

    measured = state;

    e_k = desired_force - measured;

    e_f = alpha*e_f_old + beta*e_k;

    e_f_old = e_f;

    % Accumulating error

    e_i = e_i_old + e_f;

    e_i_old = e_i;

    % Controller action

    V_k = KP*e_f + KI*e_i*Ts + KD*e_f*(1/Ts);

    V = V_k; %+Input_op for full range
    % VInput = analog2Input(V)
    state = alpha_G*state_old+beta_G*V;
    state_old = state;

    forceArray = [forceArray, state];
    %disp(['data: ' num2str(data(i+1))])
    disp(['V: ' V])
    disp(['state: ' state])

    pause(0.025)
end

figure;
plot(timeArray, forceArray);
xlabel('Iteration number');
ylabel('Analog Reading');
title('Force over time');
hold on
plot(timeArray,sineArray);
hold off

