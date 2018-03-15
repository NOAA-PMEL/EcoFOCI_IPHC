%% plot1nc_generic.m
%         PSullivan  11/26/2014  updated 3/15/2018
%  load NetCDF file, list variables.  Plot salinity
%      for use in QC of IPHC NetCDF files. Edit plot, compare to numbers.  Note where changes made.
%  NOTE: code at bottom to plot temp, O2, and pH
%
%%  ***  VARIABLES  ***
% hold - index of variable on 1-to-x scal2
% sal_varnum - holds index of variable on20-to-x scale
% ssal_temp - 4-d variable
% sal - 1-column variable
% ydep - consecutive array used as substitute for depth

%%  ***  Functions  ***
% parseVars.m - list variables in opened NetCDF file using 'ncid' as file identifier.


clear all

fname = 'ftwtri089.nc'
ncid=netcdf.open(fname,'NOWRITE')
%ncid=netcdf.open('ftwtri089.nc','NOWRITE')
% ncid=netcdf.open(fname,'NOWRITE')
parseVars

% Index of number, minus 1 (for 0 start (C-like)), get values, reshape to 1-col array
hold = strmatch('S_41',varList,'exact');
sal_varnum = hold-1;  clear hold;
ssal_temp = netcdf.getVar(ncid,sal_varnum);
sal = reshape(ssal_temp,length(ssal_temp),1);

hold = strmatch('pH_159',varList,'exact');
ph_varnum = hold-1;  clear hold;
ph_temp = netcdf.getVar(ncid,ph_varnum);
ph = reshape(ph_temp,length(ph_temp),1);

%hold = strmatch('F_903',varList,'exact');
 hold = strmatch('Chl_933',varList,'exact');
chl_varnum = hold-1;  clear hold;
chl_temp = netcdf.getVar(ncid,chl_varnum);
chl = reshape(chl_temp,length(chl_temp),1);

hold = strmatch('T_28',varList,'exact');
T_varnum = hold-1;  clear hold;
T_temp = netcdf.getVar(ncid,T_varnum);
T = reshape(T_temp,length(T_temp),1);

% Oxygen percent saturation
hold = strmatch('OST_62',varList,'exact');
OST_varnum = hold-1;  clear hold;
OST_temp = netcdf.getVar(ncid,OST_varnum);
OST = reshape(OST_temp,length(OST_temp),1);
% Oxygen percent saturation
hold = strmatch('O_65',varList,'exact');
O65_varnum = hold-1;  clear hold;
O65_temp = netcdf.getVar(ncid,O65_varnum);
O65 = reshape(O65_temp,length(O65_temp),1);

% Sigma-T
hold = strmatch('ST_70',varList,'exact');
ST_varnum = hold-1;  clear hold;
ST_temp = netcdf.getVar(ncid,ST_varnum);
ST = reshape(ST_temp,length(ST_temp),1);

ydep=linspace(1,length(sal),length(sal));
plot(sal,-ydep)
%  sal(1:9)

% plot(ph,-ydep)
% plot(T,-ydep)
% plot(OST,-ydep)

netcdf.close(ncid)
