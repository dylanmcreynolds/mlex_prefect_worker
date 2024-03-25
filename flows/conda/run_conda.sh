#!/bin/bash

# Check if all arguments are provided
if [ $# -ne 3 ]; then
    echo "Usage: $0 <conda_environment> python <python_file> <yaml_file>"
    exit 1
fi

CONDA_PATH="/scratch/dvp85458/miniconda"
source "$CONDA_PATH/etc/profile.d/conda.sh"
# Assign arguments to variables
conda_environment=$1
python_file=$2
yaml_file=$3



echo Calling model with:  conda run -n $conda_environment python $python_file $yaml_file

# Call python with the python file and yaml file as arguments
conda run -n $conda_environment python $python_file $yaml_file

# Check if the Conda command was successful
if [ "$?" -ne 0 ]; then
    echo "Failed to run conda command"
    exit 1
fi

echo "Successfully run conda command"
exit 0
