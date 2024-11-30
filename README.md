# Indoor UAV Docker

This is the indoor uav docker that should be used for assignments related to integration. 

## Contents

    Ubuntu 20
    ROS Noetic
    PX4 Software in the loop (with depth camera)
    Gazebo Classic
    AWS small house world

## How to use

    1. ./build
    2. ./attach to run and attach
    3. ./scripts/run to run the simulation (inside docker)
    
    ## UPDATED STEP 
    
    4. ./scripts/drone_controller_with_bspline_PID.py  to operate the Quadcopter (inside docker, in a new terminal created using docker exec -it <docker ID> bash)

There is no bashrc file inside the docker, so the run script does all the sourcing necessary to run all the scripts.

The source files should be inside assignment/src and properly built/sourced.

Feel free to add dependencies on the docker build if they are necessary for the task.
