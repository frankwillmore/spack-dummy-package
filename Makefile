#!/usr/bin/make

PREFIX?=tmp
MPIRUN?=mpirun
CC?=mpicc
BATCH_COMMAND?="qsub -A Operations -n1 -t 5 -q default check.mpi"

default: configured	
	${CC} mpi_hello.c -o mpi_hello -shared -fPIC

configured:
	echo "PREFIX=$(PREFIX)"
	touch configured

install: mpi_hello
	mkdir -p ${PREFIX}/bin
	cp mpi_hello ${PREFIX}/bin

clean:
	rm -rfv configured made installed mpi_hello check.mpi *.error *.output *.cobaltlog

check: mpi_hello install
	pwd
	${MPIRUN} -n 4 ${PREFIX}/bin/mpi_hello

check-batch: mpi_hello install 
	echo "${MPIRUN} -n 4 ${PREFIX}/bin/mpi_hello" > check.mpi
	chmod +x check.mpi
	${BATCH_COMMAND}
	

