#!/bin/bash
ENVNAME="gnnetwork"

is_installed=$(conda info --envs | grep $ENVNAME -c)

if [[ "${is_installed}" == "0" ]];then
  conda create -n $ENVNAME -y;
fi

if [[ `command -v activate` ]]
then
  source `which activate` $ENVNAME
else
  conda activate $ENVNAME
fi

# Check to make sure grapharm is activated
if [[ "${CONDA_DEFAULT_ENV}" != $ENVNAME ]]
then
  echo "Could not run conda activate $ENVNAME, please check the errors";
  exit 1;
fi

pip install torch==2.1.0 --index-url https://download.pytorch.org/whl/cu118
pip install torch-scatter==2.1.2 torch-sparse==0.6.18 torch-geometric==2.4.0 -f https://data.pyg.org/whl/torch-2.1.0+cu118.html
pip install ninja easydict pyyaml
conda install --channel conda-forge pygraphviz


