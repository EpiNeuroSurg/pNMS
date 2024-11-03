clear;clc;
pathfileformation = dir('litt*');
pathnumber = numel(pathfileformation);
for foldnumber = 1:pathnumber
    path = fullfile(pathfileformation(foldnumber).folder, pathfileformation(foldnumber).name);
    cd(path);
    
    % 读取NIfTI文件
    nii_file = 'AI_imwrpet.nii';  % 确保将此路径替换为实际NIfTI文件的路径
    V = spm_vol(nii_file);
    img = spm_read_vols(V);

    % 修改体素值
    threshold = -0.0578157525;
    img(img > threshold) = 0;    img(img <= threshold) = 1;

    % 保存修改后的影像文件
    V.fname = 'threshold_AI_imwrpet.nii';  % 确保将此路径替换为保存修改后文件的路径
    spm_write_vol(V, img);

end
