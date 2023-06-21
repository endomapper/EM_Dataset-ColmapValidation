#!/bin/sh

DATASET_PATH=/your/path/to/folder
SEQUENCE_NAME=sequence.mov

mkdir $DATASET_PATH/images
ffmpeg -i $DATASET_PATH/$SEQUENCE_NAME -qscale:v 2 $DATASET_PATH/images/out%d.png
colmap feature_extractor --database_path $DATASET_PATH/database.db --image_path $DATASET_PATH/images --ImageReader.camera_model OPENCV_FISHEYE --ImageReader.single_camera 1 --ImageReader.camera_params 717.2104,717.4816,735.3566,552.7982,-0.1389272,-0.001239606,0.0009125824,-0.00004071615
colmap exhaustive_matcher --database_path $DATASET_PATH/database.db --SiftMatching.guided_matching 1 --ExhaustiveMatching.block_size 100
mkdir $DATASET_PATH/sparse
colmap mapper --database_path $DATASET_PATH/database.db --image_path $DATASET_PATH --output_path $DATASET_PATH/sparse --Mapper.init_min_tri_angle 8 --Mapper.ba_refine_focal_length 0 --Mapper.ba_refine_extra_params 0 

