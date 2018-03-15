%% listNCVars.m
%%      PSullivan  3/25/2011
%   display number and name of variables in a (pre-opened) NetCDF file
%   File handle should be named  ncid
%  to open: ncid=netcdf.open('03gbm3a_an9_0018m.nc','NC_NOWRITE');
% 
 
[ndims,nvars,nglatts,unlimdimid] = netcdf.inq(ncid);
count=sprintf('\t variables: %d',nvars);
disp(count)

% for loop.  nvars = number of iterations but starts at zero
for j=0:(nvars-1),
  j;
 [varname] = netcdf.inqVar(ncid,j);
% vars{j}={varname}
str=sprintf('%3d -- %s',j,varname);
disp(str)
end
% disp(varname)

