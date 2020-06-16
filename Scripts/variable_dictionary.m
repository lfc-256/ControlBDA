%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   variable_dictionary.m
%   This script provide a variable dictionary with
%   values of control parameters, vehicle parameters 
%   and trailer parameters that are loaded and used in the simulation (Simulink).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Manuever number
manue = 0;		%kind of manuever that make the car

%% Control parameters
h = 0.0;    		%sampling period
Kp = 0.0;   		%Proportional gain
Ki = 0.0;   		%integral gain   
Kd = 0.0;   		%differential gain  

%% Vehicle parameters
L1=2.984;   		%Length of the car (measured between the two wheel axles) (m)
L12=1.476;  		%Length between the rear axle and the trailer contact point (m)
v=5.0;      		%Speed  (m/s)
Df=1;       		%Angle between the front wheel and the car  (rad)
m1= 2800;        	%mass of the vehicle (kg)
Iz1= m1*L^2/12;         %yaw moments of inertia of the vehicle (kg*m)
a1=1.587754;       	%distance of the vehicle front to the center of mass (m)
b1=1.396746;       	%distance of the vehicle rear to the center of mass  (m)
e1=L12;        		%distance of the rear axle of the vehicle to the hitch point (m)
c1=b1+e1;      		%distance of the hitch point to the vehicle center of mass (m)
Cyf=1000;           	%cornering stiffness values for the tires of the vehicle’s front axle
Cyr=1000;           	%cornering stiffness values for the tires of the vehicle’s rear axle
vx=v;               	%speed (m/s)

%% Trailer parameters
L2=1.8288;     		%Length of the trailer (m)
m2=205;           	%mass of the  vehicle  (kg)
Iz2=m2*L2^2/12;         %yaw moments of inertia of the trailer (kg*m)
a2=L2/2;        	%distance of the trailer center of mass to the hitch point (m)
b2=L2/2;        	%distance of the trailer center of mass to the trailer axle (m)
l2=a2+b2;       	%distance of the trailer axle to the hitch point (m)
Cyt=1000;           	%cornering stiffness values for the tires of the trailer axle

