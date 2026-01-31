% Main script for MAE159 Project WrightCamryn

% Add modules folder and subfolders to the MATLAB path
addpath(genpath('modules'));

% Read metadata.json
if exist('metadata.json', 'file')
    metadata = jsondecode(fileread('metadata.json'));
    disp('Metadata loaded successfully:');
    disp(metadata);
else
    error('metadata.json not found.');
end

% Example usage of calculate_drag (optional but good for testing)
% CL = 0.5;
% AR = 9;
% e = 0.85;
% CD = calculate_drag(CL, AR, e);
% fprintf('Calculated CD for CL=%.2f, AR=%.2f, e=%.2f: %.5f\n', CL, AR, e, CD);
