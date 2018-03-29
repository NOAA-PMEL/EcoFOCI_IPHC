%  parseVars.m
%      PSullivan   05/02/2012
%
%  For already-loaded *.nc file, lists variable names into a column-wise array.

aa= netcdf.inqVarIDs(ncid);
k=length(aa);
   for j = 1:k
      vars{j} = netcdf.inqVar(ncid,j-1);
   end
   varList = vars';
   disp('variables in file')
   disp(varList)
   clear vars aa k;
   
%hold = strmatch('T_20',varList,'exact');
%t_vnum = hold-1;  clear hold;
%hold = strmatch('S_41',varList,'exact');
%s_vnum = hold-1;  clear hold;
%hold = strmatch('latitude',varList,'exact');
%lat_vnum = hold-1;  clear hold;
%hold = strmatch('longitude',varList,'exact');
%lon_vnum = hold-1;  clear hold;
%   *****   inqVar - variables listed from 0 to 9 (total 10)
%   *****   strmatch - finds string using 1 to 10 (total 10)
%hold4d = netcdf.getVar(ncid,t_vnum);
%temp1 = reshape(hold4d,length(hold4d),1);  clear hold4d;
%hold4d = netcdf.getVar(ncid,s_vnum);
%sal1 = reshape(hold4d,length(hold4d),1);  clear hold4d;

