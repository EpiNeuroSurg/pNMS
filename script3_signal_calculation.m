clear;clc;
pathfileformation = dir('litt*');
pathnumber = numel(pathfileformation);

multimodalities_matrix = zeros(35,6);

for foldnumber = 1:pathnumber
    path = fullfile(pathfileformation(foldnumber).folder, pathfileformation(foldnumber).name);
    cd(path);
    
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
    
    coordinate = find(data_roi ~= 0);
    coordinatef = find(data_froi ~= 0);
    
    multimodalities_matrix(foldnumber,1) = mean(data_anat(coordinate));
    multimodalities_matrix(foldnumber,2) = mean(data_anat(coordinatef));
    multimodalities_matrix(foldnumber,3) = mean(data_flair(coordinate));
    multimodalities_matrix(foldnumber,4) = mean(data_flair(coordinatef));
    multimodalities_matrix(foldnumber,5) = mean(data_pet(coordinate));
    multimodalities_matrix(foldnumber,6) = mean(data_pet(coordinatef));
    
end