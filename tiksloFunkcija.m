function [tiksloFunkcijosReiksme] = tiksloFunkcija(t)
    b = mod(20132226, 7)/2 + 2.5;
    c2 = mod(20132226, 30) + 150;
    c = mod(20132226, 5) + 3;
    tiksloFunkcijosReiksme = c2./t + c * t * b;
end