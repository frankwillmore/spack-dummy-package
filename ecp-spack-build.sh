#!/bin/bash

echo "starting build of spack-dummy-package"

export HOME=/home/ecptestb
module load spack
module load cce
spack install spack-install-package
