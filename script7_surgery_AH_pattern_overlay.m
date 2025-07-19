% Please replace with the actual paths to amyg.nii and hippo.nii, as well as ramyg.nii and rhoppo.nii

clear;clc;
pathfileformation = dir('litt*');
pathnumber = numel(pathfileformation);

overlay_rate_number = [];
for foldnumber = 1:pathnumber
    path = fullfile(pathfileformation(foldnumber).folder, pathfileformation(foldnumber).name);
    cd(path);
    
%     spm_jobman('initcfg');     
%     matlabbatch{1}.spm.spatial.coreg.write.ref = {'anat.nii,1'};
%     matlabbatch{1}.spm.spatial.coreg.write.source = {['D:\20231227AICA\freesurfer\',pathfileformation(foldnumber).name,'\amyg.nii,1']};
%     matlabbatch{1}.spm.spatial.coreg.write.roptions.interp = 4;
%     matlabbatch{1}.spm.spatial.coreg.write.roptions.wrap = [0 0 0];
%     matlabbatch{1}.spm.spatial.coreg.write.roptions.mask = 0;
%     matlabbatch{1}.spm.spatial.coreg.write.roptions.prefix = 'r';
%     matlabbatch{2}.spm.spatial.coreg.write.ref = {'anat.nii,1'};
%     matlabbatch{2}.spm.spatial.coreg.write.source = {['D:\20231227AICA\freesurfer\',pathfileformation(foldnumber).name,'\hippo.nii,1']};
%     matlabbatch{2}.spm.spatial.coreg.write.roptions.interp = 4;
%     matlabbatch{2}.spm.spatial.coreg.write.roptions.wrap = [0 0 0];
%     matlabbatch{2}.spm.spatial.coreg.write.roptions.mask = 0;
%     matlabbatch{2}.spm.spatial.coreg.write.roptions.prefix = 'r';
%     spm_jobman('run',matlabbatch);  
%     clear matlabbatch;
    
    template_file = ['D:\20231227AICA\\freesurfer\',pathfileformation(foldnumber).name,'\rhippo.nii'];
    surgical_cavity_file = 'surg_roi.nii';
    binary_threshold_image_file = 'bi_iy_threshold_AI_imwrpet.nii';
      
    % Load NIfTI files
    template = spm_vol(template_file);
    surgical_cavity = spm_vol(surgical_cavity_file);
    binary_threshold_image = spm_vol(binary_threshold_image_file);

    % Read the image data
    mni_template_data = spm_read_vols(template);
    surgical_cavity_data = spm_read_vols(surgical_cavity);
    binary_threshold_data = spm_read_vols(binary_threshold_image);

    % Find overlapping voxels where the combined MNI mask, surgical cavity, and binary threshold are all non-zero
    overlap = mni_template_data & surgical_cavity_data & binary_threshold_data;
    num_overlap_voxels = sum(overlap(:));

    temp = mni_template_data & binary_threshold_data;
    num_combined_voxels = sum(temp(:));

    % Calculate the overlay rate
    overlay_rate = num_overlap_voxels / num_combined_voxels;
    
    overlay_rate_number(foldnumber,1) = overlay_rate;
end
