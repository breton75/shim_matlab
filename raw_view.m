function dd()

%% Ћ„ћ  400 √ц - 15 к√ц длит. сигнала 10 сек. пауза 1 сек.
% большой излучатель

%% 15 вольт!
%% SINUS !
%%
    
    sn = '111111';
    fds = 50000; % частота дискретизации исходного сигнала

    scrsz = get(groot,'ScreenSize');
    
    frawf=fopen(['D:/pcm/s' sn '.raw']);
    [SOURCE_SIGNAL, source_len] = fread(frawf, 'double');
    fclose(frawf);

%    w = blackmanharris(5000);
%    for i=1:5000
%     SOURCE_SIGNAL(i) = SOURCE_SIGNAL(i) * w(i);
%    end

    %% рисуем исходный сигнал и его спектр
    figure('Name',['»сходный сигнал ' sn],'NumberTitle','off','Position',[10 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
    plot(SOURCE_SIGNAL, '-o');
    length(SOURCE_SIGNAL);
    
%     lg = legend('15 ¬ќЋ№“! SINUS! сигнал 10 сек. пауза 1 сек.');
%     title(lg, 'Ћ„ћ  400 √ц - 15 к√ц. ЅќЋ№Ўќ… излуч.');
    
    FULL_SPECTRUM = fft(SOURCE_SIGNAL);
    SOURCE_SPECTRUM = abs(FULL_SPECTRUM);
    PHASE_SPECTRUM = angle(FULL_SPECTRUM);
    
    figure('Name',['—пектр исходного сигнала ' sn],'NumberTitle','off','Position',[scrsz(3)/2 + 20 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
    
    slen = (length(SOURCE_SPECTRUM)) / 2; % 

    x = 0:fds/2/slen:(fds/2 - fds/2/slen); % шкала частот
    plot(x, SOURCE_SPECTRUM(1:slen), '-o');
%         
%     lg = legend('15 ¬ќЋ№“! SINUS! сигнал 10 сек. пауза 1 сек.');
%     title(lg, 'Ћ„ћ  400 √ц - 15 к√ц. ЅќЋ№Ўќ… излуч.');
    
%     figure();
%     plot(x, PHASE_SPECTRUM(1:slen));

    
end

