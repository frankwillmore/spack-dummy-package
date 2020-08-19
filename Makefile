#!/usr/bin/make

CC?=mpicc
PREFIX?=tmp
MPIRUN?=mpirun
BATCH_COMMAND?="qsub -A Operations -n1 -t 5 -q default check.mpi"

mpi_hello: 
	echo "using:  CC=${CC}"
	echo "        PREFIX=${PREFIX}"
	echo "        MPIRUN=${MPIRUN}"
	${CC} mpi_hello.c -o mpi_hello 

install: mpi_hello
	mkdir -p ${PREFIX}/bin
	cp mpi_hello ${PREFIX}/bin

clean:
	rm -rfv tmp mpi_hello check.mpi *.error *.output *.cobaltlog

check: install
	${MPIRUN} -n 4 ${PREFIX}/bin/mpi_hello

check-batch: install 
	echo "${MPIRUN} -n 4 ${PREFIX}/bin/mpi_hello" > check.mpi
	chmod +x check.mpi
	${BATCH_COMMAND}
	

