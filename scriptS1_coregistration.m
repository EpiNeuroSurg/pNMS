% This script checks whether coregistered images (rflair.nii, rpet.nii, rpost_mri.nii)
% already exist in the current directory.
% If not, it performs coregistration to align each modality to the anatomical reference (anat.nii)
% using SPM's estimate-and-write procedure with normalized mutual information (NMI) cost function.

% --- Coregister FLAIR to anat.nii ---
A1 = exist('rflair.nii');
if A1 == 2 % If rflair.nii does not exist
else
spm_jobman('initcfg');
matlabbatch{1}.spm.spatial.coreg.estwrite.ref = {'anat.nii,1'};
matlabbatch{1}.spm.spatial.coreg.estwrite.source = {'flair.nii,1'};
matlabbatch{1}.spm.spatial.coreg.estwrite.other = {''};
matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.cost_fun = 'nmi';
matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.sep = [4 2];
matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.fwhm = [7 7];
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.interp = 1;
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.wrap = [0 0 0];
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.mask = 0;
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.prefix = 'r';
spm_jobman('run',matlabbatch);
clear matlabbatch;
end

% --- Coregister PET to anat.nii ---
A2 = exist('rpet.nii');
if A2 == 2 % If rpet.nii does not exist
else
spm_jobman('initcfg');
matlabbatch{1}.spm.spatial.coreg.estwrite.ref = {'anat.nii,1'};
matlabbatch{1}.spm.spatial.coreg.estwrite.source = {'pet.nii,1'};
matlabbatch{1}.spm.spatial.coreg.estwrite.other = {''};
matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.cost_fun = 'nmi';
matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.sep = [4 2];
matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.fwhm = [7 7];
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.interp = 1;
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.wrap = [0 0 0];
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.mask = 0;
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.prefix = 'r';
spm_jobman('run',matlabbatch);
clear matlabbatch;
end

% --- Coregister post-operative MRI to anat.nii ---
A3 = exist('rpost_mri.nii');
if A3 == 2 % If rpost_mri.nii does not exist
else
spm_jobman('initcfg');
matlabbatch{1}.spm.spatial.coreg.estwrite.ref = {'anat.nii,1'};
matlabbatch{1}.spm.spatial.coreg.estwrite.source = {'post_mri.nii,1'};
matlabbatch{1}.spm.spatial.coreg.estwrite.other = {''};
matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.cost_fun = 'nmi';
matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.sep = [4 2];
matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.tol = [0.02 0.02 0.02 0.001 0.001 0.001 0.01 0.01 0.01 0.001 0.001 0.001];
matlabbatch{1}.spm.spatial.coreg.estwrite.eoptions.fwhm = [7 7];
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.interp = 1;
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.wrap = [0 0 0];
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.mask = 0;
matlabbatch{1}.spm.spatial.coreg.estwrite.roptions.prefix = 'r';
spm_jobman('run',matlabbatch);
clear matlabbatch;
end
