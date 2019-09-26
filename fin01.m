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

% Last Modified by GUIDE v2.5 18-Sep-2019 15:31:38

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
clear s;
global s;
clear s1;
global s1;
clear c;
global c;
s= serial('/dev/cu.usbmodem143301'); 
set(s,'BaudRate',9600); 
s1= serial('/dev/cu.usbmodem143201'); 
set(s1,'BaudRate',115200);
c=1;
fclose(instrfind);
axes(handles.radarplot)
radarplot([100 100 100 100 100],{},{'k'},{''},{'--'});
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
global c;
c=1;
fopen(s);
fopen(s1);
x=0;
y=0;
z=0;
i=0;
set(handles.tempicon1,'visible','on');
set(handles.tempicon1,'position',[52,33,10,5]);
set(handles.power1,'visible','on');
set(handles.power1,'position',[69,17,10,5]);
set(handles.vbicon1,'visible','on');
set(handles.vbicon1,'position',[90,33,10,5]);


while(true)
%new
com6array1=1:4;
com6array2=1:4; 
unit=0:1;
for i=1:1000
if rem(i,2)==0
com6array1=str2num(fgetl(s));
fprintf('sec=%f(s)  Current=%f(A) Power=%f(W) Motor Temperature=%f(℃)\n',com6array1(1)/1000,com6array1(2),com6array1(3),com6array1(4));
time=com6array1(1)/1000;
a=com6array1(4);
else
com6array2=str2num(fgetl(s));    
fprintf('sec=%f(s)  Current=%f(A) Power=%f(W) Motor Temperature=%f(℃)\n',com6array2(1)/1000,com6array2(2),com6array2(3),com6array2(4));
time=com6array2(1)/1000;
a=com6array2(4);

end
x=com6array1(1)/1000+(com6array2(1)/1000-com6array1(1)/1000)*unit;%時間
y=com6array1(3)+(com6array2(3)-com6array1(3))*unit;%功率
z=com6array1(4)+(com6array2(4)-com6array1(4))*unit;%溫度
axes(handles.mixtem)
plot(x,z,'k','LineWidth',2.5);
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
plot(x,y,'k','LineWidth',2.5);
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

for j=1:64;
    io=1:2;
data(io,j)=str2num(fgetl(s1));
if(j==64)
fs=100;N=64; 
n=0:N-1;
x=data(1,n+1); 
x1=data(2,n+1);
y=fft(x,N); 
y1=fft(x1,N);
f= fs*(0:(N/2))/N;
P = abs(y/N);
P1 = abs(y1/N);
end
end

axes(handles.motorvb)
plot(f,P(1:N/2+1)) 
xlabel('Frequency (Hz)')
ylabel('振幅')
ylim([0 0.3])
grid on;
drawnow;
guidata(hObject, handles);
%end
%bearingvb axes
axes(handles.bearingvb)
plot(f,P1(1:N/2+1)) 
xlabel('Frequency (Hz)')
ylabel('振幅')
ylim([0 0.3])
grid on;
drawnow;
guidata(hObject, handles);
%bearingvb axes end
%tempscore
tempscore=104+0.0159*a +-0.0101*a^2
%end 
%radarplot start 
b=80;
k=80;
d=80;
e=80;
z=[100 100 100 100 100 ;tempscore b k d e];
axes(handles.radarplot)
radarplot(z,{},{'g','g'},{'','g'},{'--','--'});
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
    set(handles.tempicon2,'position',[52,33,10,5]);
% hObject    handle to tempicon1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in tempicon2.
function tempicon2_Callback(hObject, eventdata, handles)
set(handles.mixtem,'position',[0,0,0,0]);
set(handles.tempicon1,'position',[52,33,10,5]);
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
set(handles.motorvb,'position',[0,0,0,0]);
set(handles.bearingvb,'position',[0,0,0,0]);
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
set(handles.power2,'position',[69,17,10,5]);
% hObject    handle to power1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in power2.
function power2_Callback(hObject, eventdata, handles)
set(handles.power,'position',[0,0,0,0]);
set(handles.power1,'position',[69,17,10,5]);
set(handles.power2,'position',[0,0,0,0]);
% hObject    handle to power2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes on button press in clear.
function clear_Callback(hObject, eventdata, handles)
global c;
global s;
global s1;
c=-1;
cla(handles.mixtem);
cla(handles.motorvb);
cla(handles.power);
cla(handles.bearingvb);
axes(handles.radarplot)
cla(handles.radarplot)
radarplot([100 100 100 100 100],{},{'k'},{''},{'--'});
fclose(s);
fclose(s1);
set(handles.tempicon1,'visible','off');
set(handles.tempicon2,'visible','off');
set(handles.power1,'visible','off');
set(handles.power2,'visible','off');
set(handles.vbicon1,'visible','off');
set(handles.vbicon2,'visible','off');
set (handles.power,'position',[0,0,0,0] );
set(handles.mixtem,'position',[0,0,0,0] );
set(handles.motorvb,'position',[0,0,0,0]);
set(handles.bearingvb,'position',[0,0,0,0]);
% hObject    handle to clear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pause.
function pause_Callback(hObject, eventdata, handles)
global c;
global s;
global s1;
c=-1;
fclose(s);
fclose(s1);
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
    if(A(1)>A(i))
        A(1)=A(i);
    end
end
if(A(1)<=40)
    coldef='r';
end
if(A(1)<=80&&A(1)>40)
    coldef='k';
end
if(A(1)>=80)
    coldef='g';
end
