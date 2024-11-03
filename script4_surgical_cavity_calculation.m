clear;clc;
pathfileformation = dir('litt*');
pathnumber = numel(pathfileformation);

surgery_number = [];
for foldnumber = 1:pathnumber
    path = fullfile(pathfileformation(foldnumber).folder, pathfileformation(foldnumber).name);
    cd(path);
    
    surgical_cavity_file = 'surg_roi.nii';
    surgical_cavity = spm_vol(surgical_cavity_file);
    surgical_cavity_data = spm_read_vols(surgical_cavity);
    
    surgery_voxel = size(find(surgical_cavity_data~=0),1);
    surgery_number(foldnumber,1) = surgery_voxel;
end