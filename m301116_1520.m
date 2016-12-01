function dd()

%% ѕј ≈“ —»Ќ”—ќ¬ с разной частотой
% сигнал 0,4 сек. - тишина 0,4 сек. - сигнал 0,4 сек. - тишина - сигнал - и т.д.
% каждый следующий сигнал имеет более высокую частоту
% начальна€ частота сигнала 400 √ц, конечна€ 4 к√ц, шаг приращени€ частоты 100 √ц
% большой излучатель 25 вольт!

%%

    %[fn, fpath]=uigetfile('*.pcm', '‘айл PCM', 'd:/pcm/');
    %fpcm=fopen([fpath fn]);
    
    sn = '301116_1520';
    fds = 100000; % частота дискретизации исходного сигнала
    fdr = 32552;  % частота дискретизации микрофона
    
    scrsz = get(groot,'ScreenSize');
    
    fpcm=fopen('2016_11_30 15_20_35 2 6 32552.pcm', 'r');
    [RECEIVED_SIGNAL, received_cnt] = fread(fpcm, 'float');
    fclose(fpcm);

    
    %[fn, fpath]=uigetfile('*.rawf', '‘айл rawf', 'D:/c++/AME/Generators/');
    %frawf=fopen([fpath fn]);
    
    frawf=fopen(['s' sn '.raw']);
    [SOURCE_SIGNAL, source_cnt] = fread(frawf, 'double');
    fclose(frawf);

    % рисуем полученный сигнал и его спектр
    figure('Name',['ѕрин€тый сигнал ' sn],'NumberTitle','off','Position',[10 scrsz(4)/2 - 35 scrsz(3)/2 - 50 scrsz(4)/2 - 50]);
    plot(RECEIVED_SIGNAL);



%     data = [];
    for n=20:36
%        data = [data(:); 76000 + 26000*n];
       
       x0 = 76000 + 26000*n;
       x1 = x0 + 10000;
       RECEIVED_SPECTRUM = abs(fft(RECEIVED_SIGNAL(x0:x1))); %1800:2400
       figure('Name',['—пектр ' int2str(400 + 100*n) ' √ц'],'NumberTitle','off','Position',[scrsz(3)/2 + 20 150 560 150]);
    
       slen = (length(RECEIVED_SPECTRUM) - 1) / 2; % 
       x = 0:fdr/2/slen:(fdr/2 - fdr/2/slen); % шкала частот
       plot(x, RECEIVED_SPECTRUM(1:slen));
       
       lg = legend(['ѕакет ' int2str(n+1)])
       title(lg, [int2str(400 + 100*n) ' √ц'])
        
    end
%     disp(data);
    % рисуем исходный сигнал и его спектр
%     figure('Name',['»сходный сигнал ' sn],'NumberTitle','off','Position',[10 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
%     plot(SOURCE_SIGNAL);
% 
%     SOURCE_SPECTRUM = abs(fft(SOURCE_SIGNAL)); %1800:2400
%     figure('Name',['—пектр исходного сигнала ' sn],'NumberTitle','off','Position',[scrsz(3)/2 + 20 20 scrsz(3)/2 - 50 scrsz(4)/2 - 140]);
%     
%     slen = (length(SOURCE_SPECTRUM) - 1) / 2; % 
%     x = 0:fds/2/slen:(fds/2 - fds/2/slen); % шкала частот
%     plot(x, SOURCE_SPECTRUM(1:slen));
    
end

