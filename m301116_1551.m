function dd()

%% ПАКЕТ СИНУСОВ с разной частотой
% сигнал 0,4 сек. - тишина 0,4 сек. - сигнал 0,4 сек. - тишина - сигнал - и т.д.
% каждый следующий сигнал имеет более высокую частоту
% начальная частота сигнала 400 Гц, конечная 4 кГц, шаг приращения частоты 100 Гц

%% маленький излучатель 25 вольт!

%%

    %[fn, fpath]=uigetfile('*.pcm', 'Файл PCM', 'd:/pcm/');
    %fpcm=fopen([fpath fn]);
    
    sn = '301116_1551';
    fds = 100000; % частота дискретизации исходного сигнала
    fdr = 32552;  % частота дискретизации микрофона
    
    scrsz = get(groot,'ScreenSize');
    
    fpcm=fopen('2016_11_30 15_51_01 2 2 32552.pcm', 'r');
    [RECEIVED_SIGNAL, received_cnt] = fread(fpcm, 'float');
    fclose(fpcm);

    
    %[fn, fpath]=uigetfile('*.rawf', 'Файл rawf', 'D:/c++/AME/Generators/');
    %frawf=fopen([fpath fn]);
    
    frawf=fopen(['s' sn '.raw']);
    [SOURCE_SIGNAL, source_cnt] = fread(frawf, 'double');
    fclose(frawf);

    % рисуем полученный сигнал и его спектр
    figure('Name',['Принятый сигнал ' sn],'NumberTitle','off','Position',[10 scrsz(4)/2 - 35 scrsz(3)/2 - 50 scrsz(4)/2 - 50]);
    plot(RECEIVED_SIGNAL);

    RECEIVED_SPECTRUM = abs(fft(RECEIVED_SIGNAL)); %1800:2400
    figure('Name',['Спектр принятого сигнала ' sn],'NumberTitle','off','Position',[scrsz(3)/2 + 20 scrsz(4)/2 - 35 scrsz(3)/2 - 50 scrsz(4)/2 - 50]);
    
    slen = (length(RECEIVED_SPECTRUM) - 1) / 2; % 
    x = 0:fdr/2/slen:(fdr/2 - fdr/2/slen); % шкала частот
    plot(x, RECEIVED_SPECTRUM(1:slen));


    % рисуем исходный сигнал и его спектр
    figure('Name',['Исходный сигнал ' sn],'NumberTitle','off','Position',[10 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
    plot(SOURCE_SIGNAL);

    SOURCE_SPECTRUM = abs(fft(SOURCE_SIGNAL)); %1800:2400
    figure('Name',['Спектр исходного сигнала ' sn],'NumberTitle','off','Position',[scrsz(3)/2 + 20 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
    
    slen = (length(SOURCE_SPECTRUM) - 1) / 2; % 
    x = 0:fds/2/slen:(fds/2 - fds/2/slen); % шкала частот
    plot(x, SOURCE_SPECTRUM(1:slen));
    
end

