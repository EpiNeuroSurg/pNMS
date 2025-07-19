clear;clc;
pathfileformation = dir('litt*');
pathnumber = numel(pathfileformation);
for foldnumber = 1:pathnumber
    path = fullfile(pathfileformation(foldnumber).folder, pathfileformation(foldnumber).name);
    cd(path);
    
    % Read NIfTI file
    nii_file = 'AI_imwrpet.nii';  % Make sure to replace this path with the actual path to the NIfTI file
    V = spm_vol(nii_file);
    img = spm_read_vols(V);

    % Modify voxel values
    threshold = -0.0578157525;
    img(img > threshold) = 0;    img(img <= threshold) = 1;

    % Save the modified NIfTI image
    V.fname = 'threshold_AI_imwrpet.nii';  % Make sure to replace this path with the desired output path
    spm_write_vol(V, img);

end
