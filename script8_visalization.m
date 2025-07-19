% This script performs subject-wise processing to:
% 1. Copy subject-specific right hippocampus (rhippo.nii) and right amygdala (ramyg.nii) masks
%    from a source directory into each subject's working folder.
% 2. Generate a masked anatomical image using segmented tissue probability maps.
% 3. Multiply amygdala + hippocampus masks with binarized inverse AI PET mask.

% NOTE: Please replace the base path in `copyfile` with the actual location of Freesurfer segmentations.


pathfileformation = dir('litt*');
pathnumber = numel(pathfileformation);

for foldnumber = 1:pathnumber
    path = fullfile(pathfileformation(foldnumber).folder, pathfileformation(foldnumber).name);
    cd(path);
    
    copyfile(['D:\20231227AICA\freesurfer\',pathfileformation(foldnumber).name,'\rhippo.nii'],...
        [path,'\rhippo.nii']);
    copyfile(['D:\20231227AICA\freesurfer\',pathfileformation(foldnumber).name,'\ramyg.nii'],...
        [path,'\ramyg.nii']);
    
    spm_jobman('initcfg'); 
    % Multiply the sum of gray matter (c1), white matter (c2), and CSF (c3) with the original anat image
    matlabbatch{1}.spm.util.imcalc.input = {
                                        'c1anat.nii,1'
                                        'c2anat.nii,1'
                                        'c3anat.nii,1'
                                        'anat.nii,1'
                                        };
    matlabbatch{1}.spm.util.imcalc.output = 'manat.nii';
    matlabbatch{1}.spm.util.imcalc.outdir = {''};
    matlabbatch{1}.spm.util.imcalc.expression = '(i1+i2+i3).*i4';
    matlabbatch{1}.spm.util.imcalc.var = struct('name', {}, 'value', {});
    matlabbatch{1}.spm.util.imcalc.options.dmtx = 0;
    matlabbatch{1}.spm.util.imcalc.options.mask = 0;
    matlabbatch{1}.spm.util.imcalc.options.interp = 1;
    matlabbatch{1}.spm.util.imcalc.options.dtype = 4;
    matlabbatch{2}.spm.util.imcalc.input = {
                                            'ramyg.nii,1'
                                            'rhippo.nii,1'
                                            'bi_iy_threshold_AI_imwrpet.nii,1'
                                            };
    matlabbatch{2}.spm.util.imcalc.output = 'AH_bi_iy_threshold_AI_imwrpet.nii';
    matlabbatch{2}.spm.util.imcalc.outdir = {''};
    matlabbatch{2}.spm.util.imcalc.expression = '(i1+i2).*i3';
    matlabbatch{2}.spm.util.imcalc.var = struct('name', {}, 'value', {});
    matlabbatch{2}.spm.util.imcalc.options.dmtx = 0;
    matlabbatch{2}.spm.util.imcalc.options.mask = 0;
    matlabbatch{2}.spm.util.imcalc.options.interp = 1;
    matlabbatch{2}.spm.util.imcalc.options.dtype = 4;
    
    spm_jobman('run',matlabbatch);  
    clear matlabbatch;
end
