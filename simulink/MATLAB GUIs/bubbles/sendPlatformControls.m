function sendPlatformControls(x,y,z,P)
    global socket;
    fwrite(socket,swapbytes([x y z P]),'double');
end