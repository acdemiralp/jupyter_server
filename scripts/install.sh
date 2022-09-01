#!/bin/bash

mkdir ../server
cd ../server

#   Install Jupyter.
python3 -m pip install --upgrade pip
pip3 install --upgrade pip
pip3 install --upgrade jupyter jupyterlab voila

#   Install Julia.
if [ ! -d ./julia-1.8.0 ] ; then
  curl -L https://julialang-s3.julialang.org/bin/linux/x64/1.8/julia-1.8.0-linux-x86_64.tar.gz -o ./download.tar.gz
  tar -xzf ./download.tar.gz
  rm ./download.tar.gz
  
  ./julia-1.8.0/bin/julia ../scripts/install.jl
fi

#   Install R.
if [ ! -d ./R-4.2.1 ] ; then
  curl -L https://cran.r-project.org/src/base/R-4/R-4.2.1.tar.gz -o ./download.tar.gz
  tar -xzf ./download.tar.gz
  rm ./download.tar.gz

  cd ./R-4.2.1
  ./configure --prefix=$PWD
  make && make install
  ./bin/Rscript ../../scripts/install.r
  cd ..
fi

cd ../scripts