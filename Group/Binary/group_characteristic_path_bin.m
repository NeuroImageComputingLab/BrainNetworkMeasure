function  [CP] = group_characteristic_path_bin(Ge,i)
D1 = distance_bin(Ge);
%CP = sum(sum(D1(D1~=Inf)))/length(nonzeros(D1));
%N=length(Ge);
n=length(i);
j = find(sum(Ge));
%q = setdiff(j,i);
r = D1(i,j);
F=sum(r(r~=Inf));
CP=sum(F)./(n^2 - n); 

function D=distance_bin(G)
D=eye(length(G));
n=1;
nPATH=G;                        %n-path matrix
L=(nPATH~=0);                   %shortest n-path matrix

while find(L,1);
    D=D+n.*L;
    n=n+1;
    nPATH=nPATH*G;
    L=(nPATH~=0).*(D==0);
end

D(~D)=inf;                      %disconnected nodes are assigned d=inf;
D=D-eye(length(G));