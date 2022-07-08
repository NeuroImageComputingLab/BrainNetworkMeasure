function C=group_clustering_coef_wu(W,i)
K=sum(W~=0,2);         	
cyc3=diag((W.^(1/3))^3);           
K(cyc3==0)=inf;             %if no 3-cycles exist, make C=0 (via K=inf)
n = length(i);
C=sum(cyc3(i)./(K(i).*(K(i)-1)))./n;         