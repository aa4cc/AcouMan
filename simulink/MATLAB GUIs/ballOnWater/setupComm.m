function setupComm(IP, port)
    global socket;
    echoudp('on',port);
    socket = udp(IP,port);
    fopen(socket);
end