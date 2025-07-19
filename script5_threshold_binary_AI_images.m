% This script thresholds the asymmetry index (AI) map from PET images (AI_imwrpet.nii)
% for each subject. Voxels with AI ≤ threshold are set to 1, and others to 0.
% The output is a binary mask image named 'threshold_AI_imwrpet.nii'.

clear;clc;
pathfileformation = dir('litt*');
pathnumber = numel(pathfileformation);
for foldnumber = 1:pathnumber
    path = fullfile(pathfileformation(foldnumber).folder, pathfileformation(foldnumber).name);
    cd(path);
    
    % Load the PET AI image
    nii_file = 'AI_imwrpet.nii';  % Make sure to replace this path with the actual path to the NIfTI file
    V = spm_vol(nii_file);
    img = spm_read_vols(V);

    % Thresholding: AI ≤ -0.0578 set to 1 (positive finding), else 0
    threshold = -0.0578157525;
    img(img > threshold) = 0;    img(img <= threshold) = 1;

    % Save the binary mask as a new NIfTI file
    V.fname = 'threshold_AI_imwrpet.nii';  % Make sure to replace this path with the desired output path
    spm_write_vol(V, img);

end
