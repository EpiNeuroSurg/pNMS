% This script computes the number of non-zero voxels (i.e., volume in voxels)
% in the surgical cavity mask (surg_roi.nii) for each subject.
% Assumes that each subject folder starts with 'litt'

clear;clc;
pathfileformation = dir('litt*');
pathnumber = numel(pathfileformation);

surgery_number = []; % Initialize array to store voxel counts per subject
for foldnumber = 1:pathnumber
    path = fullfile(pathfileformation(foldnumber).folder, pathfileformation(foldnumber).name);
    cd(path);
    
    surgical_cavity_file = 'surg_roi.nii';  % Surgical cavity mask file
    surgical_cavity = spm_vol(surgical_cavity_file);
    surgical_cavity_data = spm_read_vols(surgical_cavity);

     % Count the number of non-zero voxels (i.e., surgical volume)
    surgery_voxel = size(find(surgical_cavity_data~=0),1);
    surgery_number(foldnumber,1) = surgery_voxel;
end
