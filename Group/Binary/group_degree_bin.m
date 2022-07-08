function [deg1] = group_degree_bin(CIJ,i)
%CIJ = double(CIJ~=0);
CIJ = double(CIJ~=0);

%CIJ = double(CIJ~=0);
%disp(i);
V=[1:80];
%disp(V);
VMC= V(setxor(1:numel(V),i));    % VminusC
%disp(VMC);
if length(i)~=1 % Works for single nodal as well
x=max(CIJ(i,VMC));
else 
x=CIJ(i,VMC);
end
%disp(CIJ(i,VMC))
%disp(x);

deg = sum(x);
disp(deg)
deg1 = deg/numel(VMC);