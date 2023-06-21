# EM_Dataset-ColmapValidation

For the reconstructions provided in the dataset, we used the COLMAP version provided in this repo. It was slightly modified to write files indicating covisible images i.e. images sharing at least one 3D point in common. 

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

