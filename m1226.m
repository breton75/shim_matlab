function dd()

%% ������ ������������ �� ��������� ����������
% ������ �������� 0,2 ��. ������ ��������� �������� 0,2 - 2 ��. ����� ������������� �����������, �� ��������� ������� � ������������ ��������
%  0,4 - 0,4 - 0,4 - 3 ���.
% ������ - ������ - ������ ���� �� ������� - ����� 3 ���.
% ������� ����������

%%

    %[fn, fpath]=uigetfile('*.pcm', '���� PCM', 'd:/pcm/');
    %fpcm=fopen([fpath fn]);
    
    sn = '1226';
    
    scrsz = get(groot,'ScreenSize');
    
    fpcm=fopen('2016_11_23 12_26_05 2 1 32552.pcm', 'r');
    [RECEIVED_SIGNAL, received_cnt] = fread(fpcm, 'float');
    fclose(fpcm);

    
    %[fn, fpath]=uigetfile('*.rawf', '���� rawf', 'D:/c++/AME/Generators/');
    %frawf=fopen([fpath fn]);
    
    frawf=fopen(['s' sn '.raw']);
    [SOURCE_SIGNAL, source_cnt] = fread(frawf, 'double');
    fclose(frawf);

    % ������ ���������� ������
    figure('Name',['�������� ������ ' sn],'NumberTitle','off','Position',[10 scrsz(4)/2 - 35 scrsz(3)/2 - 50 scrsz(4)/2 - 50]);
    plot(RECEIVED_SIGNAL, 'red');
    hold on

    % ������ �������� ������
    %figure('Name',['�������� ������ ' sn],'NumberTitle','off','Position',[10 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
    plot(SOURCE_SIGNAL * 1000, 'blue');

    
    % ������ ������ ����������� �������
    RECEIVED_SPECTRUM = abs(fft(RECEIVED_SIGNAL)); %1800:2400
    figure('Name',['������ ��������� ������� ' sn],'NumberTitle','off','Position',[scrsz(3)/2 + 20 scrsz(4)/2 - 35 scrsz(3)/2 - 50 scrsz(4)/2 - 50]);
    plot(RECEIVED_SPECTRUM(1:received_cnt/2), 'red');
    hold on
    
    % ������ ������ ��������� �������
    SOURCE_SPECTRUM = abs(fft(SOURCE_SIGNAL)) * 300; %1800:2400
    %figure('Name',['������ ��������� ������� ' sn],'NumberTitle','off','Position',[scrsz(3)/2 + 20 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
    plot(SOURCE_SPECTRUM(1:source_cnt/2), 'blue');
    
end

