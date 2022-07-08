function  [CP,D1] = group_characteristic_path(Ge,i)
%CP = sum(sum(D1(D1~=Inf)))/length(nonzeros(D1)); 
%N=length(Ge);
n = length(i);
D1 = distance_wei(Ge);
%disp(D1);
j = find(sum(Ge));

%q = setdiff(j,i);
r = D1(i,j);
disp(r)
F=sum(r(r~=Inf));

    CP=sum(F)./(n^2-n);  




function D=distance_wei(G)

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
