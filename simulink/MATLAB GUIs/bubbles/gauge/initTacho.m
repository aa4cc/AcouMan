function initTacho(axeshandle,minvalue,maxvalue,steps,substeps,textsteps,unit)%unit ist beschriftung
    %value increment with one step
    stepvalue=(maxvalue-minvalue)/steps;
    stepangle=1.5*pi/steps;

    %set gca
    set(gcf,'CurrentAxes',axeshandle);

    %real world ratio
    set(axeshandle,'DataAspectRatio',[1 1 1]);

    %no axis shown
    axis off;

    %set boundaries
    axis([-1.1 1.1 -1.1 1.1]);

    %white background
    rectangle('Position',[-1.1,-1.1,2.2,2.2],'Curvature',[1,1],'FaceColor','w');

    %create tacho object
    objTacho.linehandle=line('linewidth',2,'xdata',[0 cos(1.25*pi)],'ydata',[0 sin(1.25*pi)]);
    objTacho.axeshandle=axeshandle;
    objTacho.minvalue=minvalue;
    objTacho.maxvalue=maxvalue;
    objTacho.stepvalue=stepvalue;
    objTacho.stepangle=stepangle;
    objTacho.steps=steps;
    objTacho.unit=unit;

    %create scala
    for i=0:steps
        %the curent angle
        %phi=1.5*pi/steps*(steps-i)-0.25*pi;
        phi=-1.5*pi/steps*i+1.25*pi;

        x=cos(phi);
        y=sin(phi);

        %long or short scala lines?
        if(mod(i,substeps))
            line([0.95*x x],[0.95*y y]);
        else
            line([0.9*x x],[0.9*y y]);
        end

        %print values
        if(~mod(i,textsteps))
            text(x*0.7,y*0.7,num2str(i*stepvalue+minvalue),'HorizontalAlignment','center');
        end
    end

    text(0,-0.3,unit,'HorizontalAlignment','center');

    set(axeshandle,'UserData',objTacho);

    %default value
    updateTacho(axeshandle,0);
end