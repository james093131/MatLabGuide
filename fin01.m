function varargout = fin01(varargin)
% FIN01 MATLAB code for fin01.fig
%      FIN01, by itself, creates a new FIN01 or raises the existing
%      singleton*.
%
%      H = FIN01 returns the handle to a new FIN01 or the handle to
%      the existing singleton*.
%
%      FIN01('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIN01.M with the given input arguments.
%
%      FIN01('Property','Value',...) creates a new FIN01 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before fin01_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to fin01_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help fin01

% Last Modified by GUIDE v2.5 04-Oct-2019 16:20:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @fin01_OpeningFcn, ...
                   'gui_OutputFcn',  @fin01_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before fin01 is made visible.
function fin01_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to fin01 (see VARARGIN)

% Choose default command line output for fin01
handles.output = hObject;
% Update handles structure
imag=imread('temp2.jpg');
power=imread('power1.jpg');
vib=imread('vib1.jpg');
I4=imresize(imag,1/7);
I5=imresize(power,1/7);
I6=imresize(vib,1/7);
set(handles.tempicon1,'cdata',I4);
set(handles.tempicon2,'cdata',I4);
set(handles.power1,'cdata',I5);
set(handles.power2,'cdata',I5);
set(handles.vbicon1,'cdata',I6);
set(handles.vbicon2,'cdata',I6);
set(handles.powertxt,'position',[72,22.5,4,1]);
set(handles.motortemptxt,'position',[62,34,8,1]);
set(handles.bearingtemptxt,'position',[54,27,8,1]);
set(handles.motorvbtxt,'position',[78,34,8,1]);
set(handles.bearingvbtxt,'position',[85,27,8,1]);
set(handles.powerscore,'position',[70.5,20.5,8,1.5]);
set(handles.motortempscore,'position',[59,32,8,1.5]);
set(handles.bearingtempscore,'position',[54,25.5,8,1.5]);
set(handles.bearingvbscore,'position',[85,25.5,8,1.5]);
set(handles.motorvbscore,'position',[82,32,8,1.5]);



clear s;
global s;
clear s1;
global s1;
clear s2;
global s2;
clear s3
global s3;
clear c;
global c;
clear speed;
global speed;
s= serial('/dev/cu.usbmodem142101'); %%motor temp power
set(s,'BaudRate',9600); 
s3= serial('/dev/cu.usbmodem142401'); %%bearing temp
set(s3,'BaudRate',9600); 
s1= serial('/dev/cu.usbmodem142201'); %%bearing vib
set(s1,'BaudRate',115200);
s2= serial('/dev/cu.usbmodem142301'); %%motor vib
set(s2,'BaudRate',115200);
c=1;
fclose(instrfind);
axes(handles.radarplot)
radarplot([100 100 100 100 100],{},{'k'},{''},{'-'});
guidata(hObject, handles);

% UIWAIT makes fin01 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = fin01_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global s;
global s1;
global s2;
global s3;
global c;
global speed;
fprintf('%f\n',speed);
fid = fopen('database.txt','a');
date=datestr(now); 
fprintf(fid,'%s \r\n',date);
c=1;
fopen(s);
fopen(s1);
fopen(s2);
fopen(s3);
x=0;
y=0;
z=0;
i=0;
set(handles.tempicon1,'visible','on');
set(handles.tempicon1,'position',[49,33,10,5]);
set(handles.power1,'visible','on');
set(handles.power1,'position',[69,15,10,5]);
set(handles.vbicon1,'visible','on');
set(handles.vbicon1,'position',[90,33,10,5]);
set(handles.finalscore,'visible','on');

set(handles.powertxt,'visible','on');
set(handles.motortemptxt,'visible','on');
set(handles.bearingtemptxt,'visible','on');
set(handles.motorvbtxt,'visible','on');
set(handles.bearingvbtxt,'visible','on');
set(handles.motorvb,'position',[-50,0,0,0]);
set(handles.bearingvb,'position',[-50,0,0,0]);
%%beginning vib
for j=1:1024
data1(j)=str2num(fgetl(s1));
end
for fre=1:1024
data2(fre)=str2num(fgetl(s2));
end
while(true)
%new
com6array1=1:3;
com6array2=1:3; 
com6array3=1:2;
com6array4=1:2;
unit=0:1;
for i=1:40
if rem(i,2)==0
com6array1=str2num(fgetl(s));
com6array3=str2num(fgetl(s3));
%%fprintf('sec=%f(s) Motor Temperature=%f(℃) Power=%f(W)\n',com6array1(1)/1000,com6array1(2),com6array1(3));
time=com6array1(1)/1000;
beartemp=com6array3(2);
a=com6array1(2);
b=com6array1(3);
else
com6array2=str2num(fgetl(s));    
com6array4=str2num(fgetl(s3));
%%fprintf('sec=%f(s) Motor Temperature=%f(℃) Power=%f(W)\n',com6array2(1)/1000,com6array2(2),com6array2(3));
time=com6array2(1)/1000;
beartemp=com6array4(2);
a=com6array2(2);
b=com6array2(3);

end
x=com6array1(1)/1000+(com6array2(1)/1000-com6array1(1)/1000)*unit;%時間
y=com6array1(3)+(com6array2(3)-com6array1(3))*unit;%功率
z=com6array1(2)+(com6array2(2)-com6array1(2))*unit;%溫度
x1=com6array3(1)/1000+(com6array4(1)/1000-com6array3(1)/1000)*unit;%beartime
z1=com6array3(2)+(com6array4(2)-com6array3(2))*unit;%溫度
axes(handles.mixtem)
plot(x,z,'Color',[0.57 0.57 0.57],'LineWidth',1.5);
plot(x1,z1,'Color',[0.02 0.2 0.99],'LineWidth',1.5);
ylim([0 100])
grid on;
drawnow;
hold on;
if(time>20)
   xlim([time-20 time])
end
guidata(hObject, handles);

%end
axes(handles.power)
plot(x,y,'k','LineWidth',1.5);
xlabel('time(s)');
ylabel('Power(W)'); 
ylim([0 5000])
hold on;
grid on;
drawnow;
if(time>20)
   xlim([time-20 time])
end
guidata(hObject, handles);


%new end
fs=1070;N=1024; 
n=0:N-1;
x=data1(n+1); 
x1=data2(n+1);
y=fft(x,N); 
y1=fft(x1,N);
f= (fs*n)/N;
P = abs(y);
P1 = abs(y1);
P3=P1(97:512);
P4=P(97:512);


motor_max_value=max(P3);
bearing_max_value=max(P4);


axes(handles.motorvb)
plot(f(1:N/2),P1(1:N/2)) 
xlabel('Frequency (Hz)')
ylabel('振幅')
title('Motor')
xlim([100 535])
ylim([0 3])
grid on;
drawnow;
guidata(hObject, handles);
%end
%bearingvb axes
axes(handles.bearingvb)
plot(f(1:N/2),P(1:N/2)) 
xlabel('Frequency (Hz)')
ylabel('振幅')
title('Bearing')
xlim([100 535])
ylim([0 3])
grid on;
drawnow;
guidata(hObject, handles);
for j=2:N
   data1(j-1)=data1(j);
end
for fre=2:N
   data2(fre)=data2(fre);
end
data1(N)=str2num(fgetl(s1));
data2(N)=str2num(fgetl(s2));
%bearingvb axes end
%tempscore
tempscore01=104+0.0159*a +-0.0101*a^2;
tempscore02=120-beartemp;
powerscore=standard(speed,b);
motorscore=maxvalue(motor_max_value);
bearingscore=maxvalue(bearing_max_value);
fprintf('%f\n',motorscore);
%end 
%radarplot start 
%%power
finalscore=final(tempscore01,tempscore02,powerscore,motorscore,bearingscore);
set(handles.finalscore,'String',finalscore);
set(handles.powerscore,'String',powerscore);
set(handles.motortempscore,'String',tempscore01);
set(handles.bearingtempscore,'String',tempscore02);
set(handles.bearingvbscore,'String',bearingscore);
set(handles.motorvbscore,'String',motorscore);
%%database
fprintf(fid,' motorvb:%f bearvb:%f motortemp:%f beartemp:%f power:%f \r\n',motor_max_value,bearing_max_value,a,beartemp,b);


z=[100 100 100 100 100 ; motorscore bearingscore powerscore tempscore02 tempscore01];
coldef=colordefine(z);
axes(handles.radarplot)
radarplot(z,{},{'k',coldef},{'',coldef},{'-','w'});
drawnow();
clear a;
clear b;
clear k;
clear d;
clear e;
hold off;
%end
if (c == -1)
    hold off;
        break;
end

end
end
%mix vib end


% --- Executes on button press in tempicon1.
function tempicon1_Callback(hObject, eventdata, handles)
    set(handles.mixtem,'position',[10,30,30,10] );
    set(handles.tempicon2,'visible','on');
    set(handles.tempicon1,'position',[0,0,0,0]);
    set(handles.tempicon2,'position',[49,33,10,5]);
% hObject    handle to tempicon1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in tempicon2.
function tempicon2_Callback(hObject, eventdata, handles)
set(handles.mixtem,'position',[0,0,0,0]);
set(handles.tempicon1,'position',[49,33,10,5]);
set(handles.tempicon2,'position',[0,0,0,0]);
% hObject    handle to tempicon2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in vbicon1.
function vbicon1_Callback(hObject, eventdata, handles)
set(handles.motorvb,'position',[110,30,30,10]);
set(handles.bearingvb,'position',[110,15,30,10]);
set(handles.vbicon2,'visible','on');
set(handles.vbicon1,'position',[0,0,0,0]);
set(handles.vbicon2,'position',[90,33,10,5]);
% hObject    handle to vbicon1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in vbicon2.
function vbicon2_Callback(hObject, eventdata, handles)
set(handles.motorvb,'position',[-50,0,0,0]);
set(handles.bearingvb,'position',[-50,0,0,0]);
set(handles.vbicon1,'position',[90,33,10,5]);
set(handles.vbicon2,'position',[0,0,0,0]);
% hObject    handle to vbicon2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in power1.
function power1_Callback(hObject, eventdata, handles)
set(handles.power,'position',[10,15,30,10]);
set(handles.power2,'visible','on');
set(handles.power1,'position',[0,0,0,0]);
set(handles.power2,'position',[69,15,10,5]);
% hObject    handle to power1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in power2.
function power2_Callback(hObject, eventdata, handles)
set(handles.power,'position',[0,0,0,0]);
set(handles.power1,'position',[69,15,10,5]);
set(handles.power2,'position',[0,0,0,0]);
% hObject    handle to power2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
global c;
global s;
global s1;
global s2;
global s3;
global speed;
c=-1;
clear speed;
set(handles.Speed,'String','Speed');
set(handles.finalscore,'visible','off');
cla(handles.mixtem);
cla(handles.motorvb);
cla(handles.power);
cla(handles.bearingvb);
axes(handles.radarplot)
cla(handles.radarplot)
radarplot([100 100 100 100 100],{},{'k'},{''},{'-'});
fclose(s);
fclose(s1);
fclose(s2);
fclose(s3);
set(handles.tempicon1,'visible','off');
set(handles.tempicon2,'visible','off');
set(handles.power1,'visible','off');
set(handles.power2,'visible','off');
set(handles.vbicon1,'visible','off');
set(handles.vbicon2,'visible','off');
set(handles.powertxt,'visible','off');
set(handles.motortemptxt,'visible','off');
set(handles.bearingtemptxt,'visible','off');
set(handles.motorvbtxt,'visible','off');
set(handles.bearingvbtxt,'visible','off');
set(handles.powerscore,'visible','off');
set(handles.motortempscore,'visible','off');
set (handles.power,'position',[0,0,0,0] );
set(handles.mixtem,'position',[0,0,0,0] );
set(handles.motorvb,'position',[-50,0,0,0]);
set(handles.bearingvb,'position',[-50,0,0,0]);
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pause.
function pause_Callback(hObject, eventdata, handles)
global c;
global s;
global s1;
global s2;
global s3;
c=-1;
fclose(s);
fclose(s1);
fclose(s2);
fclose(s3);
% hObject    handle to pause (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
function f=radarplot(R,Lable,LineColor,FillColor,LineStyle,LevelNum)
%Creates a radar (spider) plot for multi-data series.
%edit by Cheng Li
%Tsinghua University

%INPUT: 
%R

%R=[ 7 8 9 10 11;5 6 7 9 9;7 9 9 9 2];
%   Data, if R is a m*n matrix, means m samples with n options

%Label
%   Label, Label of options
%	Cells of string
%Label={'O','1'}
%LineColor
%	Color of Line
%	Cells of MatLab colors
%
%LineColor={'r','g'}
%FillColor
%	Cells of MatLab colors
%
%FillColor={'r','y','g'}
%LineStyle
%	Cells of MatLab colors
%
%LineStyle={'no',':'}
%LevelNum
%	number of axis's levels
%
%LevelNum={5}
%Example:
%radarplot([1 2 3 4 5 6])
%radarplot([1 2 3 4 5 6;7 8 9 10 11 12.5])
%radarplot([1 2 3 4 5 6;7 8 9 10 11 12.5],{'option1','','','','',''},{'r','g'})
%radarplot([1 2 3 4 5 6;7 8 9 10 11 12.5],{'option1','','','','',''},{},{'b','r'})
%radarplot([1 2 3 4 5 6;7 8 9 10 11 12.5],{'option1','','','','',''},{'r','g'})
%radarplot([1 2 3 4 5 6;7 8 9 10 11 12.5],{'option1','','','','',''},{'r','g'},{'b','r'},{'no',':'}
%radarplot([1 2 3 4 5 6;7 8 9 10 11 12.5],{'option1','a','b','c','','e'},{'r','g'},{'b','r'},{'no',':'},5)

n=size(R,2);
m=size(R,1);

if nargin<6
    LevelNum=4;
end


R=[R R(:,1)];

[Theta,M]=meshgrid(2*pi/n*[0:n]+pi/n,ones(1,size(R,1)));

X=R.*sin(Theta);
Y=R.*cos(Theta);

A=plot(X',Y','LineWidth',2);


MAXAXIS=max(max(R))*1.1;
axis([-MAXAXIS MAXAXIS -MAXAXIS MAXAXIS]);
axis equal
axis off


if LevelNum>0
    AxisR=linspace(0,max(max(R)),LevelNum);
    for i=1:LevelNum
        text(AxisR(i)*sin(45),AxisR(i)*cos(45),num2str(AxisR(i),3),'FontSize',15)%調整分數大小
    end
    [M,AxisR]=meshgrid(ones(1,n),AxisR);
    AxisR=[AxisR AxisR(:,1)];
    [AxisTheta,M]=meshgrid(2*pi/n*[0:n]+pi/n,ones(1,size(AxisR,1)));
    AxisX=AxisR.*sin(AxisTheta);
    AxisY=AxisR.*cos(AxisTheta);
    hold on
    plot(AxisX,AxisY,':k')
    plot(AxisX',AxisY',':k')
end


if nargin>1
    if length(Lable)>=n
        LableTheta=2*pi/n*[0:n-1]+pi/n;
        LableR=MAXAXIS;
        LableX=LableR.*sin(LableTheta);
        LableY=LableR.*cos(LableTheta);
        for i=1:n
            if ~sum(strcmpi({'' },Lable(i)))
                text(LableX(i), LableY(i),cell2mat(Lable(i)), 'FontSize',10,'HorizontalAlignment','center','VerticalAlignment','Top','Rotation',0)
            end
        end
    end
else
    return
end

if nargin>2
    if length(LineColor)>=m
        for i=1:m
            if sum(strcmpi({'y' 'm' 'c' 'r' 'g' 'b' 'w' 'k' },LineColor(i)))
                set(A(i),'Color',cell2mat(LineColor(i)))
            end
        end
    end
else
    return
end

if nargin>3
    if length(FillColor)>=m
        for i=1:m
            if sum(strcmpi({'y' 'm' 'c' 'r' 'g' 'b' 'w' 'k' },FillColor(i)))
                hold on;
                F=fill(X(i,:),Y(i,:),cell2mat(FillColor(i)),'LineStyle','none');
                set(F,'FaceAlpha',0.1)
            end
        end
    end
else
    return
end

if nargin>4
    if length(LineStyle)>=m
        for i=1:m
            if sum(strcmpi({'-' '--' ':' '-.'},LineStyle(i)))
                set(A(i),'LineStyle',cell2mat(LineStyle(i)))
            end
        end
    end
else
    return
end


% --- Executes during object creation, after setting all properties.
function mixtem_CreateFcn(hObject, eventdata, handles)
 set (gca,'position',[0,0,0,0] );
 axis([0 100 0 100]);
 drawnow();
% hObject    handle to mixtem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate mixtem


% --- Executes during object creation, after setting all properties.
function power_CreateFcn(hObject, eventdata, handles)
 set (gca,'position',[0,0,0,0] );

% hObject    handle to power (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate power


% --- Executes during object creation, after setting all properties.
function motorvb_CreateFcn(hObject, eventdata, handles)
 set (gca,'position',[0,0,0,0] );

% hObject    handle to motorvb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate motorvb


% --- Executes during object creation, after setting all properties.
function bearingvb_CreateFcn(hObject, eventdata, handles)
 set (gca,'position',[0,0,0,0] );

% hObject    handle to bearingvb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate bearingvb


% --- Executes during object creation, after setting all properties.
function tempicon1_CreateFcn(hObject, eventdata, handles)
 set (gca,'position',[0,0,0,0] );

% hObject    handle to tempicon1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
function coldef=colordefine(A)
 for i=2:5
    if(A(2,1)>A(2,i))
        A(2,1)=A(2,i);
    end
end
if(A(2,1)<=40)
    coldef='r';
end
if(A(2,1)<=80&&A(2,1)>40)
    coldef='y';
end
if(A(2,1)>=80)
    coldef='g';
end



function Speed_Callback(hObject, eventdata, handles)
global speed;
speed =str2double(get(handles.Speed, 'String'));
% hObject    handle to Speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Speed as text
%        str2double(get(hObject,'String')) returns contents of Speed as a double


% --- Executes during object creation, after setting all properties.
function Speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
global speed
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
speed =500;
function powerscore=standard(speed,power)
double std;
double powerscore;
if(speed<1000)
     std=1895;
end     
if(speed>=1000&&speed<1500)
     std=1712;
end
if(speed>=1500&&speed<3000)
    std=1626;
end
if(speed>=3000)
    std=1668;
end
if((power-std)/std>0)
    powerscore=100-100*(power-std)/std;
end
if((power-std)/std<0)
powerscore=100+100*(power-std)/std;
end
function finalscore=final(a,b,c,d,e)
   double finalscore;
   finalscore=0.2*a+0.1*b+0.4*c+0.2*d+0.1*e;



function finalscore_Callback(hObject, eventdata, handles)
% hObject    handle to finalscore (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of finalscore as text
%        str2double(get(hObject,'String')) returns contents of finalscore as a double


% --- Executes during object creation, after setting all properties.
function finalscore_CreateFcn(hObject, eventdata, handles)
% hObject    handle to finalscore (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
function motorscore=maxvalue(a)
        double a;
        motorscore=98.4-16.8*a;


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over powertxt.
function powertxt_ButtonDownFcn(hObject, eventdata, handles)
set(handles.powerscore,'visible','on');
% hObject    handle to powertxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in powertxt.
function powertxt_Callback(hObject, eventdata, handles)
set(handles.powerscore,'visible','on');
pause(2);
set(handles.powerscore,'visible','off');
%%set(handles.powerscore,'visible','on');

% hObject    handle to powertxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in motortemptxt.
function motortemptxt_Callback(hObject, eventdata, handles)
set(handles.motortempscore,'visible','on');
pause(2);
set(handles.motortempscore,'visible','off');
% hObject    handle to motortemptxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in bearingtemptxt.
function bearingtemptxt_Callback(hObject, eventdata, handles)
set(handles.bearingtempscore,'visible','on');
pause(2);
set(handles.bearingtempscore,'visible','off');
% hObject    handle to bearingtemptxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in bearingvbtxt.
function bearingvbtxt_Callback(hObject, eventdata, handles)
set(handles.bearingvbscore,'visible','on');
pause(2);
set(handles.bearingvbscore,'visible','off');
% hObject    handle to bearingvbtxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in motorvbtxt.
function motorvbtxt_Callback(hObject, eventdata, handles)
set(handles.motorvbscore,'visible','on');
pause(2);
set(handles.motorvbscore,'visible','off');
% hObject    handle to motorvbtxt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
