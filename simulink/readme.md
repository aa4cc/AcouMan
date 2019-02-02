# Simulink models
[index](../README.md) \> [simulink](readme.md)

This document contains a description of the Simulink models and their usage.

## Simulink models

The models require the MATLAB system object from [raspi-ballpos](https://github.com/aa4cc/raspi-ballpos) to function. In addition, the compiler on the target device must have the [Eigen](http://eigen.tuxfamily.org/) and [LBFGS++](http://yixuan.cos.name/LBFGSpp/) libraries. All models are made to obtain reference or parameters via UDP. This can be done either using the simple MATLAB GUIs, or the Python [web interface](../webinterface/readme.md).

### All in one

This model implements all three models (bubbles, ball on solid surface, ball on water) with a switching system. It is created to be used with the [web interface](../webinterface/readme.md).

### Bubbles

This is a simple demonstration model. It creates a high-pressure point at a specified position.

### Ball on solid (dry) surface

This model implements a controller for positioning a ball on a dry surface. If the controller fails to stabilize the ball, check the calibration of the platform.

### Ball on water

This model implements a controller for positioning a floating ball. Ideally, the ball should be put in a transparent shallow container, such as a Petri dish, filled with water.

## GUIs 

The MATLAB GUIs are simple figures, set to appear on the secondary monitor. Check if the UDP port number in the .m files matches the UDP port number in the Simulink models.

All GUIs share similar controls. Dragging the circle changes position. In the 'bubbles' model, the mouse wheel changes the pressure intensity.

</html>