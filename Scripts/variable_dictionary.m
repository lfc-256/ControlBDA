%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% variable_dictionary.m
%   This script provide a variable dictionary with
%   values of control parameters, vehicle parameters 
%   and trailer parameters that are loaded and used in the simulation (Simulink).
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% Clean environment
clear all; 
close all;
%% Settings driving conditions
v=-3.0;      		%Speed  (m/s) approximately 10km/H
Df=25.0;       		%Steering wheel in degrees
manuever = 3.0;		%kind of manuever that make the car (1-Straight,2-Circle,3-Winding,4-Return to line)

%% Vehicle parameters Volvo XC90 2019 late
L1=2.984;   		%Length of the car (measured between the two wheel axles) (m)
L12=1.476;  		%Length between the rear axle and the trailer contact point (m)
length_c=4.950;     %Length of the car in meters
width_c=1.923;      %Width of the car in meters

%% Trailer parameters
L2=2.159;           %Length hitch to trailer axle in meters
w=1.270;            %Width of the trailer in meters
g=1.117;            %Tongue length in meters
length_t=3.086;     %Width of the trailer in meters in meters
%% Optimal Control
k=-2.002;
c11=v/L1; 
c22=v/L2; 
c33=v*L12/(L1*L2);
%% PID controller
kp=-3.184; 
ki=-2.363;
%% Free Model controller
alfa1=1.0;
BW=50.0;  
%% JKK angle
jkk=(90-atan((w/2)/g))*pi/180;  %Equation to calculate JKK angle
tolerance=0.85;                  