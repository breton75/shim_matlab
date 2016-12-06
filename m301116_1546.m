function dd()

%% ѕј ≈“ »ћѕ”Ћ№—ќ¬ однопол€рный 
% сигнал 0,4 сек. - тишина 0,4 сек. - сигнал 0,4 сек. - тишина - сигнал - и т.д.
% с каждым следующим сигналом увеличиваетс€ интервал между импульсами
% ширина импульса 20 мкс. ширина интервала мен€етс€ от 250 мкс до 2500 мкс., шаг 100 мкс.
% большой излучатель

%% 25 вольт!

%%

    sn = '301116_1546';
    fds = 100000; % частота дискретизации исходного сигнала
    fdr = 32552;  % частота дискретизации микрофона
    
    scrsz = get(groot,'ScreenSize');
    
    fpcm=fopen('2016_11_30 15_46_46 2 2 32552.pcm', 'r');
    [RECEIVED_SIGNAL, received_cnt] = fread(fpcm, 'float');
    fclose(fpcm);
    
    frawf=fopen(['s' sn '.raw']);
    [SOURCE_SIGNAL, source_cnt] = fread(frawf, 'double');
    fclose(frawf);

    %% рисуем полученный сигнал и его спектр
    figure('Name',['ѕрин€тый сигнал ' sn],'NumberTitle','off','Position',[10 scrsz(4)/2 - 35 scrsz(3)/2 - 50 scrsz(4)/2 - 50]);
    plot(RECEIVED_SIGNAL);
        
    lg = legend('0,4-0,4 сек. импульс 20 мкс. интервал 250 мкс - 2500 мкс., шаг 100 мкс.');
    title(lg, 'ѕј ≈“ »ћѕ”Ћ№—ќ¬ однопол€рный с увеличив. интервал. ЅќЋ№Ўќ… излуч..');
    
    figure('Name', ['—пектр прин€того сигнала'], 'NumberTitle','off','Position',[scrsz(3)/2 + 20 scrsz(4)/2 - 35 scrsz(3)/2 - 50 scrsz(4)/2 - 50]);
    RECEIVED_SPECTRUM = abs(fft(RECEIVED_SIGNAL)); %1800:2400
    slen = (length(RECEIVED_SPECTRUM) - 1) / 2; % 
    x = 0:fdr/2/slen:(fdr/2 - fdr/2/slen); % шкала частот
    
    plot(x, RECEIVED_SPECTRUM(1:slen));

    lg = legend('0,4-0,4 сек. импульс 20 мкс. интервал 250 мкс - 2500 мкс., шаг 100 мкс.');
    title(lg, 'ѕј ≈“ »ћѕ”Ћ№—ќ¬ однопол€рный с увеличив. интервал. ЅќЋ№Ўќ… излуч.');

%     for n=0:22
%         x0 = 20000 + 26000*n;
%         x1 = x0 + 9000;
%         i = 250 + 100*n;
%         RECEIVED_SPECTRUM = abs(fft(RECEIVED_SIGNAL(x0:x1))); %1800:2400
%         figure('Name', ['—пектр ' int2str(i) ' мкс.'], 'NumberTitle','off','Position',[scrsz(3)/2 + 20 150 560 150]);
%     
% %         slen = (length(RECEIVED_SPECTRUM) - 1) / 2; % 
% %         x = 0:fdr/2/slen:(fdr/2 - fdr/2/slen); % шкала частот
%         
%         slen = ((length(RECEIVED_SPECTRUM) - 1) / 2) * (10000/(fdr/2));
%         x = 0:10000/slen:(10000 - 10000/slen); % шкала частот
% 
%         plot(x, RECEIVED_SPECTRUM(1:slen));
%        
%         lg = legend(['„астота ' int2str(round(1/i *1000000, 0)) ' √ц']);
%         title(lg, ['є' int2str(n+1) '. ' int2str(i) ' мкс.']);
%         
%     end


    %% рисуем исходный сигнал и его спектр
    figure('Name',['»сходный сигнал ' sn],'NumberTitle','off','Position',[10 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
    plot(SOURCE_SIGNAL);

    lg = legend('0,4-0,4 сек. импульс 20 мкс. интервал 250 мкс - 2500 мкс., шаг 100 мкс.');
    title(lg, 'ѕј ≈“ »ћѕ”Ћ№—ќ¬ однопол€рный с увеличив. интервал. ЅќЋ№Ўќ… излуч.');
    
    SOURCE_SPECTRUM = abs(fft(SOURCE_SIGNAL)); %1800:2400
    figure('Name',['—пектр исходного сигнала ' sn],'NumberTitle','off','Position',[scrsz(3)/2 + 20 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
    
    slen = (length(SOURCE_SPECTRUM) - 1) / 2; % 
    x = 0:fds/2/slen:(fds/2 - fds/2/slen); % шкала частот
    plot(x, SOURCE_SPECTRUM(1:slen));
    
    lg = legend('0,4-0,4 сек. импульс 20 мкс. интервал 250 мкс - 2500 мкс., шаг 100 мкс.');
    title(lg, 'ѕј ≈“ »ћѕ”Ћ№—ќ¬ однопол€рный с увеличив. интервал. ЅќЋ№Ўќ… излуч.');
    
end

