%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   variable_dictionary.m
%   This script provide a variable dictionary with
%   values of control parameters, vehicle parameters 
%   and trailer parameters that are loaded and used in the simulation (Simulink).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Manuever number
clear; 
close; 
clc;
manuever = 4;		%kind of manuever that make the car 1,2,3,4
%% Control parameters
h = 0.001;    		%sampling period
Kp = 0.0;   		%Proportional gain
Ki = 0.0;   		%integral gain   
Kd = 0.0;   		%differential gain  

%% Vehicle parameters
L1=2.984;   		%Length of the car (measured between the two wheel axles) (m)
L12=1.476;  		%Length between the rear axle and the trailer contact point (m)
v=-3.0;      		%Speed  (m/s) approximately 10km/H
Df=0;       		%Steering wheel in degrees
              	%speed (m/s)
%% Trailer parameters
L2=1.8288;     		%Length of the trailer (m)
w=2.4384;           %converter to meters
g=0.762;            %converter to meters
%% State Feedback
k=-2;
c11=v/L1; 
c22=v/L2; 
c33=v*L12/(L1*L2);
%% PID controller
kp=2; 
ki=3;
%% Free Model controller
alfa1=1;
BW=50;
%% Tolerance
tolerance=0.8   % 0< tolerance <1