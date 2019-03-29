from spack import *


class SpackDummyPackageGit(MakefilePackage):
    """FIXME: Put a proper description of your package here."""

    # FIXME: Add a proper url for your package's homepage here.
    homepage = "http://www.example.com"
    #url      = "https://gitlab.alcf.anl.gov/willmore/spack-dummy-package.git"
    git      = "https://gitlab.alcf.anl.gov/willmore/spack-dummy-package.git"

    # FIXME: Add proper versions and checksums here.
    # version('1.2.3', '0123456789abcdef0123456789abcdef')
    version('master', branch='master')

    # FIXME: Add dependencies if required.
    # depends_on('foo')
    depends_on('mpi')

    def edit(self, spec, prefix):
        env['PREFIX'] = prefix

    def install(self, spec, prefix):
        # FIXME: Unknown build system
        print("Got prefix = " + prefix)
        configure("--prefix={0}", format(prefix))
        make()
        make('install')