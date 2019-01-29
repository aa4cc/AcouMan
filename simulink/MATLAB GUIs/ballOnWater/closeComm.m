function closeComm()
    global socket;
    fclose(socket);
    echoudp('off');
    delete(socket);
end