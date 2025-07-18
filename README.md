# pNMS Toolkit for MRgLITT Outcome Analysis

This repository provides a MATLAB-based implementation of the **Personalized NeuroMetabolic Signature (pNMS)** framework proposed in our study:
> *Personalized NeuroMetabolic Signature (pNMS) Predicts Seizure Outcomes in Mesial Temporal Lobe Epilepsy after Magnetic Resonance-guided Laser Interstitial Thermal Therapy*  
> Mo et al., submitted to *Communications Medicine*

## Overview

The pipeline enables voxel-wise image preprocessing, quantitative asymmetry index (AI) calculation from multimodal neuroimages (T1WI, FLAIR, FDG-PET), and personalized PET abnormality mapping. The pNMS is then intersected with surgical cavities to assess ablation coverage and relate to clinical seizure outcomes.

## Dependencies

- MATLAB (tested on R2021a)
- SPM12 toolbox (https://www.fil.ion.ucl.ac.uk/spm/software/spm12/)
- NIfTI-format neuroimaging data

## Folder Structure and Input

Project Root/ \
├── litt001/ \
│ ├── anat.nii \
│ ├── flair.nii \
│ ├── pet.nii \
│ └── surg_roi.nii \
├── litt002/ \
│ └── ... \
└── scripts/


Each subject folder (e.g., `litt001`) should contain:
- `anat.nii` – 3D T1-weighted structural MRI
- `flair.nii` – T2-FLAIR image
- `pet.nii` – FDG-PET image
- `surg_roi.nii` – postoperative surgical cavity mask

## Script Modules

The analysis is modular. Scripts should be run sequentially for each subject or batch-processed:

| Script | Description |
|--------|-------------|
| `script1_win_data_processed.m` | Segments anatomical images and performs spatial normalization of all modalities. |
| `script2_win_AIcalculate.m` | Computes AI maps for each modality by flipping and contrasting hemispheres. |
| `script3_signal_calculation.m` | Caluculates the signals from multimodalities. |
| `script4_surgical_cavity_calculation.m` | Calculates total ablation volume per subject. |
| `script5_threshold_binary_AI_imagesI.m` | Thresholds PET-AI maps based on predefined cutoffs (e.g., -0.06). |
| `script6_pet_pattern_deformation.m` | Transforms thresholded pNMS back to native surgical space. |
| `script7_surgery_AH_pattern_overlay.m` | Computes overlap rates between pNMS, hippocampus/amygdala, and ablation mask. |
| `script8_visalization.m` | Visalizes the pNMS. |
| `script9_regression_model.m` | Performs the GAM analysis. |
| `scriptS1_coregistration.m` | Coregisters flair, PET, and post-op MRI to the T1 anatomical image. |
| `scriptS2_within_group_comparison.m` | Compares the differences between two indenpent groups of numbes. |

## Output

Main output files include:
- `AI_imwrpet.nii` – asymmetry index of PET image
- `threshold_AI_imwrpet.nii` – binarized pNMS abnormality map
- `bi_iy_threshold_AI_imwrpet.nii` – pNMS map warped to surgical space
- `overlay_rate_number.mat` – array of overlap rates per subject

These outputs can be used for downstream statistical analysis (e.g., R or Python) to relate image-derived metrics to seizure outcome.

## Citation

If you use this code, please cite the following:

> Mo et al. *Personalized NeuroMetabolic Signature (pNMS) Predicts Seizure Outcomes in Mesial Temporal Lobe Epilepsy after MR-guided Laser Interstitial Thermal Therapy*, *Communications Medicine* (in review)


