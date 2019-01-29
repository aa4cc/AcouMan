function initTemp(axeshandle,minvalue,maxvalue,steps,substeps,unit)
    stepvalue=(maxvalue-minvalue)/steps;

    %set gca
    set(gcf,'CurrentAxes',axeshandle);

    %real world ratio
    set(axeshandle,'DataAspectRatio',[1 1 1]);
    %daspect([1,1,1]);

    %no axis shown
    axis off;

    %set boundaries
    axis([0 1 0 2]);

    %white background
    rectangle('Position',[0,-0.1,1,2.1],'FaceColor','w');

    for i=1:steps
        y=1.8/(steps) *i +0.1;

        if(mod(i,substeps))
            line([0.45 0.6],[y y],'Color','black');
        else
            line([0.4 0.6],[y y],'Color','black');
            text(0.1,y,num2str(i*stepvalue));
        end
    end

    %rectangle('Position',[0.65,0,0.25,2],'Curvature',[.8,.1],'FaceColor','w');
    %rhandle=rectangle('Position',[0.65,0,0.25,2],'Curvature',[.8,.1],'FaceColor','r');
    rectangle('Position',[0.65,0.1,0.25,1.8],'FaceColor','w');
    rhandle=rectangle('Position',[0.65,0.1,0.25,1.8],'FaceColor',[1 0.2 0.2]);
    text(0.1,0,unit,'VerticalAlignment','Bottom');

    objTemp.rhandle=rhandle;
    objTemp.minvalue=minvalue;
    objTemp.maxvalue=maxvalue;
    objTemp.steps=steps;
    objTemp.unit=unit;
    objTemp.stepvalue=1.8/(maxvalue-minvalue);

    set(axeshandle,'UserData',objTemp);

    %default value
    updateTemp(axeshandle,0);

end

