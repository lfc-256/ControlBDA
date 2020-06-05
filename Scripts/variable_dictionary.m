%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   variable_dictionary.m
%   This script provide a variable dictionary with
%   values of control parameters, vehicle parameters 
%   and trailer parameters that are loaded and used in the simulation (Simulink).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% No. Manuever
manue = 0;

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

%Vehicle parameters 2
m1= 0;        %mass of the vehicle
Iz1= 0;          %yaw moments of inertia of the vehicle
a1=L1/2;       %distance of the vehicle front to the center of mass
b1=L1/2;       %distance of the vehicle rear to the center of mass
e1=L12;        %distance of the rear axle of the vehicle to the hitch point 
c1=b1+e1;      %distance of the hitch point to the vehicle center of mass 


% Trailer parameters
L2=1.0;     %Length of the trailer (m)
m2=  0;           %mass of the  vehicle
Iz2=   0;         %yaw moments of inertia of the trailer
a2=L2/2;        %distance of the trailer center of mass to the hitch point
b2=L2/2;        %distance of the trailer center of mass to the trailer axle
l2=a2+b2;       %distance of the trailer axle to the hitch point

