function [outputArg1,outputArg2] = minIslaidos(a, b)
    [minFunkcijos, min_vidurioTaskas, iteracija, intervaloIlgis, xpoint, xvalue] = intervaloDalijimasPusiau(a, b)
    vidurioTaskas = (a + b)/2;
    vidurioTaskas_floor = floor(vidurioTaskas);
    tiksloFunkcija_floor = tiksloFunkcija(vidurioTaskas_floor);
    virdurioTaskas_ceil = ceil(vidurioTaskas);
    tiksloFunkcija_ceil = tiksloFunkcija(virdurioTaskas_ceil);
    
    if (tiksloFunkcija_floor > tiksloFunkcija_ceil)
        islaidos = tiksloFunkcija_ceil;
        t = vidurioTaskas_ceil;
    else
        islaidos = tiksloFunkcija_floor;
        t = vidurioTaskas_floor;
    end
    
    x = a:1:b;
    y = tiksloFunkcija(x);
    
    options = optimset('Display', 'iter','MaxFunEvals', 1000,'PlotFcns', @optimplotfval , 'TolX', intervaloIlgis);
    [x_fminbnd, F_fminbnd] = fminbnd(@tiksloFunkcija, a, b, options);
    
    figure
    plot(x, y, ':r')
    legend('Kiekviename taske');
    xlabel('Prekiu vezimo periodas');
    ylabel('Islaidos per diena');
    
    figure
    plot(xpoint, xvalue, '--b')
    legend('Dalijant pusiau');
    xlabel('Prekiu vezimo periodas');
    ylabel('Islaidos per diena');
    
end