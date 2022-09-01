@echo off

mkdir ..\server
cd ..\server

rem Install Jupyter.
python -m pip install --upgrade pip
pip3 install --upgrade pip
pip3 install --upgrade jupyter jupyterlab voila

rem Install Julia.
if not exist julia-1.8.0 (
  curl -L https://julialang-s3.julialang.org/bin/winnt/x64/1.8/julia-1.8.0-win64.zip -o download.zip
  tar -xf download.zip
  del download.zip
  
  julia-1.8.0\bin\julia ..\scripts\install.jl
)

rem Install R.
if not exist r_portable-4.2.1 (
  curl -L https://github.com/acdemiralp/r_portable/archive/refs/tags/4.2.1.zip -o download.zip
  tar -xf download.zip
  del download.zip
  
  r_portable-4.2.1\bin\Rscript ..\scripts\install.r
)

cd ..\scripts