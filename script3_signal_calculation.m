% This script extracts mean asymmetry index (AI) values from surgical ROI masks
% across T1-weighted (imwanat), FLAIR, and PET images.
% For each subject folder matching 'litt*', it loads the AI images and 
% computes mean AI values in original (wsurg_roi) and flipped (f_wsurg_roi) ROIs.

clear;clc;
pathfileformation = dir('litt*');% Find all subject directories starting with 'litt'
pathnumber = numel(pathfileformation);

% Initialize output matrix: rows = subjects, columns = 6 features
% Columns: [T1_L, T1_R, FLAIR_L, FLAIR_R, PET_L, PET_R]
multimodalities_matrix = zeros(35,6);

for foldnumber = 1:pathnumber
    path = fullfile(pathfileformation(foldnumber).folder, pathfileformation(foldnumber).name);
    cd(path);

    % Load ROI masks and AI images
    img_roi = spm_vol('wsurg_roi.nii');
    data_roi = spm_read_vols(img_roi);
    img_froi = spm_vol('f_wsurg_roi.nii');
    data_froi = spm_read_vols(img_froi);
    img_anat = spm_vol('AI_imwanat.nii');
    data_anat = spm_read_vols(img_anat);
    img_flair = spm_vol('AI_imwrflair.nii');
    data_flair = spm_read_vols(img_flair);
    img_pet = spm_vol('AI_imwrpet.nii');
    data_pet = spm_read_vols(img_pet);

    
    % Get voxel indices for each ROI
    coordinate = find(data_roi ~= 0);
    coordinatef = find(data_froi ~= 0);

    % Extract mean AI values from each modality in each ROI
    multimodalities_matrix(foldnumber,1) = mean(data_anat(coordinate));
    multimodalities_matrix(foldnumber,2) = mean(data_anat(coordinatef));
    multimodalities_matrix(foldnumber,3) = mean(data_flair(coordinate));
    multimodalities_matrix(foldnumber,4) = mean(data_flair(coordinatef));
    multimodalities_matrix(foldnumber,5) = mean(data_pet(coordinate));
    multimodalities_matrix(foldnumber,6) = mean(data_pet(coordinatef));
    
end
