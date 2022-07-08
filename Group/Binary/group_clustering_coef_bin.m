function C=group_clustering_coef_bin(G,i)
%CLUSTERING_COEF_BU     Clustering coefficient
%
%   C = clustering_coef_bu(A);
%
%   The clustering coefficient is the fraction of triangles around a node
%   (equiv. the fraction of node’s neighbors that neighbors of each other).
%
%   Input:      A,      binary undirected connection matrix
%
%   Output:     C,      clustering coefficient vector
%
%   Reference: Watts and Strogatz (1998) Nature 393:440-442.
%
%
%   Mika Rubinov, UNSW, 2007-2010

n=length(i);
CC=zeros(n,1);

for u=i
    V=find(G(u,:));
    k(u)=length(V);
    if k(u)>=2;                %degree must be at least 2
        S=G(V,V);
        Cs(u)=sum(S(:));
        CC(u)=sum(S(:))/(k(u)^2-k(u));
    end
end
C = sum(CC)/n;