#!/usr/bin/make

#PREFIX:=tmp

made: configured	
	pwd
	$(CC) mpi_hello.c -o mpi_hello -dynamic

configured:
	pwd
	echo "PREFIX=$(PREFIX)"
	touch configured

install: mpi_hello
	pwd
	mkdir -p $(PREFIX)/bin
	cp mpi_hello $(PREFIX)/bin

clean:
	rm -rfv configured made installed mpi_hello check.mpi *.error *.output *.cobaltlog

check: mpi_hello install
	pwd
	echo "aprun -n 4 $(PWD)/$(PREFIX)/bin/mpi_hello" > check.mpi
	chmod +x check.mpi
	qsub -A Operations -n1 -t 5 -q default check.mpi
	

