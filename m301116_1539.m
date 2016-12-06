function dd()

%% »ћѕ”Ћ№— однопол€рный со случайным интервалом
% ширина импульса 20 мкс. ширина интервала случайно 0,1 - 1 мс. закон распределени€ треугольник, со смещением вершины к минимальному значению
%  0,4 - 0,1 - 0,4 - 1 сек.
% сигнал - тишина - повтор того же сигнала - пауза 1 сек.
% большой излучатель

%% 25 вольт!

%%
    sn = '301116_1539';
    fds = 100000; % частота дискретизации исходного сигнала
    fdr = 32552;  % частота дискретизации микрофона
    
    scrsz = get(groot,'ScreenSize');
    
    fpcm=fopen('2016_11_30 15_39_38 2 2 32552.pcm', 'r');
    [RECEIVED_SIGNAL, received_cnt] = fread(fpcm, 'float');
    fclose(fpcm);
    
    frawf=fopen(['s' sn '.raw']);
    [SOURCE_SIGNAL, source_cnt] = fread(frawf, 'double');
    fclose(frawf);
    

    %% рисуем полученный сигнал и его спектр
    figure('Name',['ѕрин€тый сигнал ' sn],'NumberTitle','off','Position',[10 scrsz(4)/2 - 35 scrsz(3)/2 - 50 scrsz(4)/2 - 50]);
    plot(RECEIVED_SIGNAL);
        
    lg = legend('0,4-0,1-0,4-1 сек. импульс 20 мкс. интервал 250 мкс - 2500 мкс., шаг 100 мкс.');
    title(lg, '»ћѕ”Ћ№— однопол€рный со случайным интервалом. ЅќЋ№Ўќ… излуч.');
    
    figure('Name',['—пектр прин€того сигнала ' sn],'NumberTitle','off','Position',[scrsz(3)/2 + 20 scrsz(4)/2 - 35 scrsz(3)/2 - 50 scrsz(4)/2 - 50]);
%     RECEIVED_SPECTRUM = abs(fft(RECEIVED_SIGNAL)); %1800:2400
    RECEIVED_SPECTRUM1 = abs(fft(RECEIVED_SIGNAL(19000:29000))); %1800:2400
    RECEIVED_SPECTRUM2 = abs(fft(RECEIVED_SIGNAL(35000:45000))); %1800:2400
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
        
    lg = legend('0,4-0,1-0,4-1 сек. импульс 20 мкс. интервал 250 мкс - 2500 мкс., шаг 100 мкс.');
    title(lg, '»ћѕ”Ћ№— однопол€рный со случайным интервалом. ЅќЋ№Ўќ… излуч.');


    %% рисуем исходный сигнал и его спектр
    figure('Name',['»сходный сигнал ' sn],'NumberTitle','off','Position',[10 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
    plot(SOURCE_SIGNAL);
        
    lg = legend('0,4-0,1-0,4-1 сек. импульс 20 мкс. интервал 250 мкс - 2500 мкс., шаг 100 мкс.');
    title(lg, '»ћѕ”Ћ№— однопол€рный со случайным интервалом. ЅќЋ№Ўќ… излуч.');
    
    SOURCE_SPECTRUM = abs(fft(SOURCE_SIGNAL)); %1800:2400
    figure('Name',['—пектр исходного сигнала ' sn],'NumberTitle','off','Position',[scrsz(3)/2 + 20 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
    
    slen = (length(SOURCE_SPECTRUM) - 1) / 2; % 
    x = 0:fds/2/slen:(fds/2 - fds/2/slen); % шкала частот
    plot(x, SOURCE_SPECTRUM(1:slen));
            
    lg = legend('0,4-0,1-0,4-1 сек. импульс 20 мкс. интервал 250 мкс - 2500 мкс., шаг 100 мкс.');
    title(lg, '»ћѕ”Ћ№— однопол€рный со случайным интервалом. ЅќЋ№Ўќ… излуч.');
    
    
end

