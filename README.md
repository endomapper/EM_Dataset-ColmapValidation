# EM_Dataset-ColmapValidation

This repository contains the software for the EndoMapper dataset validation described in the section “COLMAP validation” of the publication:  

    Azagra P. et al. Endomapper dataset of complete calibrated endoscopy procedures. Scientific Data. 2023. Accepted for publication.

The validation software has been built on top of COLMAP release 3.6. The [`colmp folder`](https://github.com/endomapper/EM_Dataset-ColmapValidation/tree/main/colmap)  contains a clone of COLMAP release 3.6 at this exact [commit](https://github.com/colmap/colmap/commits/a6ad9641a5fb06ae8315f9be7be270f79745cbcb). Only the BSD licensed [`reconstruction.h`](colmap/src/base/reconstruction.h) and [`reconstruction.cc`](colmap/src/base/reconstruction.cc) files have been modified in order to generate files indicating covisible images i.e. images sharing at least one 3D point in common.

For installing COLMAP from source, please follow their instructions [here](https://colmap.github.io/install.html).

## Setup
To obtain a reconstruction, you can use the script `segment.sh`. It will extract all the frames from the video, perform feature extraction and matching, and finally 3D reconstruction. To use this, you need to specify your dataset path in `segment.sh`, the folder where you store the sequence you want to reconstruct. Then simply run:

``` bash
sh segment.sh
```

This will convert the sequence into frames and clusterize them using COLMAP. The structure of the folder at the end of the procedure will be as follows:

```
.
└── Seq_XXX
    ├── Seq_XXX.mov
    ├── images
    ├── sparse
    └── database.db           
```

