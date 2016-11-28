function dd()

%% МЕАНДР двуполярный чередующийся (0 1 0 -1 0 1 0 -1) с постоянным интервалом
% ширина импульса 0,2 мс. ширина интервала 0,2 мс.
%  0,4 - 0,4 - 0,4 - 3 сек.
% сигнал - тишина - повтор того же сигнала - пауза 3 сек.
% большой излучатель

%%

    %[fn, fpath]=uigetfile('*.pcm', 'Файл PCM', 'd:/pcm/');
    %fpcm=fopen([fpath fn]);
    
    sn = '1229';
    
    scrsz = get(groot,'ScreenSize');
    
    fpcm=fopen('2016_11_23 12_29_57 2 1 32552.pcm', 'r');
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
    plot(RECEIVED_SPECTRUM(1:received_cnt/2));


    % рисуем исходный сигнал и его спектр
    figure('Name',['Исходный сигнал ' sn],'NumberTitle','off','Position',[10 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
    plot(SOURCE_SIGNAL);

    SOURCE_SPECTRUM = abs(fft(SOURCE_SIGNAL)); %1800:2400
    figure('Name',['Спектр исходного сигнала ' sn],'NumberTitle','off','Position',[scrsz(3)/2 + 20 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
    plot(SOURCE_SPECTRUM(1:source_cnt/2));
    
end

