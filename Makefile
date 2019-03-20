
made: configured	
	$(CC) mpi_hello.c -o mpi_hello

configured: 
	touch configured

install: mpi_hello
	cp mpi_hello bin

clean:
	rm -rfv configured made installed

