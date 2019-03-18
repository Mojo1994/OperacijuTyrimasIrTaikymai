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