function E=global_efficiency_wei(Ge,i)
%N=length(Ge);
n = length(i);
e=distance_inv_wei(Ge);
j = find(sum(Ge));
q = j;
%q = setdiff(j,i);
F=sum(e(i,q));
E=sum(F)./(n^2 - n);     

function D=distance_inv_wei(G)

n=length(G);
D=zeros(n); D(~eye(n))=inf;                 %distance matrix

for u=1:n
    S=true(1,n);                            %distance permanence (true is temporary)
    G1=G;
    V=u;
    while 1
        S(V)=0;                             %distance u->V is now permanent
        G1(:,V)=0;                          %no in-edges as already shortest
        for v=V
            W=find(G1(v,:));                %neighbours of shortest nodes
            D(u,W)=min([D(u,W);D(u,v)+G1(v,W)]); %smallest of old/new path lengths
        end

        minD=min(D(u,S));
        if isempty(minD)||isinf(minD),      %isempty: all nodes reached;
            break,                          %isinf: some nodes cannot be reached
        end;
        V=find(D(u,:)==minD);
    end
end

D=1./D;                                  %invert distance
D(1:n+1:end)=0;