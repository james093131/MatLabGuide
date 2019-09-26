function varargout = guide01(varargin)
% GUIDE01 MATLAB code for guide01.fig
%      GUIDE01, by itself, creates a new GUIDE01 or raises the existing
%      singleton*.
%
%      H = GUIDE01 returns the handle to a new GUIDE01 or the handle to
%      the existing singleton*.
%
%      GUIDE01('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIDE01.M with the given input arguments.
%
%      GUIDE01('Property','Value',...) creates a new GUIDE01 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guide01_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guide01_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guide01

% Last Modified by GUIDE v2.5 23-Sep-2019 13:16:30

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guide01_OpeningFcn, ...
                   'gui_OutputFcn',  @guide01_OutputFcn, ...
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


% --- Executes just before guide01 is made visible.
function guide01_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guide01 (see VARARGIN)

% Choose default command line output for guide01
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
imag=imread('temp2.jpg');
power=imread('power1.jpg');
vib=imread('vib1.jpg');
I4=imresize(imag,1/7);
I5=imresize(power,1/7);
I6=imresize(vib,1/7);
set(handles.temicon1,'cdata',I4);
set(handles.temicon2,'cdata',I4);
set(handles.powericon1,'cdata',I5);
set(handles.powericon2,'cdata',I5);
set(handles.vibicon1,'cdata',I6);
set(handles.vibicon2,'cdata',I6);
clear c;
global c;
clear a;
global a;
clear b;
global b;
clear k;
global k;
clear d;
global d;
clear e;
global e;
clear speed;
global speed;
c=1;
a=0;b=0;k=0;d=0;e=0;
axes(handles.axes9)
radarplot([100 100 100 100 100],{},{'k'},{''},{'--'});
guidata(hObject, handles);
% UIWAIT makes guide01 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guide01_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes during object creation, after setting all properties.
function axes9_CreateFcn(hObject, eventdata, handles)
%global a;
%global b;
%global k;
%global d;
%global e;
% hObject    handle to axes9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes9

% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%test start
%fo = 4; %frequency of the sine wave
%Fs = 100; %sampling rate
%Ts = 1/Fs; %sampling time interval
%t = 0:Ts:1-Ts; %sampling period
%n = length(t); %number of samples
%y = 2*sin(2*pi*fo*t); %the sine curve
%z = 2*cos(2*pi*fo*t);
%end
set(handles.temicon1,'visible','on');
set(handles.temicon1,'position',[52,33,10,5]);
set(handles.powericon1,'visible','on');
set(handles.powericon1,'position',[69,17,10,5]);
set(handles.vibicon1,'visible','on');
set(handles.vibicon1,'position',[90,33,10,5]);
%axes(handles.mixtem)
%plot(t,y, t,z);
%xlabel('time(second)');
%ylabel('temperature(C)');
%grid on;
%guidata(hObject, handles);
global a;
global b;
global k;
global d;
global e;
global c;
global speed;
c=1;

while(true)
%new
fprintf('%f\n',speed);
%new end
%for j=1:64
%data(j)=str2num(fgetl(s1));
%if(j==64)
%fs=100;N=64; 
%n=0:N-1;
%x=data(n+1); 
%y=fft(x,N); 
%f= fs*(0:(N/2))/N;
%P = abs(y/N);



%vib end
%mix vibration


%mix vib end



%end
%bearingvb axes
%bearingvb axes end
%tempscore
a=60;
%end 
%radarplot start 
b=60;
k=50;
d=50;
e=50;

z=[100 100 100 100 100;a b k d e];
coldef=colordefine(z);
axes(handles.axes9)
radarplot(z,{},{'g',coldef},{'',coldef},{'--',''});
drawnow();
clear a;
clear b;
clear k;
clear d;
clear e;

if (c == -1)
       break;
end
end
%end


% --- Executes during object creation, after setting all properties.
function mixtem_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mixtem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 set (gca,'position',[0,0,0,0] );
 axis([0 100 0 100]);
 drawnow();


% Hint: place code in OpeningFcn to populate mixtem

% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over pushbutton3.


% --- Executes on button press in temperature1.



% hObject    handle to temperature1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on butto
% hObject    handle to temperature2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
% hObject    handle to temperature1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called




% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global c;

c=-1;
clear speed;
set(handles.Speed,'String','Speed');
cla(handles.mixtem);
cla(handles.motorvb);
axes(handles.axes9)
cla(handles.axes9)
radarplot([100 100 100 100 100],{},{'k'},{''},{'--'});
set(handles.temicon1,'visible','off');
set(handles.temicon2,'visible','off');
set(handles.powericon1,'visible','off');
set(handles.powericon2,'visible','off');
set(handles.vibicon1,'visible','off');
set(handles.vibicon2,'visible','off');
set (handles.power,'position',[0,0,0,0] );
set(handles.mixtem,'position',[0,0,0,0] );
set(handles.motorvb,'position',[0,0,0,0]);
set(handles.bearingvb,'position',[0,0,0,0]);








% --- Executes on button press in vibration1.

% Hint: get(hObject,'Value') returns toggle state of vibration1


% --- Executes on button press in vibration2.


% --- Executes during object creation, after setting all properties.
function motorvb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to motorvb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 set (gca,'position',[0,0,0,0] );

% Hint: place code in OpeningFcn to populate motorvb


% --- Executes during object creation, after setting all properties.
function bearingvb_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bearingvb (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
 set (gca,'position',[0,0,0,0] );

% Hint: place code in OpeningFcn to populate bearingvb


% --- Executes during object deletion, before destroying properties.
function mixtem_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to mixtem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on mouse press over axes background.
function mixtem_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to mixtem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function power_CreateFcn(hObject, eventdata, handles)
% hObject    handle to power (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set (gca,'position',[0,0,0,0] );
% Hint: place code in OpeningFcn to populate power

% --- Executes on button press in power2.
function temicon1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to temicon1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set (gca,'position',[0,0,0,0] );
% --- Executes on button press in temicon1.
% --- Executes during object creation, after setting all properties.
function temicon2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to temicon2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
set (handles.temicon2,'position',[0,0,0,0] );
function temicon1_Callback(hObject, eventdata, handles)
% hObject    handle to temicon1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    set(handles.mixtem,'position',[10,30,30,10] );
    set(handles.temicon2,'visible','on');
    set(handles.temicon1,'position',[0,0,0,0]);
    set(handles.temicon2,'position',[52,33,10,5]);
% --- Executes on button press in temicon2.
function temicon2_Callback(hObject, eventdata, handles)
% hObject    handle to temicon2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.mixtem,'position',[0,0,0,0]);
set(handles.temicon1,'position',[52,33,10,5]);
set(handles.temicon2,'position',[0,0,0,0]);
% --- Executes on button press in powericon1.
function powericon1_Callback(hObject, eventdata, handles)
% hObject    handle to powericon1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.power,'position',[10,15,30,10]);
set(handles.powericon2,'visible','on');
set(handles.powericon1,'position',[0,0,0,0]);
set(handles.powericon2,'position',[69,17,10,5]);
% --- Executes on button press in powericon2.
function powericon2_Callback(hObject, eventdata, handles)
% hObject    handle to powericon2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.power,'position',[0,0,0,0]);
set(handles.powericon1,'position',[69,17,10,5]);
set(handles.powericon2,'position',[0,0,0,0]);





