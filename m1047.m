function dd()

%% ���  0,4 - 0,4 - 0,4 - 3 ���.
% ������ - ������ - ������ ���� �� ������� - ����� 3 ���.
% ��������� ����������

%%

    %[fn, fpath]=uigetfile('*.pcm', '���� PCM', 'd:/pcm/');
    %fpcm=fopen([fpath fn]);
    
    sn = '1047';
    fds = 100000; % ������� ������������� ��������� �������
    fdr = 32552;  % ������� ������������� ���������
    
    scrsz = get(groot,'ScreenSize');
    
    fpcm=fopen('2016_11_24 10_47_53 2 6 32552.pcm', 'r');
    [RECEIVED_SIGNAL, received_cnt] = fread(fpcm, 'float');
    fclose(fpcm);

    
    %[fn, fpath]=uigetfile('*.rawf', '���� rawf', 'D:/c++/AME/Generators/');
    %frawf=fopen([fpath fn]);
    
    frawf=fopen(['s' sn '.raw']);
    [SOURCE_SIGNAL, source_cnt] = fread(frawf, 'double');
    fclose(frawf);

    %% ������ ���������� ������ � ��� ������
    figure('Name',['�������� ������ ' sn],'NumberTitle','off','Position',[10 scrsz(4)/2 - 35 scrsz(3)/2 - 50 scrsz(4)/2 - 50]);
    plot(RECEIVED_SIGNAL);
    
    lg = legend('0,4 - 0,4 - 0,4 - 3 ���.');
    title(lg, '��� ����������. ��������� �����.');

    RECEIVED_SPECTRUM1 = abs(fft(RECEIVED_SIGNAL(49000:60000))); %1800:2400
    RECEIVED_SPECTRUM2 = abs(fft(RECEIVED_SIGNAL(75000:86000))); %1800:2400
    
    figure('Name',['������ ��������� ������� ' sn],'NumberTitle','off','Position',[scrsz(3)/2 + 20 scrsz(4)/2 - 35 scrsz(3)/2 - 50 scrsz(4)/2 - 50]);
    
    slen = (length(RECEIVED_SPECTRUM1) - 1) / 2; % 
    x = 0:fdr/2/slen:(fdr/2 - fdr/2/slen); % ����� ������

    plot(x, RECEIVED_SPECTRUM1(1:slen));
    hold on
    plot(x, RECEIVED_SPECTRUM2(1:slen));
    
    lg = legend('0,4 - 0,4 - 0,4 - 3 ���.');
    title(lg, '��� ����������. ��������� �����.');
    
    
    %% ������ �������� ������ � ��� ������
    figure('Name',['�������� ������ ' sn],'NumberTitle','off','Position',[10 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
    plot(SOURCE_SIGNAL);
    
    lg = legend('0,4 - 0,4 - 0,4 - 3 ���.');
    title(lg, '��� ����������. ��������� �����.');
    
    SOURCE_SPECTRUM = abs(fft(SOURCE_SIGNAL)); %1800:2400
    figure('Name',['������ ��������� ������� ' sn],'NumberTitle','off','Position',[scrsz(3)/2 + 20 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
    
    slen = (length(SOURCE_SPECTRUM) - 1) / 2; % 
    x = 0:fds/2/slen:(fds/2 - fds/2/slen); % ����� ������
    plot(x, SOURCE_SPECTRUM(1:slen));
    
    lg = legend('0,4 - 0,4 - 0,4 - 3 ���.');
    title(lg, '��� ����������. ��������� �����.');
    
end

