#!/bin/bash

echo "starting build of spack-dummy-package"

export HOME=/home/ecptestb
#module load spack
. /soft/spack/spack-dev/share/spack/setup-env.sh
module load cce
spack install spack-dummy-package@ecp_spack_test
