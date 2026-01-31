clear; clc;

% Main script for MAE159 Project
addpath(genpath('modules'));

metadata = jsondecode(fileread('metadata.json'));
disp(metadata);

run('modules/drag/test_drag.m');
