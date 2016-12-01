function dd()

%% ПАКЕТ МЕАНДРОВ однополярный с постоянным интервалом
% сигнал 0,4 сек. - тишина 0,4 сек. - сигнал 0,4 сек. - тишина - сигнал - и т.д.
% с каждым следующим сигналом увеличивается интервал между импульсами
% ширина импульса 20 мкс. ширина интервала меняется от 250 мкс до 2500 мкс., шаг 100 мкс.
% большой излучатель

%% 25 вольт!

%%

    %[fn, fpath]=uigetfile('*.pcm', 'Файл PCM', 'd:/pcm/');
    %fpcm=fopen([fpath fn]);
    
    sn = '301116_1546';
    fds = 100000; % частота дискретизации исходного сигнала
    fdr = 32552;  % частота дискретизации микрофона
    
    scrsz = get(groot,'ScreenSize');
    
    fpcm=fopen('2016_11_30 15_46_46 2 2 32552.pcm', 'r');
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

    for n=0:22
        x0 = 20000 + 26000*n;
        x1 = x0 + 9000;
        i = 250 + 100*n;
        RECEIVED_SPECTRUM = abs(fft(RECEIVED_SIGNAL(x0:x1))); %1800:2400
        figure('Name', ['Спектр ' int2str(i) ' мкс.'], 'NumberTitle','off','Position',[scrsz(3)/2 + 20 150 560 150]);
    
%         slen = (length(RECEIVED_SPECTRUM) - 1) / 2; % 
%         x = 0:fdr/2/slen:(fdr/2 - fdr/2/slen); % шкала частот
        
        slen = ((length(RECEIVED_SPECTRUM) - 1) / 2) * (10000/(fdr/2));
        x = 0:10000/slen:(10000 - 10000/slen); % шкала частот

        plot(x, RECEIVED_SPECTRUM(1:slen));
       
        lg = legend(['Частота ' int2str(round(1/i *1000000, 0)) ' Гц']);
        title(lg, ['№' int2str(n+1) '. ' int2str(i) ' мкс.']);
        
    end


    % рисуем исходный сигнал и его спектр
%     figure('Name',['Исходный сигнал ' sn],'NumberTitle','off','Position',[10 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
%     plot(SOURCE_SIGNAL);
% 
%     SOURCE_SPECTRUM = abs(fft(SOURCE_SIGNAL)); %1800:2400
%     figure('Name',['Спектр исходного сигнала ' sn],'NumberTitle','off','Position',[scrsz(3)/2 + 20 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
%     
%     slen = (length(SOURCE_SPECTRUM) - 1) / 2; % 
%     x = 0:fds/2/slen:(fds/2 - fds/2/slen); % шкала частот
%     plot(x, SOURCE_SPECTRUM(1:slen));
    
end

