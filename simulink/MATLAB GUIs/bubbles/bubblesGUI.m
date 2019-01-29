global x y z P coordLimit;
rpi = raspberrypi;
runModel(rpi,'bubbles')
setupComm('147.32.86.184',25000);
addpath('gauge');

x = 0;
y = 0;
z = 0.062;
P = 1500;
sendPlatformControls(-x,y,z,P)

coordLimit = 0.025;

monitors = get(0,'MonitorPositions');
if size(monitors,1) > 1
    mOffset = monitors(2,1:2);
    mRes = monitors(2,3:4);
else
    mOffset = monitors(1,1:2);
    mRes = monitors(1,3:4);
end
figPos = mOffset;
figWidth = mRes;

fig = figure('Name','Pressure control','MenuBar','none','ToolBar','none', ...
    'Units','pixels','outerposition',[figPos figWidth]);
set(fig,'WindowButtonDownFcn',@mClick);
set(fig,'WindowButtonUpFcn',@mRelease);
set(fig,'WindowScrollWheelFcn',@mWheel);
set(fig,'CloseRequestFcn',@(src,event) figClose(src,rpi));
ax1 = subplot(1,2,1);
scatter(x,y,500,'blue','o','filled');
set(ax1,'xlim',[-coordLimit, coordLimit],'ylim',[-coordLimit, coordLimit]);
title 'Position'
ax2 = subplot(1,2,2);
initTacho(ax2,1500,3000,30,5,5,'Pa')
title 'Pressure'
ax1.Position = [0.05 0.1 0.6 0.85];
ax2.Position = [0.65 0.325 0.3 0.35];

function mClick(src, ~)
    set(src,'WindowButtonMotionFcn',@mMove);
end

function mMove(src,~)
    global x y P z coordLimit;
    ax = get(src,'Children');
    ax1 = ax(2);
    mousePos = get(ax1, 'CurrentPoint');
    x = mousePos(1,1);
    y = mousePos(1,2);
    if x < -coordLimit
        x = -coordLimit;
    elseif x > coordLimit
        x = coordLimit;
    end
    if y < -coordLimit
        y = -coordLimit;
    elseif y > coordLimit
        y = coordLimit;
    end
    scplot = get(ax1,'Children');
    set(scplot,'XData',x,'YData',y);
    sendPlatformControls(-x,y,z,P)
end

function mWheel(src, event)
    global x y z P;
    P = P - 50*event.VerticalScrollCount;
    if P > 3000
        P = 3000;
    elseif P < 1500
        P = 1500;
    end
    ax = get(src,'Children');
    ax2 = ax(1);
    updateTacho(ax2,P);
    sendPlatformControls(-x,y,z,P);
end

function mRelease(src, ~)
    set(src,'WindowButtonMotionFcn',[]);
end

function figClose(fig,rpi)
    stopModel(rpi,'bubbles')
    closeComm
    delete(fig)
end