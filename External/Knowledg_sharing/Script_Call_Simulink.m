%% Script to show the call of simulink model from console
% Parameters are varying from delaration from script and constinue updating
% in each call

% Step 1. Design a Simulink Model
b = 2;
for i= 1: 10
    sim_test(i) = sim('Model_Test', i);
end