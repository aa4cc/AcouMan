global x y coordLimit;
rpi = raspberrypi;
runModel(rpi,'ballOnWater')
setupComm('147.32.86.184',25000);

x = 0;
y = 0;
sendPlatformControls(-x,y)

coordLimit = 0.0125;
monitors = get(0,'MonitorPositions');
if size(monitors,1) > 1
    mOffset = monitors(2,1:2);
    mRes = monitors(2,3:4);
else
    mOffset = monitors(1,1:2);
    mRes = monitors(1,3:4);
end
figPos = mOffset + [mRes(1)*0.2 0];
figWidth = [mRes(1)*0.6 mRes(2)];

fig = figure('Name','Ball controls','MenuBar','none','ToolBar','none', ...
    'Units','pixels','outerposition',[figPos figWidth]);
set(fig,'WindowButtonDownFcn',@mClick);
set(fig,'WindowButtonUpFcn',@mRelease);
set(fig,'CloseRequestFcn',@(src,event) figClose(src,rpi));
ax = axes();
scatter(x,y,1000,'red','o','filled');
set(ax,'xlim',[-coordLimit, coordLimit],'ylim',[-coordLimit, coordLimit]);
title 'Position'

function mClick(src, ~)
    set(src,'WindowButtonMotionFcn',@mMove);
end

function mMove(~,~)
    global x y coordLimit;
    mousePos = get(gca, 'CurrentPoint');
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
    scplot = get(gca, 'Children');
    set(scplot,'XData',x,'YData',y);
    sendPlatformControls(-x,y)
end

function mRelease(src, ~)
    set(src,'WindowButtonMotionFcn',[]);
end

function figClose(fig,rpi)
    stopModel(rpi,'ballOnWater')
    closeComm
    delete(fig)
end