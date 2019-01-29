function updateTemp(axeshandle,value)
    objTemp=get(axeshandle,'UserData');

    if(value<objTemp.minvalue)
        value=objTemp.minvalue;
    end

    if(value>objTemp.maxvalue)
        value=objTemp.maxvalue;
    end

    if(value==0)
        value=1;
    end

    y=objTemp.stepvalue*value;
    set(objTemp.rhandle,'Position',[0.65,0.1,0.25,y]);
end