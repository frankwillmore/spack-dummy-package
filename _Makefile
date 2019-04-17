
default: mpi_hello.c	
	$(CC) -craype-verbose mpi_hello.c -o mpi_hello -dynamic

install: mpi_hello
	mkdir -p $(PREFIX)/bin
	cp mpi_hello $(PREFIX)/bin

clean:
	rm -rfv configured made installed mpi_hello check.mpi *.error *.output *.cobaltlog

check: mpi_hello install
	echo "aprun -n 4 $(PWD)/$(PREFIX)/bin/mpi_hello" > check.mpi
	chmod +x check.mpi
#	this subs the job, but we may not be on a head node
#	qsub -A Operations -n1 -t 5 -q default check.mpi
	

