classdef Levitation < matlab.System ...
        & coder.ExternalDependency ...
        & matlab.system.mixin.Propagates ...
        & matlab.system.mixin.CustomIcon
    % This block solves the levitation optimization problem every simulation step.
    %
    % This template includes most, but not all, possible properties,
    % attributes, and methods that you can implement for a System object in
    % Simulink.
    %
    %#codegen
    
    

    properties(Nontunable)
        % Sound velocity
        cp = 2350;
        % Density
        rhop = 29.36;
        % Radius
        rp = 1e-3;
        % Sound velocity
        c0 = 343;
        % Density
        rho0 = 1.2;
        % Absolute pressure
        wp = 0.1;
        % Spatial x-derivative of potential
        wx = 1500;
        % Spatial y-derivative of potential
        wy = 1500;
        % Spatial z-derivative of potential
        wz = 100;
    end

    properties(Access = private)
        % Angular frequency
        w = 2*pi*40000;
        % Particle volume
        Vp
        % Constants
        K1
        K2
    end
    
    

    methods
        % Constructor
        function obj = Levitation(varargin)
            % Support name-value pair arguments when constructing the object.
            setProperties(obj,nargin,varargin{:});
        end
    end
    
    methods (Access=protected)

        function setupImpl(obj) 
            % Particle volume
            obj.Vp = 4/3*pi*obj.rp^3;
            % Constants
            obj.K1 = 1/4*obj.Vp*((1/(obj.c0^2*obj.rho0))-(1/(obj.cp^2*obj.rhop)));
            obj.K2 = 3/4*obj.Vp*((obj.rho0-obj.rhop)/(obj.w^2*obj.rho0*(obj.rho0+2*obj.rhop)));
            if isempty(coder.target)
                % Place simulation setup code here
            else
                coder.cinclude('levitation.h');
            end
        end
        
        function phases = stepImpl(obj,x,y,z,initial)
            if isempty(coder.target)
                % pass
            else
                phases = zeros(64,1);
                coder.ceval('levitationWrapper',x,y,z,obj.K1,obj.K2...
                    ,obj.wp,obj.wx,obj.wy,obj.wz,coder.rref(initial),coder.wref(phases));
            end
        end
        
        function releaseImpl(obj)

        end
    end
    
    methods (Access=protected)
        %% Define input properties
        function num = getNumInputsImpl(~)
            num = 4;
        end
        
        function num = getNumOutputsImpl(~)
            num = 1;
        end
        
        function flag = isInputSizeLockedImpl(~,~)
            flag = true;
        end
        
        function varargout = isInputFixedSizeImpl(~,~)
            varargout{1} = true;
            varargout{2} = true;
            varargout{3} = true;
            varargout{4} = true;
        end
        
        function flag = isInputComplexityLockedImpl(~,~)
            flag = true;
        end
        
        function varargout = isOutputFixedSizeImpl(~)
            varargout{1} = true;
        end
        
        function varargout = getInputSizeImpl(~)
            varargout{1} = 1;
            varargout{2} = 1;
            varargout{3} = 1;
            varargout{4} = 64;
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
        
        function validateInputsImpl(obj, in1, in2, in3, in4)
            if isempty(coder.target)
                % Run input validation only in Simulation                
                validateattributes(in1,{'numeric'},{'size',[1,1]});
                validateattributes(in2,{'numeric'},{'size',[1,1]});
                validateattributes(in3,{'numeric'},{'size',[1,1]});
                validateattributes(in4,{'numeric'},{'size',[64,1]});
            end
        end
        
        function validatePropertiesImpl(obj)
        end
        
        function icon = getIconImpl(obj)
            % Define a string as the icon for the System block in Simulink.
                icon = sprintf('Levitation\noptimization');
            
        end

        function [name1,name2,name3,name4] = getInputNamesImpl(obj)
            % Return input port names for System block
            name1 = 'x';
            name2 = 'y';
            name3 = 'z';
            name4 = 'Initial condition';
        end

        function varargout = getOutputNamesImpl(obj)
            % Return output port names for System block
                varargout{1} = 'Phases';
        end
        
    end
    
    methods (Static, Access=protected)
        function header = getHeaderImpl
            % Define header panel for System block dialog
           header = matlab.system.display.Header(mfilename('class'), 'Title', Levitation.getDescriptiveName());
        end

        function group = getPropertyGroupsImpl
            % Define property section(s) for System block dialog
            particle = matlab.system.display.Section('Title','Particle','PropertyList',...
                {'cp','rhop','rp'});
            fluid = matlab.system.display.Section('Title','Carrier fluid','PropertyList',...
                {'c0','rho0'});
            weighs = matlab.system.display.Section('Title','Optimization weighs','PropertyList',...
                {'wp','wx','wy','wz'});
            group = [particle,fluid,weighs];
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
            name = 'Levitation';
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
                addIncludeFiles(buildInfo,'levitation.h',includeDir);
                addSourceFiles(buildInfo,'levitation.cpp',includeDir);
                addIncludeFiles(buildInfo,'objFunc.h',includeDir);
                addSourceFiles(buildInfo,'objFunc.cpp',includeDir);
                addIncludeFiles(buildInfo,'transducers.h',includeDir);
                %addLinkObjects(buildInfo,'sourcelib.a',srcDir);
                %addCompileFlags(buildInfo,{'-D_DEBUG=1'});
                %addDefines(buildInfo,'MY_DEFINE_1')
            end
        end
    end
end
