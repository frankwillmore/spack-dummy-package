made: configured	
	$(CC) mpi_hello.c -o mpi_hello -dynamic

configured:
	echo "PREFIX=$(PREFIX)"
	echo INSTALL$(INSTALL)
	echo DESTDIR=$(DESTDIR)
	echo $(CC), $(CXX), $(F77), and $(FC)

	touch configured

install: mpi_hello
	cp mpi_hello $(PREFIX)/bin

clean:
	rm -rfv configured made installed

