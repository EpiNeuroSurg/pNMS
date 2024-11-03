clear;clc;
pathfileformation = dir('litt*');
pathnumber = numel(pathfileformation);
for foldnumber = 1:pathnumber
    path = fullfile(pathfileformation(foldnumber).folder, pathfileformation(foldnumber).name);
    cd(path);
    
    spm_jobman('initcfg'); 
    
    matlabbatch{1}.spm.spatial.preproc.channel.vols = {'anat.nii,1'};
    matlabbatch{1}.spm.spatial.preproc.channel.biasreg = 0.001;
    matlabbatch{1}.spm.spatial.preproc.channel.biasfwhm = 60;
    matlabbatch{1}.spm.spatial.preproc.channel.write = [0 0];
    matlabbatch{1}.spm.spatial.preproc.tissue(1).tpm = {'D:\mojiajie\spm12\tpm\TPM.nii,1'};
    matlabbatch{1}.spm.spatial.preproc.tissue(1).ngaus = 1;
    matlabbatch{1}.spm.spatial.preproc.tissue(1).native = [1 0];
    matlabbatch{1}.spm.spatial.preproc.tissue(1).warped = [0 0];
    matlabbatch{1}.spm.spatial.preproc.tissue(2).tpm = {'D:\mojiajie\spm12\tpm\TPM.nii,2'};
    matlabbatch{1}.spm.spatial.preproc.tissue(2).ngaus = 1;
    matlabbatch{1}.spm.spatial.preproc.tissue(2).native = [1 0];
    matlabbatch{1}.spm.spatial.preproc.tissue(2).warped = [0 0];
    matlabbatch{1}.spm.spatial.preproc.tissue(3).tpm = {'D:\mojiajie\spm12\tpm\TPM.nii,3'};
    matlabbatch{1}.spm.spatial.preproc.tissue(3).ngaus = 2;
    matlabbatch{1}.spm.spatial.preproc.tissue(3).native = [1 0];
    matlabbatch{1}.spm.spatial.preproc.tissue(3).warped = [0 0];
    matlabbatch{1}.spm.spatial.preproc.tissue(4).tpm = {'D:\mojiajie\spm12\tpm\TPM.nii,4'};
    matlabbatch{1}.spm.spatial.preproc.tissue(4).ngaus = 3;
    matlabbatch{1}.spm.spatial.preproc.tissue(4).native = [0 0];
    matlabbatch{1}.spm.spatial.preproc.tissue(4).warped = [0 0];
    matlabbatch{1}.spm.spatial.preproc.tissue(5).tpm = {'D:\mojiajie\spm12\tpm\TPM.nii,5'};
    matlabbatch{1}.spm.spatial.preproc.tissue(5).ngaus = 4;
    matlabbatch{1}.spm.spatial.preproc.tissue(5).native = [0 0];
    matlabbatch{1}.spm.spatial.preproc.tissue(5).warped = [0 0];
    matlabbatch{1}.spm.spatial.preproc.tissue(6).tpm = {'D:\mojiajie\spm12\tpm\TPM.nii,6'};
    matlabbatch{1}.spm.spatial.preproc.tissue(6).ngaus = 2;
    matlabbatch{1}.spm.spatial.preproc.tissue(6).native = [0 0];
    matlabbatch{1}.spm.spatial.preproc.tissue(6).warped = [0 0];
    matlabbatch{1}.spm.spatial.preproc.warp.mrf = 1;
    matlabbatch{1}.spm.spatial.preproc.warp.cleanup = 1;
    matlabbatch{1}.spm.spatial.preproc.warp.reg = [0 0.001 0.5 0.05 0.2];
    matlabbatch{1}.spm.spatial.preproc.warp.affreg = 'eastern';
    matlabbatch{1}.spm.spatial.preproc.warp.fwhm = 0;
    matlabbatch{1}.spm.spatial.preproc.warp.samp = 3;
    matlabbatch{1}.spm.spatial.preproc.warp.write = [0 1];
