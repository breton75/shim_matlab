function dd()

%% Ўумовой сигнал в диапазоне частот 1100 - 1900 √ц и 2100 - 4100 √ц
%  0,5 - 0,5 - 3 сек.
% сигнал - повтор того же сигнала - пауза 3 сек.
% большой излучатель

%% в конце и начале сигнала обрезано 100 отсчетов, дл€ устранени€ пиков
%  13 вольт!

%%
    sn = 's_09_12_2016_13_28_53';
    fds = 100000; % частота дискретизации исходного сигнала
    fdr = 48828;  % частота дискретизации микрофона
    
    scrsz = get(groot,'ScreenSize');
    
    fpcm=fopen('09122016\pcm\2016_12_09 13_28_24 2 1 48828.pcm', 'r');
    [RECEIVED_SIGNAL, received_cnt] = fread(fpcm, 'float');
    fclose(fpcm);
    
    frawf=fopen(['09122016\log\' sn '.raw']);
    [SOURCE_SIGNAL, source_cnt] = fread(frawf, 'double');
    fclose(frawf);
    

    %% рисуем полученный сигнал и его спектр
    figure('Name',['ѕрин€тый сигнал ' sn],'NumberTitle','off','Position',[10 scrsz(4)/2 - 35 scrsz(3)/2 - 50 scrsz(4)/2 - 50]);
    plot(RECEIVED_SIGNAL);
        
    lg = legend('Ўумовой сигнал в диапазоне частот 1100 - 1900 √ц и 2100 - 4100 √ц');
    title(lg, '0,5 - 0,5 - 3 сек. в конце и начале обрезано 100 отсчетов. ЅќЋ№Ўќ… излуч.');
    
    figure('Name',['—пектр прин€того сигнала ' sn],'NumberTitle','off','Position',[scrsz(3)/2 + 20 scrsz(4)/2 - 35 scrsz(3)/2 - 50 scrsz(4)/2 - 50]);
%     RECEIVED_SPECTRUM = abs(fft(RECEIVED_SIGNAL)); %1800:2400
    RECEIVED_SPECTRUM1 = abs(fft(RECEIVED_SIGNAL(103692:127692))); %24000
    RECEIVED_SPECTRUM2 = abs(fft(RECEIVED_SIGNAL(127693:151693))); 
%     RECEIVED_SPECTRUM3 = abs(fft(RECEIVED_SIGNAL(192000:203000))); %1800:2400
%     RECEIVED_SPECTRUM4 = abs(fft(RECEIVED_SIGNAL(218000:229000))); %1800:2400
    
    slen = (length(RECEIVED_SPECTRUM1) - 1) / 2; % 
    x = 0:fdr/2/slen:(fdr/2 - fdr/2/slen); % шкала частот
    
    plot(x, RECEIVED_SPECTRUM1(1:slen));
    hold on
    plot(x, RECEIVED_SPECTRUM2(1:slen));
%     hold on
%     plot(x, RECEIVED_SPECTRUM3(1:slen));
%     hold on
%     plot(x, RECEIVED_SPECTRUM4(1:slen));
        
    lg = legend('Ўумовой сигнал в диапазоне частот 1100 - 1900 √ц и 2100 - 4100 √ц');
    title(lg, '0,5 - 0,5 - 3 сек. в конце и начале обрезано 100 отсчетов. ЅќЋ№Ўќ… излуч.');


    %% рисуем исходный сигнал и его спектр
    figure('Name',['»сходный сигнал ' sn],'NumberTitle','off','Position',[10 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
    plot(SOURCE_SIGNAL);
        
    lg = legend('Ўумовой сигнал в диапазоне частот 1100 - 1900 √ц и 2100 - 4100 √ц');
    title(lg, '0,5 - 0,5 - 3 сек. в конце и начале обрезано 100 отсчетов. ЅќЋ№Ўќ… излуч.');
    
    SOURCE_SPECTRUM = abs(fft(SOURCE_SIGNAL)); %1800:2400
    figure('Name',['—пектр исходного сигнала ' sn],'NumberTitle','off','Position',[scrsz(3)/2 + 20 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
    
    slen = (length(SOURCE_SPECTRUM) - 1) / 2; % 
    x = 0:fds/2/slen:(fds/2 - fds/2/slen); % шкала частот
    plot(x, SOURCE_SPECTRUM(1:slen));
            
    lg = legend('Ўумовой сигнал в диапазоне частот 1100 - 1900 √ц и 2100 - 4100 √ц');
    title(lg, '0,5 - 0,5 - 3 сек. в конце и начале обрезано 100 отсчетов. ЅќЋ№Ўќ… излуч.');
    
    
end

