function dd()

%% ���  400 �� - 15 ��� ����. ������� 10 ���. ����� 1 ���.
% ������� ����������

%% 15 �����!
%% SINUS !
%%
    
    sn = '111111';
    fds = 50000; % ������� ������������� ��������� �������

    scrsz = get(groot,'ScreenSize');
    
    frawf=fopen(['D:/pcm/s' sn '.raw']);
    [SOURCE_SIGNAL, source_len] = fread(frawf, 'double');
    fclose(frawf);

%    w = blackmanharris(5000);
%    for i=1:5000
%     SOURCE_SIGNAL(i) = SOURCE_SIGNAL(i) * w(i);
%    end

    %% ������ �������� ������ � ��� ������
    figure('Name',['�������� ������ ' sn],'NumberTitle','off','Position',[10 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
    plot(SOURCE_SIGNAL, '-o');
    length(SOURCE_SIGNAL);
    
%     lg = legend('15 �����! SINUS! ������ 10 ���. ����� 1 ���.');
%     title(lg, '���  400 �� - 15 ���. ������� �����.');
    
    FULL_SPECTRUM = fft(SOURCE_SIGNAL);
    SOURCE_SPECTRUM = abs(FULL_SPECTRUM);
    PHASE_SPECTRUM = angle(FULL_SPECTRUM);
    
    figure('Name',['������ ��������� ������� ' sn],'NumberTitle','off','Position',[scrsz(3)/2 + 20 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
    
    slen = (length(SOURCE_SPECTRUM)) / 2; % 

    x = 0:fds/2/slen:(fds/2 - fds/2/slen); % ����� ������
    plot(x, SOURCE_SPECTRUM(1:slen), '-o');
%         
%     lg = legend('15 �����! SINUS! ������ 10 ���. ����� 1 ���.');
%     title(lg, '���  400 �� - 15 ���. ������� �����.');
    
%     figure();
%     plot(x, PHASE_SPECTRUM(1:slen));

    
end

