function E=global_efficiency_bin(G,i)
%N=length(G);
n=length(i);
e=distance_inv(G);
j = find(sum(G));
%q = setdiff(j,i);
F=sum(e(i,j));
E=sum(F)./(n^2 - n);               %global efficiency

function D=distance_inv(g)
D=eye(length(g));
n=1;
nPATH=g;                        %n-path matrix
L=(nPATH~=0);                   %shortest n-path matrix

while find(L,1);
    D=D+n.*L;
    n=n+1;
    nPATH=nPATH*g;
    L=(nPATH~=0).*(D==0);
end

D(~D)=inf;                      %disconnected nodes are assigned d=inf;
D=1./D;                         %invert distance
D=D-eye(length(g));