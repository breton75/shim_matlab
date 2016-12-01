function dd()

%% ������ ����������� ������������ (0 1 0 -1 0 1 0 -1)  �� ��������� ����������
% ������ �������� 0,2 ��. ������ ��������� �������� 0,2 - 2 ��. ����� ������������� - �����������, �� ��������� ������� � ������������ ��������
%  0,4 - 0,4 - 0,4 - 3 ���.
% ������ - ������ - ������ ���� �� ������� - ����� 3 ���.
% ������� ����������

%%

    %[fn, fpath]=uigetfile('*.pcm', '���� PCM', 'd:/pcm/');
    %fpcm=fopen([fpath fn]);
    
    sn = '1052_1054';
    fds = 100000; % ������� ������������� ��������� �������
    fdr = 32552;  % ������� ������������� ���������
    
    scrsz = get(groot,'ScreenSize');
    
    fpcm=fopen('2016_11_24 10_52_43 2 6 32552.pcm', 'r');
    [R1052, received_cnt] = fread(fpcm, 'float');
    fclose(fpcm);
    
    fpcm=fopen('2016_11_24 10_54_47 2 6 32552.pcm', 'r');
    [R1054, received_cnt] = fread(fpcm, 'float');
    fclose(fpcm);
    
    fpcm=fopen('2016_11_24 10_40_09 2 6 32552.pcm', 'r');
    [R1040, received_cnt] = fread(fpcm, 'float');
    fclose(fpcm);
    
    fpcm=fopen('2016_11_24 10_43_31 2 6 32552.pcm', 'r');
    [R1043, received_cnt] = fread(fpcm, 'float');
    fclose(fpcm);
        
    
    figure('Name',['������ ��������� ������� ' sn],'NumberTitle','off','Position',[scrsz(3)/2 + 20 scrsz(4)/2 - 35 scrsz(3)/2 - 50 scrsz(4)/2 - 50]);
    
    S1054 = abs(fft(R1054(63000:74000))); % 11000 �����
    S1052 = abs(fft(R1052(55000:66000))); % 11000 �����
    
    slen = (length(S1054) - 1) / 2; % 5500
    step = 16776/slen;
    x = 0:step:(16776 - step); % ����� ������

    plot(x, S1054(1:slen)); % �������
    hold on;
    plot(x, S1052(1:slen)*32,'Color',[1, 0.2, 0.2, 0.4]); % ���������
    
    lg = legend('������� ����������', '��������� ����������');
    title(lg, '������ ������������, �������� 0,2 - 2 ��.')
%     hold on;
    

    figure();
    S1040 = abs(fft(R1040(32100:359100))); % 327000 �����
    S1043 = abs(fft(R1043(9300:336300))); % 327000 �����
    
    slen = (length(S1040) - 1) / 2; % 163500 �����
    step = 16776/slen;
    x = 0:step:(16776 - step); % ����� ������
    
    plot(x, S1040(1:slen));
    hold on;
    plot(x, S1043(1:slen)*4, 'Color',[1, 0.2, 0.2, 0.6]);
    
    lg = legend('������� ����������', '��������� ����������');
    title(lg, '��� ������ 400 �� - 15 ���')
    
end

