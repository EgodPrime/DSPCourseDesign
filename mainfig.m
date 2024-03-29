function varargout = mainfig(varargin)
ALGOTITHMS = ['DCT','LSB','ECHO'];
TYPES = ["IMG_IN_IMG","TXT_IN_IMG","AUDIO_IN_IMG","IMG_IN_AUDIO","TXT_IN_AUDIO","AUDIO_IN_AUDIO"];
% MAINFIG MATLAB code for mainfig.fig
%      MAINFIG, by itself, creates a new MAINFIG or raises the existing
%      singleton*.
%
%      H = MAINFIG returns the handle to a new MAINFIG or the handle to
%      the existing singleton*.
%
%      MAINFIG('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAINFIG.M with the given input arguments.
%
%      MAINFIG('Property','Value',...) creates a new MAINFIG or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mainfig_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mainfig_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mainfig

% Last Modified by GUIDE v2.5 16-Dec-2019 16:05:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mainfig_OpeningFcn, ...
                   'gui_OutputFcn',  @mainfig_OutputFcn, ...
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


% --- Executes just before mainfig is made visible.
function mainfig_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mainfig (see VARARGIN)

% Choose default command line output for mainfig
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mainfig wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mainfig_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

function out = getMethod(handles)
% get whic method is selected
    LSB = handles.cbLSB.Value;
    ECHO = handles.cbECHO.Value;
    DCT = handles.cbDCT.Value;
    out = [LSB,ECHO,DCT];
    
function refresh(handles)
    handles.cbLSB.Enable='on';
    handles.cbECHO.Enable='on';
    handles.cbDCT.Enable='on';
    % source
    if ~strcmp(handles.txtSourceFile.String,'可编辑文本')
        file = handles.txtSourceFile.String;
        [type,shape] = searchFile(file,1);
        methods = getMethod(handles);
        capacity = calcuCapacity(shape,methods);
        handles.txtSourceStyle.String = type;
        handles.txtSourceShape.String = shape;
        handles.txtSourceSize.String = strcat(string(capacity),'bit');

        if strcmp(type,'AUDIO')
            handles.cbDCT.Enable='off';
            if handles.cbDCT.Value == 1
               handles.cbDCT.Value = 0;
            end
        end
        if strcmp(type,'IMG')
           handles.cbECHO.Enable='off';
           if handles.cbECHO.Value == 1;
               handles.cbECHO.Value = 0;
           end
        end
    end
    % target
    if ~strcmp(handles.txtTargetFile.String,'可编辑文本')
        file = handles.txtTargetFile.String;
        [type,shape] = searchFile(file,1);
        methods = getMethod(handles);
        NCap = calNeedCap(type,shape,methods);
        handles.txtTargetStyle.String = type;
        handles.txtTargetShape.String = shape;
        handles.txtTargetSize.String = string(NCap);
    end

        

function txtSourceFile_Callback(hObject, eventdata, handles)
% hObject    handle to txtSourceFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtSourceFile as text
%        str2double(get(hObject,'String')) returns contents of txtSourceFile as a double


% --- Executes during object creation, after setting all properties.
function txtSourceFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtSourceFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in btnSourceFile.
function btnSourceFile_Callback(hObject, eventdata, handles)
% hObject    handle to btnSourceFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path] = uigetfile('*.*');
file = strcat(path,file);
handles.txtSourceFile.String=file;
refresh(handles);
%set(handles.txtSourceFile,'String',strcat(path,file));


function txtTargetFile_Callback(hObject, eventdata, handles)
% hObject    handle to txtTargetFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtTargetFile as text
%        str2double(get(hObject,'String')) returns contents of txtTargetFile as a double


% --- Executes during object creation, after setting all properties.
function txtTargetFile_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtTargetFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnTargetFile.
function btnTargetFile_Callback(hObject, eventdata, handles)
% hObject    handle to btnTargetFile (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[file,path] = uigetfile('*.*');
file = strcat(path,file);
handles.txtTargetFile.String=file;
refresh(handles);

% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function txtSourceStyle_Callback(hObject, eventdata, handles)
% hObject    handle to txtSourceStyle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtSourceStyle as text
%        str2double(get(hObject,'String')) returns contents of txtSourceStyle as a double


% --- Executes during object creation, after setting all properties.
function txtSourceStyle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtSourceStyle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtSourceShape_Callback(hObject, eventdata, handles)
% hObject    handle to txtSourceShape (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtSourceShape as text
%        str2double(get(hObject,'String')) returns contents of txtSourceShape as a double


% --- Executes during object creation, after setting all properties.
function txtSourceShape_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtSourceShape (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtSourceSize_Callback(hObject, eventdata, handles)
% hObject    handle to txtSourceSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtSourceSize as text
%        str2double(get(hObject,'String')) returns contents of txtSourceSize as a double


% --- Executes during object creation, after setting all properties.
function txtSourceSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtSourceSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtTargetStyle_Callback(hObject, eventdata, handles)
% hObject    handle to txtTargetStyle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtTargetStyle as text
%        str2double(get(hObject,'String')) returns contents of txtTargetStyle as a double


% --- Executes during object creation, after setting all properties.
function txtTargetStyle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtTargetStyle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtTargetShape_Callback(hObject, eventdata, handles)
% hObject    handle to txtTargetShape (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtTargetShape as text
%        str2double(get(hObject,'String')) returns contents of txtTargetShape as a double


% --- Executes during object creation, after setting all properties.
function txtTargetShape_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtTargetShape (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtTargetSize_Callback(hObject, eventdata, handles)
% hObject    handle to txtTargetSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtTargetSize as text
%        str2double(get(hObject,'String')) returns contents of txtTargetSize as a double


% --- Executes during object creation, after setting all properties.
function txtTargetSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtTargetSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in cbLSB.
function cbLSB_Callback(hObject, eventdata, handles)
% hObject    handle to cbLSB (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
refresh(handles);
% Hint: get(hObject,'Value') returns toggle state of cbLSB


% --- Executes on button press in cbECHO.
function cbECHO_Callback(hObject, eventdata, handles)
% hObject    handle to cbECHO (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
refresh(handles);
% Hint: get(hObject,'Value') returns toggle state of cbECHO


% --- Executes on button press in cbDCT.
function cbDCT_Callback(hObject, eventdata, handles)
% hObject    handle to cbDCT (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
refresh(handles);
% Hint: get(hObject,'Value') returns toggle state of cbDCT


% --- Executes on button press in btnHide.
function btnHide_Callback(hObject, eventdata, handles)
% hObject    handle to btnHide (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
type1 = handles.txtSourceStyle.String;
type2 = handles.txtTargetStyle.String;
file1 = handles.txtSourceFile.String;
file2 = handles.txtTargetFile.String;

methods = getMethod(handles);
if methods(1)
    m = 'LSB';
elseif methods(2)
    m = 'ECHO';
else
    m = 'DCT';
end

op = strcat(type2,strcat('_IN_',type1));

key = strcat(m,strcat('_',op));
if ~ifSupport(key)
   warndlg(['隐藏失败',"不支持操作",key]);
   return;
end

hide(m,op,file1,file2);


% --- Executes on button press in btnExtract.
function btnExtract_Callback(hObject, eventdata, handles)
% hObject    handle to btnExtract (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function txtLOG_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtLOG (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
