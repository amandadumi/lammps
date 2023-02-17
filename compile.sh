#!/bin/bash
echo Configuring and building froom inside the build directory.
echo Check the results of the CMake configuration to ensure that the preferred
echo compilers and libraries have been selected. See README and documentation 
echo for guidance.

export CC=/usr/bin/gcc
export CXX=/usr/bin/g++
export MPICC=/usr/local/bin/mpicc
export MPICXX=/usr/local/bin/mpicxx
export HDF5_ROOT=/usr/local/Cellar/hdf5/1.12.2_1
export FFTW_HOME=/usr/local/Cellar/fftw/3.3.10_1
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/Cellar/open-mpi/4.1.4_2/lib/openmpi
rm -r build ; mkdir build; cd build
cmake -DCMAKE_CXX_COMPILER=$CXX \
      -DCMAKE_C_COMPILER=CC \
      -DCMAKE_INSTALL_PREFIX=$HOME/software/lammps/ \
      -DCMAKE_CXX_STANDARD=\
      -DBUILD_MPI=yes \
      -DPKG_ML-SNAP=yes \
      -DPKG_MOLECULE=yes \
      -DBUILD_SHARED_LIBS=yes ../cmake
cmake --build .          # compilation (or type "make")
