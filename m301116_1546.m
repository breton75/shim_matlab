function dd()

%% ����� ��������� ������������ 
% ������ 0,4 ���. - ������ 0,4 ���. - ������ 0,4 ���. - ������ - ������ - � �.�.
% � ������ ��������� �������� ������������� �������� ����� ����������
% ������ �������� 20 ���. ������ ��������� �������� �� 250 ��� �� 2500 ���., ��� 100 ���.
% ������� ����������

%% 25 �����!

%%

    sn = '301116_1546';
    fds = 100000; % ������� ������������� ��������� �������
    fdr = 32552;  % ������� ������������� ���������
    
    scrsz = get(groot,'ScreenSize');
    
    fpcm=fopen('2016_11_30 15_46_46 2 2 32552.pcm', 'r');
    [RECEIVED_SIGNAL, received_cnt] = fread(fpcm, 'float');
    fclose(fpcm);
    
    frawf=fopen(['s' sn '.raw']);
    [SOURCE_SIGNAL, source_cnt] = fread(frawf, 'double');
    fclose(frawf);

    %% ������ ���������� ������ � ��� ������
    figure('Name',['�������� ������ ' sn],'NumberTitle','off','Position',[10 scrsz(4)/2 - 35 scrsz(3)/2 - 50 scrsz(4)/2 - 50]);
    plot(RECEIVED_SIGNAL);
        
    lg = legend('0,4-0,4 ���. ������� 20 ���. �������� 250 ��� - 2500 ���., ��� 100 ���.');
    title(lg, '����� ��������� ������������ � ��������. ��������. ������� �����..');
    
    figure('Name', ['������ ��������� �������'], 'NumberTitle','off','Position',[scrsz(3)/2 + 20 scrsz(4)/2 - 35 scrsz(3)/2 - 50 scrsz(4)/2 - 50]);
    RECEIVED_SPECTRUM = abs(fft(RECEIVED_SIGNAL)); %1800:2400
    slen = (length(RECEIVED_SPECTRUM) - 1) / 2; % 
    x = 0:fdr/2/slen:(fdr/2 - fdr/2/slen); % ����� ������
    
    plot(x, RECEIVED_SPECTRUM(1:slen));

    lg = legend('0,4-0,4 ���. ������� 20 ���. �������� 250 ��� - 2500 ���., ��� 100 ���.');
    title(lg, '����� ��������� ������������ � ��������. ��������. ������� �����.');

%     for n=0:22
%         x0 = 20000 + 26000*n;
%         x1 = x0 + 9000;
%         i = 250 + 100*n;
%         RECEIVED_SPECTRUM = abs(fft(RECEIVED_SIGNAL(x0:x1))); %1800:2400
%         figure('Name', ['������ ' int2str(i) ' ���.'], 'NumberTitle','off','Position',[scrsz(3)/2 + 20 150 560 150]);
%     
% %         slen = (length(RECEIVED_SPECTRUM) - 1) / 2; % 
% %         x = 0:fdr/2/slen:(fdr/2 - fdr/2/slen); % ����� ������
%         
%         slen = ((length(RECEIVED_SPECTRUM) - 1) / 2) * (10000/(fdr/2));
%         x = 0:10000/slen:(10000 - 10000/slen); % ����� ������
% 
%         plot(x, RECEIVED_SPECTRUM(1:slen));
%        
%         lg = legend(['������� ' int2str(round(1/i *1000000, 0)) ' ��']);
%         title(lg, ['�' int2str(n+1) '. ' int2str(i) ' ���.']);
%         
%     end


    %% ������ �������� ������ � ��� ������
    figure('Name',['�������� ������ ' sn],'NumberTitle','off','Position',[10 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
    plot(SOURCE_SIGNAL);

    lg = legend('0,4-0,4 ���. ������� 20 ���. �������� 250 ��� - 2500 ���., ��� 100 ���.');
    title(lg, '����� ��������� ������������ � ��������. ��������. ������� �����.');
    
    SOURCE_SPECTRUM = abs(fft(SOURCE_SIGNAL)); %1800:2400
    figure('Name',['������ ��������� ������� ' sn],'NumberTitle','off','Position',[scrsz(3)/2 + 20 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
    
    slen = (length(SOURCE_SPECTRUM) - 1) / 2; % 
    x = 0:fds/2/slen:(fds/2 - fds/2/slen); % ����� ������
    plot(x, SOURCE_SPECTRUM(1:slen));
    
    lg = legend('0,4-0,4 ���. ������� 20 ���. �������� 250 ��� - 2500 ���., ��� 100 ���.');
    title(lg, '����� ��������� ������������ � ��������. ��������. ������� �����.');
    
end

