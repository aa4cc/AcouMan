classdef PressurePoints < matlab.System ...
        & coder.ExternalDependency ...
        & matlab.system.mixin.Propagates ...
        & matlab.system.mixin.CustomIcon
    % This block solves the pressure points optimization problem every simulation step. You can enter multiple pressure points (i.e. coordinates with required pressure) as column vectors.
    %
    % This template includes most, but not all, possible properties,
    % attributes, and methods that you can implement for a System object in
    % Simulink.
    %
    %#codegen

    methods
        % Constructor
        function obj = PressurePoints(varargin)
            % Support name-value pair arguments when constructing the object.
            setProperties(obj,nargin,varargin{:});
        end
    end
    
    methods (Access=protected)

        function setupImpl(obj) 
            if isempty(coder.target)
                % Place simulation setup code here
            else
                coder.cinclude('pressurePoints.h');
            end
        end
        
        function phases = stepImpl(obj,x,y,z,reqP,initial)
            if isempty(coder.target)
                phases = pressurePoints(x,y,z,reqP,initial);
            else
                phases = zeros(64,1);
                coder.ceval('pressurePointsWrapper',coder.rref(x),coder.rref(y),coder.rref(z),coder.rref(reqP),numel(x),coder.rref(initial),coder.wref(phases));
            end
        end
        
        function releaseImpl(obj)

        end
    end
    
    methods (Access=protected)
        %% Define input properties
        function num = getNumInputsImpl(~)
            num = 5;
        end
        
        function num = getNumOutputsImpl(~)
            num = 1;
        end
        
        function flag = isInputSizeLockedImpl(~,~)
            flag = true;
        end
        
        function varargout = isInputFixedSizeImpl(~,~)
            varargout{1} = false;
        end
        
        function flag = isInputComplexityLockedImpl(~,~)
            flag = true;
        end
        
        function varargout = isOutputFixedSizeImpl(~)
            varargout{1} = true;
        end
        
        function sz = getOutputSizeImpl(~)
            sz = 64;
        end
        
        function type = getOutputDataTypeImpl(~)
            type = 'double';
        end
        
        function flag = isOutputComplexImpl(~)
            flag = false;
        end
        
        function validateInputsImpl(obj, in1, in2, in3, in4, in5)
            if isempty(coder.target)
                % Run input validation only in Simulation                
                %validateattributes(in1,{'numeric'});
                %validateattributes(in2,{'numeric'},{'size',[numel(in1),1]});
                %validateattributes(in3,{'numeric'},{'size',[numel(in1),1]});
                %validateattributes(in4,{'numeric'},{'size',[numel(in1),1]});
                validateattributes(in5,{'numeric'},{'size',[64,1]});
            end
        end
        
        function validatePropertiesImpl(obj)
        end
        
        function icon = getIconImpl(obj)
            % Define a string as the icon for the System block in Simulink.
                icon = sprintf('Pressure points\noptimization');
            
        end

        function [name1,name2,name3,name4,name5] = getInputNamesImpl(obj)
            % Return input port names for System block
            name1 = 'x';
            name2 = 'y';
            name3 = 'z';
            name4 = 'Required pressure';
            name5 = 'Initial condition';
        end

        function varargout = getOutputNamesImpl(obj)
            % Return output port names for System block
                varargout{1} = 'Phases';
        end
        
    end
    
    methods (Static, Access=protected)
        function header = getHeaderImpl
            % Define header panel for System block dialog
           header = matlab.system.display.Header(mfilename('class'), 'Title', PressurePoints.getDescriptiveName());
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
            name = 'Pressure points';
        end
        
        function b = isSupportedContext(context)
            b = context.isCodeGenTarget('rtw');
        end
        
        function updateBuildInfo(buildInfo, context)
            if context.isCodeGenTarget('rtw')
                % Update buildInfo
                includeDir = fullfile(fileparts(mfilename('fullpath')),'C');
                addIncludePaths(buildInfo,includeDir);
                % Use the following API's to add include files, sources and
                % linker flags
                addIncludeFiles(buildInfo,'pressurePoints.h',includeDir);
                addSourceFiles(buildInfo,'pressurePoints.cpp',includeDir);
                addIncludeFiles(buildInfo,'transducers.h',includeDir);
                %addLinkObjects(buildInfo,'sourcelib.a',srcDir);
                %addCompileFlags(buildInfo,{'-D_DEBUG=1'});
                %addDefines(buildInfo,'MY_DEFINE_1')
            end
        end
    end
end
