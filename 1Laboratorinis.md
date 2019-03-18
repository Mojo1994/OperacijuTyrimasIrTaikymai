Duota:
* ![](/OperacijuTyrimasIrTaikymai/b.gif)
* ![](/OperacijuTyrimasIrTaikymai/c2.gif)
* ![](/OperacijuTyrimasIrTaikymai/c.gif)

**Matematinis modelis**
* Vienkartinės (vienos dienos) prekių išdavimo išlaidos - ![](/OperacijuTyrimasIrTaikymai/Vien.gif) Lt.
* Vienos dienos prekių priėmimo ir pakrovimo į sandėlį išlaidos - ![](/OperacijuTyrimasIrTaikymai/VienD.gif) Lt.
* Prekybos bazės išlaidos per parą aprašomos kintamojo t funkcija:
* ![](/OperacijuTyrimasIrTaikymai/IslaidPerPara.gif).
* Be to, žinome, kad ![](/OperacijuTyrimasIrTaikymai/Kad.gif), todėl ![](/OperacijuTyrimasIrTaikymai/todel.gif)
* Taigi, uždavinio matematinis modelis: ![](/OperacijuTyrimasIrTaikymai/MatMod.gif)


## Tikslo funkcija
```Matlab
function [tiksloFunkcijosReiksme] = tiksloFunkcija(t)
    b = mod(20132226, 7)/2 + 2.5;
    c2 = mod(20132226, 30) + 150;
    c = mod(20132226, 5) + 3;
    tiksloFunkcijosReiksme = c2./t + c * t * b;
end
```

## Intervalo dalijimo pusiau metodas
```Matlab
function [minFunkcijos, min_vidurioTaskas, iteracija, intervaloIlgis, xpoint, xvalue] = intervaloDalijimasPusiau(a, b) % a - pradzia, b - pabaiga
    iteracija = 1;
    vidurioTaskas = (a + b)/2;
    FvidurioTaskas = tiksloFunkcija(vidurioTaskas);
    min_vidurioTaskas = vidurioTaskas;
    F_1vidurioTaskas = FvidurioTaskas;
    F_2vidurioTaskas = FvidurioTaskas;
    xpoint(iteracija) = vidurioTaskas;
    xvalue(iteracija) = F_1vidurioTaskas;
    b_new = b;
    a_new = a;
    intervaloIlgis = b - a;
    naujasIntervaloIlgis = intervaloIlgis;

    while F_2vidurioTaskas >= F_1vidurioTaskas
            iteracija = iteracija + 1;
            x1 = a + intervaloIlgis/4;
            x2 = b - intervaloIlgis/4;
            Fx1 = tiksloFunkcija(x1);
            Fx2 = tiksloFunkcija(x2);
        if (Fx1 < FvidurioTaskas)
            b = vidurioTaskas;
            vidurioTaskas = x1;
        else
            if (Fx2 < FvidurioTaskas)
                a = vidurioTaskas;
                vidurioTaskas = x2;
            else
                a = x1;
                b = x2;
            end
        end
        F_1vidurioTaskas = tiksloFunkcija(vidurioTaskas);
    
        xpoint(iteracija) = vidurioTaskas;
        xvalue(iteracija) = F_1vidurioTaskas;
        intervaloIlgis = b - a;
    
        if(F_2vidurioTaskas > F_1vidurioTaskas)
            naujasIntervaloIlgis = intervaloIlgis;
            b_new = b;
            a_new = a;
            min_vidurioTaskas = vidurioTaskas;
            F_2vidurioTaskas = F_1vidurioTaskas;
        end
    end
    minFunkcijos = F_2vidurioTaskas;
end
```
## Grafiko braizymas
```Matlab
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
```

## Grafikai

<center>
**Auksinio pjūvio ir kvadratinės interpoliacijos metodas**
</center>
<p align="center">
<img src="/OperacijuTyrimasIrTaikymai/APKIM.jpg">
</p>

<center>
**Intervalo dalijimo pusiau metodas**
</center>
<p align="center">
<img src="/OperacijuTyrimasIrTaikymai/KT.jpg">
</p>

<p align="center">
<img src="/OperacijuTyrimasIrTaikymai/DP.jpg">
</p>