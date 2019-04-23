from spack import *


class SpackDummyPackage(MakefilePackage):
    """An mpi hello world that is packaged for spack."""

    homepage = "http://www.anl.gov"
    git      = "https://github.com/frankwillmore/spack-dummy-package.git"
    # git      = "https://ecpci.alcf.anl.gov/ecp-test/spack-dummy-package.git"

    # version('1.2.3', '0123456789abcdef0123456789abcdef')
    version('master', branch='master')

    depends_on('mpi')

    def edit(self, spec, prefix):
        env['PREFIX'] = prefix

    def install(self, spec, prefix):
        # print("Got prefix = " + prefix)
        # configure("--prefix={0}", format(prefix))
        make()
        make('install')
        make('check')
