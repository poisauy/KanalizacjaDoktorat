function setup_channels

global vars handles

handles.chanwindow = figure('Visible','off', 'Resize','off', ...
    'NumberTitle','off','MenuBar','none');
clf, whitebg(gcf,[0 0 0])
width = 320; height = 250;
pos = get(gcf,'Position');
set(gcf,'Units','pixels','Position',[pos(1:2) width height])
set(gcf,'Name','Channels')
set(gcf, 'CloseRequestFcn', 'callbacks(22)');
cla, axis off
set(gca,'Units','pixels','Position',[0 0 width height])
axis([1 width 1 height])

xinit = 10; xi = xinit; xinc = 80; xtinc = 150; xind=20; xpinc = 100;
yinit = height -20; yi = yinit; yinc = -25;
dfmt = '%4.1f';
gfmt = '%5.4f';

text(110,yi,'Channels','FontSize',20,'Color',[0.2 0.8 0.2])
yi=yi-50;
buttonwidth = 20; buttonheight = 20;



make_passive_channel(xi,yi,'passNa','passive g_{Na} (\mu{}S)',0.0265e-6,gfmt)
yi = yi + yinc;

make_passive_channel(xi,yi,'passK','passive g_{K} (\mu{}S)',0.07e-6,gfmt)
yi = yi + yinc;

make_passive_channel(xi,yi,'passCl','passive g_{Cl} (\mu{}S)',0.1e-6,gfmt)
yi = yi + yinc;

handles.HH_Na_gates = make_vgated_channel('HH_Na', 'Fast Sodium', 1, 1, ...
    xi, yi, 120e-6, ...
    'm', 0.068775, 3,  ...
        2, 0.1, -40, -0.1, ...
	1, 4.0, -65, -1/18, ...
    'h', 0.515186, 1, ...
	1, 0.07, -65, -1/20, ...
	3, 1, -35, -0.1);
yi = yi + yinc;

handles.HH_K_gates = make_vgated_channel('HH_K', 'Delayed Rectifier', 1, 2, ...
    xi, yi, 36e-6, ...
    'n', 0.35286656, 4, ...
	2, .01, -55, -0.1, ...
	1, 0.125, -65, -1/80, ...
    '', NaN, 0, ...
	4, 0, 0, 0, ...
	4, 0, 0, 0);
yi = yi + yinc;

handles.HH_user1_gates = make_vgated_channel('HH_user1', 'User Channel', 0, 4, ...
    xi, yi, 0, ...
    'p', NaN, 0, ...
	4, 0, 0, 0, ...
        4, 0, 0, 0, ...
    'q', NaN, 0, ...
	4, 0, 0, 0, ...
	4, 0, 0, 0);
yi = yi + yinc;

make_valtext('',420,600,'%s','copy parameters from');
handles.HH_user1.copy_popup = ...
  uicontrol('Style','PopUp','String',{'-','Fast Sodium','Delayed Rectifier'},'Value',1, ...
	'Units','pixel','Position',[420 570 130 20], ...
	'Tooltips','Select a channel from which to copy parameters', ...
	'BackgroundColor','y','CallBack','copy_channel_params');

set(0,'CurrentFigure',handles.chanwindow)

uicontrol('Style','PushButton','Position',[1 1 40 20],'String','Reset', ...
	'Callback','callbacks(21)')

uicontrol('Style','PushButton','Position',[51 1 40 20],'String','Hide', ...
	'Callback','callbacks(22)')

