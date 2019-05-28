function [typ] = znajdz_typ(par)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    if par>0.98
        typ='dlugopis';
    elseif par<0.35
        typ='okrag';
    else
        typ='nieznane';
end

