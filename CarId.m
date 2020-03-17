% ******************************************************
% auther: later
% time  : 2018/10/26 17:12
% tip   : ����ʶ��
% change: 
% *******************************************************
function varargout = CarId(varargin)
% CARID MATLAB code for CarId.fig
%      CARID, by itself, creates a new CARID or raises the existing
%      singleton*.
%
%      H = CARID returns the handle to a new CARID or the handle to
%      the existing singleton*.
%
%      CARID('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CARID.M with the given input arguments.
%
%      CARID('Property','Value',...) creates a new CARID or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before CarId_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to CarId_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help CarId

% Last Modified by GUIDE v2.5 26-Oct-2018 20:30:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @CarId_OpeningFcn, ...
                   'gui_OutputFcn',  @CarId_OutputFcn, ...
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


% --- Executes just before CarId is made visible.
function CarId_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to CarId (see VARARGIN)

% Choose default command line output for CarId
handles.output = hObject;


%����������
set(handles.axes1,'visible','off');
set(handles.axes2,'visible','off');
set(handles.axes3,'visible','off');
set(handles.axes4,'visible','off');
set(handles.axes5,'visible','off');
set(handles.axes6,'visible','off');
set(handles.axes7,'visible','off');
set(handles.axes8,'visible','off');
set(handles.axes9,'visible','off');
set(handles.axes10,'visible','off');
set(handles.axes11,'visible','off');
set(handles.axes12,'visible','off');


% Update handles structure
guidata(hObject, handles);

% UIWAIT makes CarId wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = CarId_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Get default command line output from handles structure
varargout{1} = handles.output;

%======================my code========================%
% tip : ��ɾ����callback�Լ��ֶ����һ��...55555.....
function openLocal_Callback(hObject,eventdata,handles)
[filename, pathname]=uigetfile({'*.jpg; *.png; *.bmp; *.tif';'*.png';'All Image Files';'*.*'},'��ѡ��ͼƬ·��');
if pathname==0
    return;
end
I=imread([pathname filename]);
%��ʾԭͼ
    axes(handles.axes1)     %��TagֵΪaxes1����������Ϊ��ǰ
    imshow(I,[]);   %���ͼ��̫���޷���ʾ������.why?ò�ƻ��Զ�����
    title('ԭͼ');
    handles.I=I;        %����ͼ��
% Update handles structure
guidata(hObject, handles);

function openCamera_Callback(hObject,eventdata,handles)
    imaqhwinfo
    vid = videoinput('winvideo',1);
    usbVidRes1=get(vid,'videoResolution');%��ȡ��Ƶ�ĳߴ�
    nBands1=get(vid,'NumberOfBands');%�ɼ���Ƶ����ɫͨ��
    axes(handles.axes1);
    hImage1=imshow(zeros(usbVidRes1(2),usbVidRes1(1),nBands1));
    preview(vid,hImage1);
    handles.vid=vid;
% Update handles structure
guidata(hObject, handles);

function btnTakePhoto_Callback(hObject,eventdata,handles)
    vid=handles.vid;
    frame = getsnapshot(vid);
    axes(handles.axes1);
    imwrite(frame,'I.png');
    I=imread('I.png');
    axes(handles.axes1)     %��TagֵΪaxes1����������Ϊ��ǰ
    imshow(I,[]);   %���ͼ��̫���޷���ʾ������.why?ò�ƻ��Զ�����
    title('�������');
    handles.I=I;     %����ԭͼ
% Update handles structure
guidata(hObject, handles);

%������ʹ��ԭͼ����: handles.I


% --- Executes on button press in btnGray2.
function btnGray2_Callback(hObject, eventdata, handles)
% hObject    handle to btnGray2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    I=handles.Cut;
    I = rgb2gray(I);
    axes(handles.axes8)     %��TagֵΪaxes1����������Ϊ��ǰ
    imshow(I,[]);   %���ͼ��̫���޷���ʾ������.why?ò�ƻ��Զ�����
    title('�Ҷȴ���');
    handles.gray2=I;     %����ԭͼ
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in btnBalance.
function btnBalance_Callback(hObject, eventdata, handles)
% hObject    handle to btnBalance (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    I=handles.gray2;
    I = histeq(I);
    axes(handles.axes9)     %��TagֵΪaxes1����������Ϊ��ǰ
    imshow(I,[]);   %���ͼ��̫���޷���ʾ������.why?ò�ƻ��Զ�����
    title('ֱ��ͼ���⻯');
    handles.balance=I;     %����ԭͼ
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in btnDouble.
function btnDouble_Callback(hObject, eventdata, handles)
% hObject    handle to btnDouble (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    I=handles.balance;
    I = im2bw(I, 0.76);
    axes(handles.axes10)     %��TagֵΪaxes1����������Ϊ��ǰ
    imshow(I,[]);   %���ͼ��̫���޷���ʾ������.why?ò�ƻ��Զ�����
    title('ͼ���ֵ��');
    handles.double=I;     %����ԭͼ
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in btnMid.
function btnMid_Callback(hObject, eventdata, handles)
% hObject    handle to btnMid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    I=handles.double;
    I = medfilt2(I);
    axes(handles.axes11)     %��TagֵΪaxes1����������Ϊ��ǰ
    imshow(I,[]);   %���ͼ��̫���޷���ʾ������.why?ò�ƻ��Զ�����
    title('��ֵ�˲�');
    handles.Mid=I;     %����ԭͼ
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in btnCut2.
function btnCut2_Callback(hObject, eventdata, handles)
% hObject    handle to btnCut2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
I=handles.Mid;
I = my_imsplit(I);  %�и�ͼ��
[m, n] = size(I);

s = sum(I);    %sum(x)����������ӣ���ÿ�еĺͣ������������;
j = 1;
k1 = 1;
k2 = 1;
while j ~= n
    while s(j) == 0
        j = j + 1;
    end
    k1 = j;
    while s(j) ~= 0 && j <= n-1
        j = j + 1;
    end
    k2 = j + 1;
    if k2 - k1 > round(n / 6.5)
        [val, num] = min(sum(I(:, [k1+5:k2-5])));
        I(:, k1+num+5) = 0;
    end
end

y1 = 10;
y2 = 0.25;
flag = 0;
word1 = [];
while flag == 0
    [m, n] = size(I);
    left = 1;
    width = 0;
    while sum(I(:, width+1)) ~= 0
        width = width + 1;
    end
    if width < y1
        I(:, [1:width]) = 0;
        I = my_imsplit(I);
    else
        temp = my_imsplit(imcrop(I, [1,1,width,m]));
        [m, n] = size(temp);
        all = sum(sum(temp));
        two_thirds=sum(sum(temp([round(m/3):2*round(m/3)],:)));
        if two_thirds/all > y2
            flag = 1;
            word1 = temp;
        end
        I(:, [1:width]) = 0;
        I = my_imsplit(I);
    end
end

 % �ָ���ڶ����ַ�
 [word2,I]=getword(I);
 % �ָ���������ַ�
 [word3,I]=getword(I);
 % �ָ�����ĸ��ַ�
 [word4,I]=getword(I);
 % �ָ��������ַ�
 [word5,I]=getword(I);
 % �ָ���������ַ�
 [word6,I]=getword(I);
 % �ָ�����߸��ַ�
 [word7,I]=getword(I);

 figure;

 word1=imresize(word1,[40 20]);%imresize��ͼ�������Ŵ������õ��ø�ʽΪ��B=imresize(A,ntimes,method)������method��ѡnearest,bilinear��˫���ԣ�,bicubic,box,lanczors2,lanczors3��
 word2=imresize(word2,[40 20]);
 word3=imresize(word3,[40 20]);
 word4=imresize(word4,[40 20]);
 word5=imresize(word5,[40 20]);
 word6=imresize(word6,[40 20]);
 word7=imresize(word7,[40 20]);

 subplot(5,7,15),imshow(word1),title('1');
 subplot(5,7,16),imshow(word2),title('2');
 subplot(5,7,17),imshow(word3),title('3');
 subplot(5,7,18),imshow(word4),title('4');
 subplot(5,7,19),imshow(word5),title('5');
 subplot(5,7,20),imshow(word6),title('6');
 subplot(5,7,21),imshow(word7),title('7');
 
 imwrite(word1,'1.jpg'); % ������λ�����ַ�ͼ��
 imwrite(word2,'2.jpg');
 imwrite(word3,'3.jpg');
 imwrite(word4,'4.jpg');
 imwrite(word5,'5.jpg');
 imwrite(word6,'6.jpg');
 imwrite(word7,'7.jpg');


% --- Executes on button press in btnSelect.
function btnSelect_Callback(hObject, eventdata, handles)
% hObject    handle to btnSelect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 liccode=char(['0':'9' 'A':'Z' '����³����ԥ���']);%�����Զ�ʶ���ַ������'������۰ļ���³ԥ������������ո���������̨�¸��ƴ���ڲ��ɹ�����'
 % ��ţ�0-9�ֱ�Ϊ 1-10;A-Z�ֱ�Ϊ 11-36;
 % ��  ��  ��  ��  ��  ��  ��  ��  ³  ԥ  ��  ��  ��  ��  ��  ��  ��
 % ��  ��  ��  ��  ��  ̨  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��  ��
 % 37 38 39 40 41 42 43 44 45 46 47 48 49 50 51 52 53 54 55 56 57 58 59 
 % 60 61 62 63 64 65 66 67 68 69 70
 subBw2 = zeros(40, 20);
 num = 1;   % ����λ��
 for i = 1:7
    ii = int2str(i);    % ����������ת��Ϊ�ַ���������
    word = imread([ii,'.jpg']); % ��ȡ֮ǰ�ָ�����ַ���ͼƬ
    segBw2 = imresize(word, [40,20], 'nearest');    % ����ͼƬ�Ĵ�С
    segBw2 = im2bw(segBw2, 0.5);    % ͼ���ֵ��
    if i == 1   % �ַ���һλΪ���֣���λ���������ֶ�
        kMin = 37;
        kMax = 44;
    elseif i == 2   % �ڶ�λΪӢ����ĸ����λ��ĸ�����ֶ�
        kMin = 11;
        kMax = 36;
    elseif i >= 3   % ����λ��ʼ���������ˣ���λ���������ֶ�
        kMin = 1;
        kMax = 36;
    end
    
    l = 1;
    for k = kMin : kMax
        fname = strcat('model\',liccode(k),'.jpg');  % �����ַ����ҵ�ͼƬģ��
        samBw2 = imread(fname); % ��ȡģ����е�ͼƬ
        samBw2 = im2bw(samBw2, 0.5);    % ͼ���ֵ��
        
        % ����ʶ��ͼƬ��ģ��ͼƬ����
        for i1 = 1:40
            for j1 = 1:20
                subBw2(i1, j1) = segBw2(i1, j1) - samBw2(i1 ,j1);
            end
        end
        
        % ͳ������ͼƬ��ͬ��ĸ���������������
        Dmax = 0;
        for i2 = 1:40
            for j2 = 1:20
                if subBw2(i2, j2) ~= 0
                    Dmax = Dmax + 1;
                end
            end
        end
        error(l) = Dmax;
        l = l + 1;
    end
    
    % �ҵ�ͼƬ������ٵ�ͼ��
    errorMin = min(error);
    findc = find(error == errorMin);
%     error
%     findc
       
    % �����ֿ⣬��Ӧ��ʶ����ַ�
    Code(num*2 - 1) = liccode(findc(1) + kMin - 1);
    Code(num*2) = ' ';
    num = num + 1;
 end
 set(handles.text4,'string',Code);
 axes(handles.axes12)     %��TagֵΪaxes1����������Ϊ��ǰ
  imshow(handles.Cut,[]);   %���ͼ��̫���޷���ʾ������.why?ò�ƻ��Զ�����
  title('����');

      % ��ʾʶ����
 disp(Code);
 msgbox(Code,'ʶ����ĳ��ƺ�');


% --- Executes on button press in btnFushi.
function btnFushi_Callback(hObject, eventdata, handles)
% hObject    handle to btnFushi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    I=handles.edge;
    se=[1;1;1];
    I = imerode(I, se);
    axes(handles.axes4)     %��TagֵΪaxes1����������Ϊ��ǰ
    imshow(I,[]);   %���ͼ��̫���޷���ʾ������.why?ò�ƻ��Զ�����
    title('ͼ��ʴ');
    handles.Fushi=I;     %����ԭͼ
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in btnSoft.
function btnSoft_Callback(hObject, eventdata, handles)
% hObject    handle to btnSoft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    I=handles.Fushi;
    se = strel('rectangle', [30, 30]);
    I = imclose(I, se);
    axes(handles.axes5)     %��TagֵΪaxes1����������Ϊ��ǰ
    imshow(I,[]);   %���ͼ��̫���޷���ʾ������.why?ò�ƻ��Զ�����
    title('ƽ������');
    handles.Soft=I;     %����ԭͼ
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in btnRemove.
function btnRemove_Callback(hObject, eventdata, handles)
% hObject    handle to btnRemove (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    I=handles.Soft;
    I = bwareaopen(I, 2200);
    axes(handles.axes6)     %��TagֵΪaxes1����������Ϊ��ǰ
    imshow(I,[]);   %���ͼ��̫���޷���ʾ������.why?ò�ƻ��Զ�����
    title('�Ƴ�����');
    handles.Remove=I;     %����ԭͼ
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in btnCut.
function btnCut_Callback(hObject, eventdata, handles)
% hObject    handle to btnCut (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
img7=handles.Remove;
[y, x, z] = size(img7);
img8 = double(img7);    % ת��˫���ȸ�����

% ���Ƶ���ɫ����
% Y����
blue_Y = zeros(y, 1);
for i = 1:y
    for j = 1:x
        if(img8(i, j) == 1) % �жϳ���λ������
            blue_Y(i, 1) = blue_Y(i, 1) + 1;    % ���ص�ͳ��
        end
    end
end

% �ҵ�Y�������Сֵ
img_Y1 = 1;
while (blue_Y(img_Y1) < 5) && (img_Y1 < y)
    img_Y1 = img_Y1 + 1;
end

% �ҵ�Y��������ֵ
img_Y2 = y;
while (blue_Y(img_Y2) < 5) && (img_Y2 > img_Y1)
    img_Y2 = img_Y2 - 1;
end

% x����
blue_X = zeros(1, x);
for j = 1:x
    for i = 1:y
        if(img8(i, j) == 1) % �жϳ���λ������
            blue_X(1, j) = blue_X(1, j) + 1;
        end
    end
end

% �ҵ�x�������Сֵ
img_X1 = 1;
while (blue_X(1, img_X1) < 5) && (img_X1 < x)
    img_X1 = img_X1 + 1;
end

% �ҵ�x�������Сֵ
img_X2 = x;
while (blue_X(1, img_X2) < 5) && (img_X2 > img_X1)
    img_X2 = img_X2 - 1;
end

% ��ͼ����вü�
img9 = handles.I(img_Y1:img_Y2, img_X1:img_X2, :);
axes(handles.axes7)     %��TagֵΪaxes1����������Ϊ��ǰ
imshow(img9,[]);   %���ͼ��̫���޷���ʾ������.why?ò�ƻ��Զ�����
title('ͼ��ü�');
% ������ȡ�����ĳ���ͼ��
imwrite(img9, '����ͼ��.jpg');
handles.Cut=img9;     %����ԭͼ
% Update handles structure
guidata(hObject, handles);





% --- Executes on button press in btnGray1.
function btnGray1_Callback(hObject, eventdata, handles)
% hObject    handle to btnGray1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    I=handles.I;
    I = rgb2gray(I);
    axes(handles.axes2)     %��TagֵΪaxes1����������Ϊ��ǰ
    imshow(I,[]);   %���ͼ��̫���޷���ʾ������.why?ò�ƻ��Զ�����
    title('�Ҷȴ���');
    handles.gray1=I;     %����ԭͼ
% Update handles structure
guidata(hObject, handles);


% --- Executes on button press in btnEdge.
function btnEdge_Callback(hObject, eventdata, handles)
% hObject    handle to btnEdge (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    I=handles.gray1;
    I = edge(I, 'roberts', 0.15, 'both');
    axes(handles.axes3)     %��TagֵΪaxes1����������Ϊ��ǰ
    imshow(I,[]);   %���ͼ��̫���޷���ʾ������.why?ò�ƻ��Զ�����
    title('roberts��Ե���');
    handles.edge=I;     %����ԭͼ
% Update handles structure
guidata(hObject, handles);

%========================follow is Menu==============================


% --------------------------------------------------------------------
function Exit_Callback(hObject, eventdata, handles)
% hObject    handle to Exit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close(gcf)

% --------------------------------------------------------------------
function ReStart_Callback(hObject, eventdata, handles)
% hObject    handle to ReStart (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web https://blog.csdn.net/qq_37832932

% --------------------------------------------------------------------
function Auther_Callback(hObject, eventdata, handles)
% hObject    handle to Auther (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
msgbox('latermvp@gmail.com','����');

% --------------------------------------------------------------------
function Block_Callback(hObject, eventdata, handles)
% hObject    handle to Block (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
web https://blog.csdn.net/qq_37832932
