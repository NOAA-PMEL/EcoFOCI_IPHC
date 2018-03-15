%%  sigma_t_calc.m
%%    Contributed by Jim Manning.  From WHOI Globec resources 5/6/1996.
%        http://globec.whoi.edu/globec-dir/sigmat-calc-matlab.html
% 
% MATLAB code used to compute Sigma T given salinity and temperature values.
% Based on a standard developed by the United Nations.
%

function sig=sigmat(s,t)
%	returns sig=sigmat(s,t) where s,t can be column vectors
%	from page 17, Fofonoff and Millard
a=[6.536332e-9,-1.120083e-6,1.001685e-4,-9.095290e-3,6.793952e-2,999.842594];
b=[5.3875e-9,-8.2467e-7,7.6438e-5,-4.0899e-3,8.24493e-1];
c=[-1.6546e-6,1.0227e-4,-5.72466e-3];
d=4.8314e-4;
sig=polyval(a,t)+(polyval(b,t)+polyval(c,t).*sqrt(s)+d*s).*s;

