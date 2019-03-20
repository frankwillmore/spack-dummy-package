
made: configured	
	$(CC) mpi_hello.c -o mpi_hello -dynamic

configured: 
	touch configured

install: mpi_hello
	cp mpi_hello bin

clean:
	rm -rfv configured made installed