%     matlabbatch{1}.spm.spatial.preproc.channel.vols = {'anat.nii,1'};
%     matlabbatch{1}.spm.spatial.preproc.channel.biasreg = 0.001;
%     matlabbatch{1}.spm.spatial.preproc.channel.biasfwhm = 60;
%     matlabbatch{1}.spm.spatial.preproc.channel.write = [0 0];
%     matlabbatch{1}.spm.spatial.preproc.tissue(1).tpm = {'D:\mojiajie\spm12\tpm\TPM.nii,1'};
%     matlabbatch{1}.spm.spatial.preproc.tissue(1).ngaus = 1;
%     matlabbatch{1}.spm.spatial.preproc.tissue(1).native = [1 0];
%     matlabbatch{1}.spm.spatial.preproc.tissue(1).warped = [0 0];
%     matlabbatch{1}.spm.spatial.preproc.tissue(2).tpm = {'D:\mojiajie\spm12\tpm\TPM.nii,1'};
%     matlabbatch{1}.spm.spatial.preproc.tissue(2).ngaus = 1;
%     matlabbatch{1}.spm.spatial.preproc.tissue(2).native = [1 0];
%     matlabbatch{1}.spm.spatial.preproc.tissue(2).warped = [0 0];
%     matlabbatch{1}.spm.spatial.preproc.tissue(3).tpm = {'D:\mojiajie\spm12\tpm\TPM.nii,1'};
%     matlabbatch{1}.spm.spatial.preproc.tissue(3).ngaus = 2;
%     matlabbatch{1}.spm.spatial.preproc.tissue(3).native = [1 0];
%     matlabbatch{1}.spm.spatial.preproc.tissue(3).warped = [0 0];
%     matlabbatch{1}.spm.spatial.preproc.tissue(4).tpm = {'D:\mojiajie\spm12\tpm\TPM.nii,1'};
%     matlabbatch{1}.spm.spatial.preproc.tissue(4).ngaus = 3;
%     matlabbatch{1}.spm.spatial.preproc.tissue(4).native = [0 0];
%     matlabbatch{1}.spm.spatial.preproc.tissue(4).warped = [0 0];
%     matlabbatch{1}.spm.spatial.preproc.tissue(5).tpm = {'D:\mojiajie\spm12\tpm\TPM.nii,1'};
%     matlabbatch{1}.spm.spatial.preproc.tissue(5).ngaus = 4;
%     matlabbatch{1}.spm.spatial.preproc.tissue(5).native = [0 0];
%     matlabbatch{1}.spm.spatial.preproc.tissue(5).warped = [0 0];
%     matlabbatch{1}.spm.spatial.preproc.tissue(6).tpm = {'D:\mojiajie\spm12\tpm\TPM.nii,1'};
%     matlabbatch{1}.spm.spatial.preproc.tissue(6).ngaus = 2;
%     matlabbatch{1}.spm.spatial.preproc.tissue(6).native = [0 0];
%     matlabbatch{1}.spm.spatial.preproc.tissue(6).warped = [0 0];
%     matlabbatch{1}.spm.spatial.preproc.warp.mrf = 1;
%     matlabbatch{1}.spm.spatial.preproc.warp.cleanup = 1;
%     matlabbatch{1}.spm.spatial.preproc.warp.reg = [0 0.001 0.5 0.05 0.2];
%     matlabbatch{1}.spm.spatial.preproc.warp.affreg = 'eastern';
%     matlabbatch{1}.spm.spatial.preproc.warp.fwhm = 0;
%     matlabbatch{1}.spm.spatial.preproc.warp.samp = 3;
%     matlabbatch{1}.spm.spatial.preproc.warp.write = [0 1];
    matlabbatch{2}.spm.util.imcalc.input(1) = cfg_dep('Segment: c1 Images', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','tiss', '()',{1}, '.','c', '()',{':'}));
    matlabbatch{2}.spm.util.imcalc.input(2) = cfg_dep('Segment: c2 Images', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','tiss', '()',{2}, '.','c', '()',{':'}));
    matlabbatch{2}.spm.util.imcalc.input(3) = cfg_dep('Segment: c3 Images', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','tiss', '()',{3}, '.','c', '()',{':'}));
    matlabbatch{2}.spm.util.imcalc.output = 'mask.nii';
    matlabbatch{2}.spm.util.imcalc.outdir = {''};
    matlabbatch{2}.spm.util.imcalc.expression = 'i1+i2+i3';
    matlabbatch{2}.spm.util.imcalc.var = struct('name', {}, 'value', {});
    matlabbatch{2}.spm.util.imcalc.options.dmtx = 0;
    matlabbatch{2}.spm.util.imcalc.options.mask = 0;
    matlabbatch{2}.spm.util.imcalc.options.interp = 1;
    matlabbatch{2}.spm.util.imcalc.options.dtype = 4;
    matlabbatch{3}.spm.spatial.normalise.write.subj.def(1) = cfg_dep('Segment: Forward Deformations', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','fordef', '()',{':'}));
    matlabbatch{3}.spm.spatial.normalise.write.subj.resample = {'anat.nii,1'};
    matlabbatch{3}.spm.spatial.normalise.write.woptions.bb = [-78 -112 -70
                                                              78 76 85];
    matlabbatch{3}.spm.spatial.normalise.write.woptions.vox = [2 2 2];
    matlabbatch{3}.spm.spatial.normalise.write.woptions.interp = 4;
    matlabbatch{3}.spm.spatial.normalise.write.woptions.prefix = 'w';
    matlabbatch{4}.spm.spatial.normalise.write.subj.def(1) = cfg_dep('Segment: Forward Deformations', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','fordef', '()',{':'}));
    matlabbatch{4}.spm.spatial.normalise.write.subj.resample = {'rflair.nii,1'};
    matlabbatch{4}.spm.spatial.normalise.write.woptions.bb = [-78 -112 -70
                                                              78 76 85];
    matlabbatch{4}.spm.spatial.normalise.write.woptions.vox = [2 2 2];
    matlabbatch{4}.spm.spatial.normalise.write.woptions.interp = 4;
    matlabbatch{4}.spm.spatial.normalise.write.woptions.prefix = 'w';
    matlabbatch{5}.spm.spatial.normalise.write.subj.def(1) = cfg_dep('Segment: Forward Deformations', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','fordef', '()',{':'}));
    matlabbatch{5}.spm.spatial.normalise.write.subj.resample = {'rpet.nii,1'};
    matlabbatch{5}.spm.spatial.normalise.write.woptions.bb = [-78 -112 -70
                                                              78 76 85];
    matlabbatch{5}.spm.spatial.normalise.write.woptions.vox = [2 2 2];
    matlabbatch{5}.spm.spatial.normalise.write.woptions.interp = 4;
    matlabbatch{5}.spm.spatial.normalise.write.woptions.prefix = 'w';
    matlabbatch{6}.spm.spatial.normalise.write.subj.def(1) = cfg_dep('Segment: Forward Deformations', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','fordef', '()',{':'}));
    matlabbatch{6}.spm.spatial.normalise.write.subj.resample(1) = cfg_dep('Image Calculator: ImCalc Computed Image: mask.nii', substruct('.','val', '{}',{2}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','files'));
    matlabbatch{6}.spm.spatial.normalise.write.woptions.bb = [-78 -112 -70
                                                              78 76 85];
    matlabbatch{6}.spm.spatial.normalise.write.woptions.vox = [2 2 2];
    matlabbatch{6}.spm.spatial.normalise.write.woptions.interp = 4;
    matlabbatch{6}.spm.spatial.normalise.write.woptions.prefix = 'w';
    matlabbatch{7}.spm.spatial.normalise.write.subj.def(1) = cfg_dep('Segment: Forward Deformations', substruct('.','val', '{}',{1}, '.','val', '{}',{1}, '.','val', '{}',{1}), substruct('.','fordef', '()',{':'}));
    matlabbatch{7}.spm.spatial.normalise.write.subj.resample = {'surg_roi.nii,1'};
    matlabbatch{7}.spm.spatial.normalise.write.woptions.bb = [-78 -112 -70
                                                              78 76 85];
    matlabbatch{7}.spm.spatial.normalise.write.woptions.vox = [2 2 2];
    matlabbatch{7}.spm.spatial.normalise.write.woptions.interp = 4;
    matlabbatch{7}.spm.spatial.normalise.write.woptions.prefix = 'w';
    matlabbatch{8}.spm.util.imcalc.input = {
                                            'wmask.nii,1'
                                            'wanat.nii,1'
                                            };
    matlabbatch{8}.spm.util.imcalc.output = 'mwanat.nii';
    matlabbatch{8}.spm.util.imcalc.outdir = {''};
    matlabbatch{8}.spm.util.imcalc.expression = 'i1.*i2';
    matlabbatch{8}.spm.util.imcalc.var = struct('name', {}, 'value', {});
    matlabbatch{8}.spm.util.imcalc.options.dmtx = 0;
    matlabbatch{8}.spm.util.imcalc.options.mask = 0;
    matlabbatch{8}.spm.util.imcalc.options.interp = 1;
    matlabbatch{8}.spm.util.imcalc.options.dtype = 4;
    matlabbatch{9}.spm.util.imcalc.input = {
                                            'wmask.nii,1'
                                            'wrflair.nii,1'
                                            };
    matlabbatch{9}.spm.util.imcalc.output = 'mwrflair.nii';
    matlabbatch{9}.spm.util.imcalc.outdir = {''};
    matlabbatch{9}.spm.util.imcalc.expression = 'i1.*i2';
    matlabbatch{9}.spm.util.imcalc.var = struct('name', {}, 'value', {});
    matlabbatch{9}.spm.util.imcalc.options.dmtx = 0;
    matlabbatch{9}.spm.util.imcalc.options.mask = 0;
    matlabbatch{9}.spm.util.imcalc.options.interp = 1;
    matlabbatch{9}.spm.util.imcalc.options.dtype = 4;
    matlabbatch{10}.spm.util.imcalc.input = {
                                            'wmask.nii,1'
                                            'wrpet.nii,1'
                                            };
    matlabbatch{10}.spm.util.imcalc.output = 'mwrpet.nii';
    matlabbatch{10}.spm.util.imcalc.outdir = {''};
    matlabbatch{10}.spm.util.imcalc.expression = 'i1.*i2';
    matlabbatch{10}.spm.util.imcalc.var = struct('name', {}, 'value', {});
    matlabbatch{10}.spm.util.imcalc.options.dmtx = 0;
    matlabbatch{10}.spm.util.imcalc.options.mask = 0;
    matlabbatch{10}.spm.util.imcalc.options.interp = 1;
    matlabbatch{10}.spm.util.imcalc.options.dtype = 4;
    
    spm_jobman('run',matlabbatch);  
    clear matlabbatch;
    
    spm_jobman('initcfg');
    t1v=spm_vol('wanat.nii');t1=spm_read_vols(t1v);
    t2v=spm_vol('wrflair.nii');t2=spm_read_vols(t2v);
    petv=spm_vol('wrpet.nii');pet=spm_read_vols(petv);
    roiv=spm_vol('wmask.nii');roi=spm_read_vols(roiv);
    ind = find(roi>0.9);

    mean_t1 = mean(t1(ind));std_t1 = std(t1(ind)); 
    mean_t2 = mean(t2(ind));std_t2 = std(t2(ind)); 
    mean_pet = mean(pet(ind));std_pet = std(pet(ind)); 
    express_t1 = ['(i1-',num2str(mean_t1),')./',num2str(std_t1),'+5'];
    express_t2 = ['(i1-',num2str(mean_t2),')./',num2str(std_t2),'+5'];
    express_pet = ['(i1-',num2str(mean_pet),')./',num2str(std_pet),'+5'];

    matlabbatch{1}.spm.util.imcalc.input = {'mwanat.nii'};
    matlabbatch{1}.spm.util.imcalc.output = 'imwanat.nii';
    matlabbatch{1}.spm.util.imcalc.outdir = {''};
    matlabbatch{1}.spm.util.imcalc.expression = express_t1;
    matlabbatch{1}.spm.util.imcalc.var = struct('name', {}, 'value', {});
    matlabbatch{1}.spm.util.imcalc.options.dmtx = 0;
    matlabbatch{1}.spm.util.imcalc.options.mask = 0;
    matlabbatch{1}.spm.util.imcalc.options.interp = 1;
    matlabbatch{1}.spm.util.imcalc.options.dtype = 4;
    matlabbatch{2}.spm.util.imcalc.input = {'mwrflair.nii'};
    matlabbatch{2}.spm.util.imcalc.output = 'imwrflair.nii';
    matlabbatch{2}.spm.util.imcalc.outdir = {''};
    matlabbatch{2}.spm.util.imcalc.expression = express_t2;
    matlabbatch{2}.spm.util.imcalc.var = struct('name', {}, 'value', {});
    matlabbatch{2}.spm.util.imcalc.options.dmtx = 0;
    matlabbatch{2}.spm.util.imcalc.options.mask = 0;
    matlabbatch{2}.spm.util.imcalc.options.interp = 1;
    matlabbatch{2}.spm.util.imcalc.options.dtype = 4;
    matlabbatch{3}.spm.util.imcalc.input = {'mwrpet.nii'};
    matlabbatch{3}.spm.util.imcalc.output = 'imwrpet.nii';
    matlabbatch{3}.spm.util.imcalc.outdir = {''};
    matlabbatch{3}.spm.util.imcalc.expression = express_pet;
    matlabbatch{3}.spm.util.imcalc.var = struct('name', {}, 'value', {});
    matlabbatch{3}.spm.util.imcalc.options.dmtx = 0;
    matlabbatch{3}.spm.util.imcalc.options.mask = 0;
    matlabbatch{3}.spm.util.imcalc.options.interp = 1;
    matlabbatch{3}.spm.util.imcalc.options.dtype = 4;

    spm_jobman('run',matlabbatch);  
    clear matlabbatch;
    
    
end