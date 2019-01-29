function image = RaspiImage_webserver(server, port, detector)
%RASPIIMAGE Retrieves image from raspi-ballpos webserver
%   Detailed explanation goes here
    image = webread(sprintf('http://%s:%d/image/%s/image', server, port, detector));
end

