#!/usr/bin/make

CC ?= mpicc
PREFIX ?= tmp
MPIRUN ?= mpirun
BATCH_COMMAND ?= "qsub -A Operations -n1 -t 5 -q default check.mpi"

mpi_hello: 
	echo "using:  CC=${CC}"
	echo "        PREFIX=${PREFIX}"
	echo "        MPIRUN=${MPIRUN}"
	${CC} mpi_hello.c -o mpi_hello 

check: mpi_hello
	${MPIRUN} -n 4 ./mpi_hello

install: check
	mkdir -p ${PREFIX}/bin
	cp mpi_hello ${PREFIX}/bin

check-batch: install 
	echo "${MPIRUN} -n 4 $(pwd)/mpi_hello" > check.mpi
	chmod +x check.mpi
	${BATCH_COMMAND}

clean:
	rm -rfv tmp mpi_hello check.mpi *.error *.output *.cobaltlog
