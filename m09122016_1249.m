function dd()

%% ������� ������ � ��������� ������ 1000 - 10000 ��
%  0,5 - 0,5 - 1 ���.
% ������ - ������ ���� �� ������� - ����� 1 ���.
% ������� ����������

%% � ����� � ������ ������� �������� 100 ��������, ��� ���������� �����
%  25 �����!

%%
    sn = 's_09_12_2016_12_49_25';
    fds = 100000; % ������� ������������� ��������� �������
    fdr = 48828;  % ������� ������������� ���������
    
    scrsz = get(groot,'ScreenSize');
    
    fpcm=fopen('09122016\pcm\2016_12_09 12_49_04 2 1 48828.pcm', 'r');
    [RECEIVED_SIGNAL, received_cnt] = fread(fpcm, 'float');
    fclose(fpcm);
    
    frawf=fopen(['09122016\log\' sn '.raw']);
    [SOURCE_SIGNAL, source_cnt] = fread(frawf, 'double');
    fclose(frawf);
    

    %% ������ ���������� ������ � ��� ������
    figure('Name',['�������� ������ ' sn],'NumberTitle','off','Position',[10 scrsz(4)/2 - 35 scrsz(3)/2 - 50 scrsz(4)/2 - 50]);
    plot(RECEIVED_SIGNAL);
        
    lg = legend('������� ������ � ��������� ������ 1000 - 10000 ��');
    title(lg, '0,5 - 0,5 - 1 ���. � ����� � ������ �������� 100 ��������. ������� �����.');
    
    figure('Name',['������ ��������� ������� ' sn],'NumberTitle','off','Position',[scrsz(3)/2 + 20 scrsz(4)/2 - 35 scrsz(3)/2 - 50 scrsz(4)/2 - 50]);
%     RECEIVED_SPECTRUM = abs(fft(RECEIVED_SIGNAL)); %1800:2400
    RECEIVED_SPECTRUM1 = abs(fft(RECEIVED_SIGNAL(27300:51300))); %24000
    RECEIVED_SPECTRUM2 = abs(fft(RECEIVED_SIGNAL(51425:75425))); 
%     RECEIVED_SPECTRUM3 = abs(fft(RECEIVED_SIGNAL(192000:203000))); %1800:2400
%     RECEIVED_SPECTRUM4 = abs(fft(RECEIVED_SIGNAL(218000:229000))); %1800:2400
    
    slen = (length(RECEIVED_SPECTRUM1) - 1) / 2; % 
    x = 0:fdr/2/slen:(fdr/2 - fdr/2/slen); % ����� ������
    
    plot(x, RECEIVED_SPECTRUM1(1:slen));
    hold on
    plot(x, RECEIVED_SPECTRUM2(1:slen));
%     hold on
%     plot(x, RECEIVED_SPECTRUM3(1:slen));
%     hold on
%     plot(x, RECEIVED_SPECTRUM4(1:slen));
        
    lg = legend('������� ������ � ��������� ������ 1000 - 10000 ��');
    title(lg, '0,5 - 0,5 - 1 ���. � ����� � ������ �������� 100 ��������. ������� �����.');


    %% ������ �������� ������ � ��� ������
    figure('Name',['�������� ������ ' sn],'NumberTitle','off','Position',[10 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
    plot(SOURCE_SIGNAL);
        
    lg = legend('������� ������ � ��������� ������ 1000 - 10000 ��');
    title(lg, '0,5 - 0,5 - 1 ���. � ����� � ������ �������� 100 ��������. ������� �����.');
    
    SOURCE_SPECTRUM = abs(fft(SOURCE_SIGNAL)); %1800:2400
    figure('Name',['������ ��������� ������� ' sn],'NumberTitle','off','Position',[scrsz(3)/2 + 20 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
    
    slen = (length(SOURCE_SPECTRUM) - 1) / 2; % 
    x = 0:fds/2/slen:(fds/2 - fds/2/slen); % ����� ������
    plot(x, SOURCE_SPECTRUM(1:slen));
            
    lg = legend('������� ������ � ��������� ������ 1000 - 10000 ��');
    title(lg, '0,5 - 0,5 - 1 ���. � ����� � ������ �������� 100 ��������. ������� �����.');
    
    
end

