function [typ] = znajdz_typ(par)
    if par>0.98
        typ='dlugopis';
    elseif par<0.35
        typ='okrag';
    else
        typ='nieznane';
end

