# AcouMan - a platform for acoustic manipulation

AcouMan is a platform for acoustic manipulation, that is for manipulating objects via shaping the surrounding acoustic pressure field. You can see the platform in the figure below and a detailed description will be (hopefully) published soon. If you want to see the platform in action, check our [video](https://youtu.be/Ntwl7yTYtKg) showing some experiments with the platform.

This repository contains all files needed to reproduce the platform.

* _MATLAB Optimization/_ folder contains Matlab scripts implementing a solver of the optimization problem where one looks for such phase shifts of the signals driving the transducer array that a given pressure point in space is generated
* _calibration/_ folder contains all scripts for calibrating the camera
* _manufacturing/_ folder contains all drawings for a laser cutter, 3D models and PCB designs for manufacturing the platform
* _simulink/_ folder contains Simulink schemes for controlling the platform in various modes
* _visualization/_ folder contains Matlab scripts for visualization of the generated pressure field by the transducer array driven by square waves with specified phase-shifts
* _webinterface/_ folder contains Python scripts for the web interface running on the Raspberry Pi

![Photos of the platform](docs/platfromCompo_annotateed.png)