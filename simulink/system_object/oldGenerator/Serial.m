classdef Serial < matlab.System ...
        & coder.ExternalDependency ...
        & matlab.system.mixin.Propagates ...
        & matlab.system.mixin.CustomIcon
    % Handles sending phase delays and turning outputs on/off
    %
    % This template includes most, but not all, possible properties,
    % attributes, and methods that you can implement for a System object in
    % Simulink.
    %
    %#codegen
    properties
        % Public, tunable properties.
    end
    
    properties (Nontunable)
        % Port Port name
        Port = '/dev/ttyUSB0';
        % Baud Baud rate
        Baud = 19200;
    end
    
    properties (Nontunable, Logical)
        % Trigger=false;
        % Collect meassured currents
        %Currents=false;
        % Optimized comunication
        %OptimizedComunication=false;
        % Green LED Off
        %GreenLedOff=false;
    end

%     properties(DiscreteState)
%         phasesPrev;
%         onOffPrev;
%     end

    properties(Constant, Hidden)
        %ModeSet = matlab.system.StringSet({'PWM','Currents'});
        %BaudSet = matlab.system.StringSet({'230400','1500000'});
    end
    
    properties (Access = private)
        % Pre-computed constants.
    end
    
    methods
        % Constructor
        function obj = Serial(varargin)
            % Support name-value pair arguments when constructing the object.
            setProperties(obj,nargin,varargin{:});
        end
    end
    
    methods (Access=protected)

        function setupImpl(obj) 
            if isempty(coder.target)
                % Place simulation setup code here
            else
                coder.cinclude('akulev.h');
                % Call C-function implementing device initialization
                if ~isempty(obj.Port)
                    coder.ceval('akulev_open', [obj.Port 0], int32(obj.Baud));
                end
                coder.ceval('akulev_setFreq',40);
                coder.ceval('akulev_setPhases',zeros(64,1));
                coder.ceval('akulev_off');
                %obj.phasesPrev = zeros(63,1);
                %obj.onOffPrev = false;
            end
        end
        
        function stepImpl(obj,phases,onOff)  
            if isempty(coder.target)
                if onOff
                    acousticPressureSlice(phases,16,[-0.03,0.03],151,[-0.03,0.03],151,0.06,1);
                end
            else
                %if ~isequal(phases,obj.phasesPrev)
                    coder.ceval('akulev_setPhases',phases);
                %end
                %if ~isequal(onOff,obj.onOffPrev)
                    if onOff
                        coder.ceval('akulev_on');
                    else
                        coder.ceval('akulev_off');
                    end
                %end
%                 obj.phasesPrev = phases;
%                 obj.onOffPrev = onOff;
            end
        end
        
        function releaseImpl(obj)
            if isempty(coder.target)
                % Place simulation termination code here
            else
                % Call C-function implementing device termination
                coder.ceval('akulev_off');
                %coder.ceval('sink_terminate');
            end
        end
    end
    
    methods (Access=protected)
        %% Define input properties
        function num = getNumInputsImpl(~)
            num = 2;
        end
        
        function num = getNumOutputsImpl(~)
            num = 0;
        end
        
        function flag = isInputSizeLockedImpl(~,~)
            flag = true;
        end
        
        function varargout = isInputFixedSizeImpl(~,~)
            varargout{1} = true;
        end
        
        function flag = isInputComplexityLockedImpl(~,~)
            flag = true;
        end
        
        function validateInputsImpl(obj, in1, in2)
            if isempty(coder.target)
                % Run input validation only in Simulation                
                validateattributes(in1,{'numeric'},{'size',[64,1]});
                validateattributes(in2,{'logical'},{'size',[1,1]});
            end
        end
        
        function validatePropertiesImpl(obj)
        end
        
        function icon = getIconImpl(obj)
            % Define a string as the icon for the System block in Simulink.
            if ~isempty(obj.Port)
                icon = sprintf('64 phase generator\n Port: %s\n Baudrate: %d', obj.Port, obj.Baud);
            else
                icon = sprintf('64 phase generator');
            end
            
        end

        function [name,name2] = getInputNamesImpl(obj)
            % Return input port names for System block
            name = 'phases';
            name2 = 'On/Off';
        end

%         function varargout = getOutputNamesImpl(obj)
%             % Return output port names for System block
%             if obj.Currents
%                 varargout{1} = 'Currents';
%             end
%         end
    end
    
    methods (Static, Access=protected)
        function header = getHeaderImpl
            % Define header panel for System block dialog
           header = matlab.system.display.Header(mfilename('class'), 'Title', Serial.getDescriptiveName());
        end

        function simMode = getSimulateUsingImpl(~)
            simMode = 'Interpreted execution';
        end

        function flag = showSimulateUsingImpl
            % Return false if simulation mode hidden in System block dialog
            flag = false;
        end
    end
    
    methods (Static)
        function name = getDescriptiveName()
            name = '64 phase generator control';
        end
        
        function b = isSupportedContext(context)
            b = context.isCodeGenTarget('rtw');
        end
        
        function updateBuildInfo(buildInfo, context)
            if context.isCodeGenTarget('rtw')
                % Update buildInfo
                srcDir = fullfile(fileparts(mfilename('fullpath')),'src'); 
                includeDir = fullfile(fileparts(mfilename('fullpath')),'include');
                addIncludePaths(buildInfo,includeDir);
                % Use the following API's to add include files, sources and
                % linker flags
                addIncludeFiles(buildInfo,'akulev.h',includeDir);
                addSourceFiles(buildInfo,'akulev.c',srcDir);
                addLinkFlags(buildInfo,{'-lwiringPi'});
                %addLinkObjects(buildInfo,'sourcelib.a',srcDir);
                %addCompileFlags(buildInfo,{'-D_DEBUG=1'});
                %addDefines(buildInfo,'MY_DEFINE_1')
            end
        end
    end
end
