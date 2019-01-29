%% take an image of transducers
%rgb = RaspiImage('147.32.86.184', 1150, 'Processor', 'any');
detector = input('Enter the name of currently running detector: ','s');
rgb = RaspiImage_webserver('147.32.86.184',5001,detector);
figure(1)
r = rgb(:,:,1);
g = rgb(:,:,2);
b = rgb(:,:,3);
imshow(rgb);
% save as figure or keep it opened for calibration
%% calibration
% open calib_12_03_2018/trans_calib.fig  %%-- open the image of transducers
% keep it comented if the figure is already opened
msgbox('Mark the center of transducers as it is shown in caliborder.png','modal')
hold on
numofpoints = 16;
numofcrops = 1; %% number of zooms 1 or 2 is enough
colorArray = [1 0 1;0 1 1;1 0 0;0 1 0;0 0 1;1 1 1];
x_trans_marked = zeros(numofpoints,1);
y_trans_marked = zeros(numofpoints,1);
for i=1:numofpoints
    [x_trans_markedi, y_trans_markedi] = ginput(1);
    plot(x_trans_markedi, y_trans_markedi, 'y*');
    x_trans_marked(i) = x_trans_markedi;
    y_trans_marked(i) = y_trans_markedi;
end
for c = 1:numofcrops
    for i = 1:numofpoints 
    xlim([x_trans_marked(i)-(numofcrops-c+1)*30,x_trans_marked(i)+(numofcrops-c+1)*30])
    ylim([y_trans_marked(i)-(numofcrops-c+1)*30,y_trans_marked(i)+(numofcrops-c+1)*30])
    [x_trans_markedi, y_trans_markedi] = ginput(1);
     plot(x_trans_markedi, y_trans_markedi, 'y*','color',colorArray(c,:));
    x_trans_marked(i) = x_trans_markedi;
    y_trans_marked(i) = y_trans_markedi;
    end 
end  

% x_trans_real = [-1*(-0.035:0.01:0.035),-1*(-0.035:0.01:0.035),-1*(-0.035:0.01:0.035),-1*(-0.035:0.01:0.035),-1*(-0.035:0.01:0.035),-1*(-0.035:0.01:0.035),-1*(-0.035:0.01:0.035),-1*(-0.035:0.01:0.035)];
% y_trans_real = [0.035*ones(1,8),0.025*ones(1,8),0.015*ones(1,8),0.005*ones(1,8),-0.005*ones(1,8),-0.015*ones(1,8),-0.025*ones(1,8),-0.035*ones(1,8)] ;
x_trans_real = [-1*(-0.015:0.01:0.015),-1*(-0.015:0.01:0.015),-1*(-0.015:0.01:0.015),-1*(-0.015:0.01:0.015)];
y_trans_real = [0.015*ones(1,4),0.005*ones(1,4),-0.005*ones(1,4),-0.015*ones(1,4)] ;
zs1 = [x_trans_marked'; y_trans_marked'];
zs2 = [x_trans_real; y_trans_real];

H_unrot = vgg_H_from_x_lin(zs1,zs2); %% save the transformation matrix
% Hinv = inv(H_unrot);
