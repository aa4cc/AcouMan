function sendPlatformControls(x,y)
    global socket;
    fwrite(socket,swapbytes([x y]),'double');
end