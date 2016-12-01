function dd()

%% ШУМ  0,4 - 0,4 - 0,4 - 3 сек.
% сигнал - тишина - повтор того же сигнала - пауза 3 сек.
% большой излучатель

%%
    
    sn = '1056';
    fds = 100000; % частота дискретизации исходного сигнала
    fdr = 32552;  % частота дискретизации микрофона
    
    scrsz = get(groot,'ScreenSize');
    
    fpcm=fopen('2016_11_24 10_56_33 2 6 32552.pcm', 'r');
    [RECEIVED_SIGNAL, received_cnt] = fread(fpcm, 'float');
    fclose(fpcm);
    
    frawf=fopen(['s' sn '.raw']);
    [SOURCE_SIGNAL, source_cnt] = fread(frawf, 'double');
    fclose(frawf);

    %% рисуем полученный сигнал и его спектр
    figure('Name',['Принятый сигнал ' sn],'NumberTitle','off','Position',[10 scrsz(4)/2 - 35 scrsz(3)/2 - 50 scrsz(4)/2 - 50]);
    plot(RECEIVED_SIGNAL);
    
    lg = legend('0,4-0,4-0,4-3 сек.');
    title(lg, 'ШУМ аналоговый. БОЛЬШОЙ излуч.');
    
    RECEIVED_SPECTRUM = abs(fft(RECEIVED_SIGNAL(43510:82572))); %1800:2400
    figure('Name',['Спектр принятого сигнала ' sn],'NumberTitle','off','Position',[scrsz(3)/2 + 20 scrsz(4)/2 - 35 scrsz(3)/2 - 50 scrsz(4)/2 - 50]);
    
    slen = (length(RECEIVED_SPECTRUM) - 1) / 2; % 
    x = 0:fdr/2/slen:(fdr/2 - fdr/2/slen); % шкала частот
    plot(x, RECEIVED_SPECTRUM(1:slen));
    
    lg = legend('0,4-0,4-0,4-3 сек.');
    title(lg, 'ШУМ аналоговый. БОЛЬШОЙ излуч.');

    %% рисуем исходный сигнал и его спектр
    figure('Name',['Исходный сигнал ' sn],'NumberTitle','off','Position',[10 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
    plot(SOURCE_SIGNAL);
    
    lg = legend('0,4-0,4-0,4-3 сек.');
    title(lg, 'ШУМ аналоговый. БОЛЬШОЙ излуч.');
    
    % спектр исходного сигнала
    SOURCE_SPECTRUM = abs(fft(SOURCE_SIGNAL)); %1800:2400
    figure('Name',['Спектр исходного сигнала ' sn],'NumberTitle','off','Position',[scrsz(3)/2 + 20 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
    
    slen = (length(SOURCE_SPECTRUM) - 1) / 2; % 
    x = 0:fds/2/slen:(fds/2 - fds/2/slen); % шкала частот
    plot(x, SOURCE_SPECTRUM(1:slen));
    
    lg = legend('0,4-0,4-0,4-3 сек.');
    title(lg, 'ШУМ аналоговый. БОЛЬШОЙ излуч.');
end

