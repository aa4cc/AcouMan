classdef Loader < matlab.System ...
        & coder.ExternalDependency ...
        & matlab.system.mixin.Propagates ...
        & matlab.system.mixin.CustomIcon
    % Loads platform configuration files
    %
    % This template includes most, but not all, possible properties,
    % attributes, and methods that you can implement for a System object in
    % Simulink.
    %
    %#codegen
    properties (Nontunable)
        % Path to correction file
        corrFile = 'correction.bin';
        % Path to rotation matrix file
        H_unFile = 'H_unrot.bin';
        % Path to platform height file
        heightFile = 'height.bin';
    end
    
    properties
        
    end
    
    properties (Nontunable, Logical)

    end

    properties(Constant, Hidden)
    end
    
    properties (Access = private)
        % Pre-computed constants.
    end
    
    methods
        % Constructor
        function obj = Loader(varargin)
            % Support name-value pair arguments when constructing the object.
            setProperties(obj,nargin,varargin{:});
        end
    end
    
    methods (Access=protected)

        function setupImpl(obj)
            if ~isempty(coder.target)
                coder.cinclude('loader.hpp');
                coder.ceval('loadUp',[obj.corrFile 0],[obj.H_unFile 0],[obj.heightFile 0]);
            end
        end
        
        function [corr,H_unrot,height] = stepImpl(obj)  
            corr = 0;
            H_unrot = zeros(3,3);
            height = 0;
            if ~isempty(coder.target)               
                corr = coder.ceval('getCorrection');
                coder.ceval('copyHUnrot',coder.wref(H_unrot));
                height = coder.ceval('getHeight');
            end
        end
        
        function releaseImpl(obj)

        end
    end
    
    methods (Access=protected)
        %% Define input properties
        function num = getNumInputsImpl(~)
            num = 0;
        end
        
        function num = getNumOutputsImpl(~)
            num = 3;
        end
        
        function varargout = getOutputSizeImpl(~)
            varargout{1} = 1;
            varargout{2} = [3,3];
            varargout{3} = 1;
        end
        
        function varargout = getOutputDataTypeImpl(~)
            varargout{1} = 'double';
            varargout{2} = 'double';
            varargout{3} = 'double';
        end
        
        function varargout = isOutputSizeLockedImpl(~,~)
            varargout{1} = true;
            varargout{2} = true;
            varargout{3} = true;
        end
        
        function varargout = isOutputFixedSizeImpl(~,~)
            varargout{1} = true;
            varargout{2} = true;
            varargout{3} = true;
        end
        
        function varargout = isOutputComplexImpl(~,~)
            varargout{1} = false;
            varargout{2} = false;
            varargout{3} = false;
        end
        
        function varargout = isOutputComplexityLockedImpl(~,~)
            varargout{1} = true;
            varargout{2} = true;
            varargout{3} = true;
        end
        
        
%         function validatePropertiesImpl(obj)
%         end
        
        function icon = getIconImpl(obj)
            % Define a string as the icon for the System block in Simulink.
            icon = sprintf('Loader');            
        end

        function varargout = getOutputNamesImpl(obj)
            varargout{1} = 'correction';
            varargout{2} = 'H_unrot';
            varargout{3} = 'height';
        end
    end
    
    methods (Static, Access=protected)
        function header = getHeaderImpl
            % Define header panel for System block dialog
           header = matlab.system.display.Header(mfilename('class'), 'Title', Loader.getDescriptiveName());
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
            name = 'MAT Loader';
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
                addSourceFiles(buildInfo,'loader.cpp',srcDir);
                %addCompileFlags(buildInfo,{'-D_DEBUG=1'});
                %addDefines(buildInfo,'MY_DEFINE_1')
            end
        end
    end
end
