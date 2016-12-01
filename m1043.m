function dd()

%% Ћ„ћ  400 √ц - 15 к√ц длит. сигнала 10 сек. пауза 1 сек. 
% маленький излучатель

%%

    %[fn, fpath]=uigetfile('*.pcm', '‘айл PCM', 'd:/pcm/');
    %fpcm=fopen([fpath fn]);
    
    sn = '1043';
    fds = 100000; % частота дискретизации исходного сигнала
    fdr = 32552;  % частота дискретизации микрофона
    
    scrsz = get(groot,'ScreenSize');
    
    fpcm=fopen('2016_11_24 10_43_31 2 6 32552.pcm', 'r');
    [RECEIVED_SIGNAL, received_cnt] = fread(fpcm, 'float');
    fclose(fpcm);

    
    %[fn, fpath]=uigetfile('*.rawf', '‘айл rawf', 'D:/c++/AME/Generators/');
    %frawf=fopen([fpath fn]);
    
    frawf=fopen(['s' sn '.raw']);
    [SOURCE_SIGNAL, source_cnt] = fread(frawf, 'double');
    fclose(frawf);

    %% рисуем полученный сигнал и его спектр
    figure('Name',['ѕрин€тый сигнал ' sn],'NumberTitle','off','Position',[10 scrsz(4)/2 - 35 scrsz(3)/2 - 50 scrsz(4)/2 - 50]);
    plot(RECEIVED_SIGNAL);
    
    lg = legend('сигнал 10 сек. пауза 1 сек.');
    title(lg, 'Ћ„ћ  400 √ц - 15 к√ц. маленький излуч.');
    
    RECEIVED_SPECTRUM = abs(fft(RECEIVED_SIGNAL)); %1800:2400
    figure('Name',['—пектр прин€того сигнала ' sn],'NumberTitle','off','Position',[scrsz(3)/2 + 20 scrsz(4)/2 - 35 scrsz(3)/2 - 50 scrsz(4)/2 - 50]);
    
    slen = (length(RECEIVED_SPECTRUM) - 1) / 2; % 
    x = 0:fdr/2/slen:(fdr/2 - fdr/2/slen); % шкала частот
    plot(x, RECEIVED_SPECTRUM(1:slen));
    
    lg = legend('сигнал 10 сек. пауза 1 сек.');
    title(lg, 'Ћ„ћ  400 √ц - 15 к√ц. маленький излуч.');


    %% рисуем исходный сигнал и его спектр
    figure('Name',['»сходный сигнал ' sn],'NumberTitle','off','Position',[10 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
    plot(SOURCE_SIGNAL);
    
    lg = legend('сигнал 10 сек. пауза 1 сек.');
    title(lg, 'Ћ„ћ  400 √ц - 15 к√ц. маленький излуч.');
    
    SOURCE_SPECTRUM = abs(fft(SOURCE_SIGNAL)); %1800:2400
    figure('Name',['—пектр исходного сигнала ' sn],'NumberTitle','off','Position',[scrsz(3)/2 + 20 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
    
    slen = (length(SOURCE_SPECTRUM) - 1) / 2; % 
    x = 0:fds/2/slen:(fds/2 - fds/2/slen); % шкала частот
    plot(x, SOURCE_SPECTRUM(1:slen));
        
    lg = legend('сигнал 10 сек. пауза 1 сек.');
    title(lg, 'Ћ„ћ  400 √ц - 15 к√ц. маленький излуч.');
    
end

