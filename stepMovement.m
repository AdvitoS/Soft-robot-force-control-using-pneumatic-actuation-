% Step movement

%% Create connection and set 0 config.
dev = openSup('COM6')
setSup(0,0,0,0,0,0,0,0,800,800,800,800,800,800,dev);

s = tf('s');
numerator = (0.4856*s^2 + 19.43*s + 175);
denominator = (s^2 + 25.15*s + 175);
G = minreal(tf(numerator,denominator))

forceArray = [];
timeArray = [];

pause(5);

for i=0:200
    if i > 80
        V4 = 180;
        V5 = 180;
        V6 = 180;
    else
        V4 = 0;
        V5 = 0;
        V6 = 0;
    end
    setSup(0,0,0,V4,V5,V6,0,0,800,800,800,800,800,800,dev);
    data=fscanf(dev,'%d');
    fprintf('%d\n', data);
    forceArray = [forceArray, data];
    timeArray = [timeArray, i];
    pause(0.025)
end

% Set zero config
setSup(0,0,0,0,0,0,0,0,800,800,800,800,800,800,dev);

figure;
plot(timeArray, forceArray);
xlabel('Time');
ylabel('Analog Reading');
title('Force over time');

fclose(dev);
