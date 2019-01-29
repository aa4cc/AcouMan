function updateTacho(axeshandle,value)
    objTacho=get(axeshandle,'UserData');

    if(value<objTacho.minvalue)
        value=objTacho.minvalue;
    end

    if(value>objTacho.maxvalue)
        value=objTacho.maxvalue;
    end

    phi=-objTacho.stepangle*(value-objTacho.minvalue)/objTacho.stepvalue+1.25*pi;
    set(objTacho.linehandle,'xdata',[0 cos(phi)],'ydata',[0 sin(phi)]);
end