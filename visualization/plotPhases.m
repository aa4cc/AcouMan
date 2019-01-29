function figHandle = plotPhases(phases)
% PLOTPHASES  Visualizes the phase delays
%  imageHandle = visPhases(phases)  The input argument can be 
%  a vector or a matrix with nxn elements. The function returns
%  the handle to the created image.
%
% See also IMAGESC
    arr_length = sqrt(numel(phases));
    assert(arr_length == round(arr_length),'Number of elements must be a square of an integer.')
    phasesToPrint= reshape(phases,arr_length,arr_length);
    phasesToPrint = mod(phasesToPrint, 2*pi);

    figHandle = imagesc(phasesToPrint);
     colorbar;
     colormap hsv;
     caxis([0 2*pi]);
     title('Phase delays')
 