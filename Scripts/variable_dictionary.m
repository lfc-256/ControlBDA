%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   This scripts provides a variable dictionary with
%   values of control parameters, vehicle parameters 
%   and trailer parameters that are used in the simulation.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Control parameters
h = 0.0;    %sampling period
Kp = 0.0;   %Proportional gain
Ki = 0.0;   %integral gain   
Kd = 0.0;   %differential gain  

% Vehicle parameters
L1=2.984;   %Length of the car (measured between the two wheel axles)
L12=1.476;  %Length between the rear axle and the trailer contact point (m)
v=5.0;      %Speed  (m/s)
Df=1;       %Angle between the front wheel and the car  (rad)

% Trailer parameters
L2=1.0;     %Length of the trailer (m)