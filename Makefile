made: configured	
	$(CC) mpi_hello.c -o mpi_hello -dynamic

configured:
	echo "PREFIX=$(PREFIX)"
	touch configured

install: mpi_hello
	cp mpi_hello bin

clean:
	rm -rfv configured made installed

