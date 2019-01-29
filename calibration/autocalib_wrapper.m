detector = input('Enter the name of currently running detector: ','s');
image = RaspiImage_webserver('147.32.86.184',5001,detector);
H_unrot = autocalib(image);