% --- Executes on button press in vibicon1.
function vibicon1_Callback(hObject, eventdata, handles)
% hObject    handle to vibicon1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.motorvb,'position',[110,30,30,10]);
set(handles.bearingvb,'position',[110,15,30,10]);
set(handles.vibicon2,'visible','on');
set(handles.vibicon1,'position',[0,0,0,0]);
set(handles.vibicon2,'position',[90,33,10,5]);

% --- Executes during object creation, after setting all properties.



% --- Executes on button press in vibicon2.
function vibicon2_Callback(hObject, eventdata, handles)
% hObject    handle to vibicon2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.motorvb,'position',[0,0,0,0]);
set(handles.bearingvb,'position',[0,0,0,0]);
set(handles.vibicon1,'position',[90,33,10,5]);
set(handles.vibicon2,'position',[0,0,0,0]);





% --- Executes on button press in pause.
function pause_Callback(hObject, eventdata, handles)
global c;
c=-1;
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
                text(LableX(i), LableY(i),cell2mat(Lable(i)), 'FontSize',20,'HorizontalAlignment','center','VerticalAlignment','Bottom','Rotation',0)
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
                set(F,'FaceAlpha',0.3)
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
% hObject    handle to Speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global speed;
speed =str2double(get(handles.Speed, 'String'));

% Hints: get(hObject,'String') returns contents of Speed as text
%        str2double(get(hObject,'String')) returns contents of Speed as a double


% --- Executes during object creation, after setting all properties.
function Speed_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Speed (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
