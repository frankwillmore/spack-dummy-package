
made: configured	
	touch made

configure: 
	touch configured

install: made
	touch installed

clean:
	rm -rfv configured made installed

