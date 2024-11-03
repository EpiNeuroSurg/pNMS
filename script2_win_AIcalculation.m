clear;clc;
pathfileformation = dir('litt*');
pathnumber = numel(pathfileformation);
for foldnumber = 1:pathnumber
    path = fullfile(pathfileformation(foldnumber).folder, pathfileformation(foldnumber).name);
    cd(path);
    
    spm_jobman('initcfg'); 

    matlabbatch{1}.spm.util.imcalc.input = {'imwanat.nii,1'};
    matlabbatch{1}.spm.util.imcalc.output = 'f_imwanat.nii';
    matlabbatch{1}.spm.util.imcalc.outdir = {''};
    matlabbatch{1}.spm.util.imcalc.expression = 'flipud(i1)';
    matlabbatch{1}.spm.util.imcalc.var = struct('name', {}, 'value', {});
    matlabbatch{1}.spm.util.imcalc.options.dmtx = 0;
    matlabbatch{1}.spm.util.imcalc.options.mask = 0;
    matlabbatch{1}.spm.util.imcalc.options.interp = 1;
    matlabbatch{1}.spm.util.imcalc.options.dtype = 4;
    matlabbatch{2}.spm.util.imcalc.input = {
                                            'imwanat.nii,1'
                                            'f_imwanat.nii,1'
                                            };
    matlabbatch{2}.spm.util.imcalc.output = 'AI_imwanat.nii';
    matlabbatch{2}.spm.util.imcalc.outdir = {''};
    matlabbatch{2}.spm.util.imcalc.expression = '2.*(i1-i2)./(i1+i2)';
    matlabbatch{2}.spm.util.imcalc.var = struct('name', {}, 'value', {});
    matlabbatch{2}.spm.util.imcalc.options.dmtx = 0;
    matlabbatch{2}.spm.util.imcalc.options.mask = 0;
    matlabbatch{2}.spm.util.imcalc.options.interp = 1;
    matlabbatch{2}.spm.util.imcalc.options.dtype = 4;
    
    matlabbatch{3}.spm.util.imcalc.input = {'imwrflair.nii,1'};
    matlabbatch{3}.spm.util.imcalc.output = 'f_imwrflair.nii';
    matlabbatch{3}.spm.util.imcalc.outdir = {''};
    matlabbatch{3}.spm.util.imcalc.expression = 'flipud(i1)';
    matlabbatch{3}.spm.util.imcalc.var = struct('name', {}, 'value', {});
    matlabbatch{3}.spm.util.imcalc.options.dmtx = 0;
    matlabbatch{3}.spm.util.imcalc.options.mask = 0;
    matlabbatch{3}.spm.util.imcalc.options.interp = 1;
    matlabbatch{3}.spm.util.imcalc.options.dtype = 4;
    matlabbatch{4}.spm.util.imcalc.input = {
                                            'imwrflair.nii,1'
                                            'f_imwrflair.nii,1'
                                            };
    matlabbatch{4}.spm.util.imcalc.output = 'AI_imwrflair.nii';
    matlabbatch{4}.spm.util.imcalc.outdir = {''};
    matlabbatch{4}.spm.util.imcalc.expression = '2.*(i1-i2)./(i1+i2)';
    matlabbatch{4}.spm.util.imcalc.var = struct('name', {}, 'value', {});
    matlabbatch{4}.spm.util.imcalc.options.dmtx = 0;
    matlabbatch{4}.spm.util.imcalc.options.mask = 0;
    matlabbatch{4}.spm.util.imcalc.options.interp = 1;
    matlabbatch{4}.spm.util.imcalc.options.dtype = 4;
    matlabbatch{5}.spm.util.imcalc.input = {'imwrpet.nii,1'};
    matlabbatch{5}.spm.util.imcalc.output = 'f_imwrpet.nii';
    matlabbatch{5}.spm.util.imcalc.outdir = {''};
    matlabbatch{5}.spm.util.imcalc.expression = 'flipud(i1)';
    matlabbatch{5}.spm.util.imcalc.var = struct('name', {}, 'value', {});
    matlabbatch{5}.spm.util.imcalc.options.dmtx = 0;
    matlabbatch{5}.spm.util.imcalc.options.mask = 0;
    matlabbatch{5}.spm.util.imcalc.options.interp = 1;
    matlabbatch{5}.spm.util.imcalc.options.dtype = 4;
    matlabbatch{6}.spm.util.imcalc.input = {
                                            'imwrpet.nii,1'
                                            'f_imwrpet.nii,1'
                                            };
    matlabbatch{6}.spm.util.imcalc.output = 'AI_imwrpet.nii';
    matlabbatch{6}.spm.util.imcalc.outdir = {''};
    matlabbatch{6}.spm.util.imcalc.expression = '2.*(i1-i2)./(i1+i2)';
    matlabbatch{6}.spm.util.imcalc.var = struct('name', {}, 'value', {});
    matlabbatch{6}.spm.util.imcalc.options.dmtx = 0;
    matlabbatch{6}.spm.util.imcalc.options.mask = 0;
    matlabbatch{6}.spm.util.imcalc.options.interp = 1;
    matlabbatch{6}.spm.util.imcalc.options.dtype = 4;
    
    matlabbatch{7}.spm.util.imcalc.input = {'wsurg_roi.nii,1'};
    matlabbatch{7}.spm.util.imcalc.output = 'f_wsurg_roi.nii';
    matlabbatch{7}.spm.util.imcalc.outdir = {''};
    matlabbatch{7}.spm.util.imcalc.expression = 'flipud(i1)';
    matlabbatch{7}.spm.util.imcalc.var = struct('name', {}, 'value', {});
    matlabbatch{7}.spm.util.imcalc.options.dmtx = 0;
    matlabbatch{7}.spm.util.imcalc.options.mask = 0;
    matlabbatch{7}.spm.util.imcalc.options.interp = 1;
    matlabbatch{7}.spm.util.imcalc.options.dtype = 4;
    
    

    spm_jobman('run',matlabbatch);  
    clear matlabbatch;
    
end