function [betw]=group_betweenness(G,i)
j = find(sum(G));
q = setdiff(j,i);
n2=length(q);
betw=0;
for a=q
  for b=q
    [route_st]=shortestpathq(G,a,b);
    sl=length(route_st)-1;
    r = route_st(2:sl);
    if ismember(r,i)==1
    betw = betw + 1;
    end
   end
end
betw=betw./(n2^2-n2);

function [pathv,totalCost,distance]=shortestpathq(sbeG,x1,x2)
n=size(sbeG,1);
farthestPreviousHop=1:n;
farthestNextHop=1:n; 

if islogical(sbeG)
    sbeG=single(sbeG);
end
    sbeG(sbeG==0)=inf;


visited=false(1,n);
distance=inf(1,n);    % it stores the shortest distance between each node and the source node;
parent=zeros(1,n);


distance(x1) = 0;
for i = 1:(n-1)
    temp = [];
    for h = 1:n
         if ~visited(h)   % in the tree;
             temp=[temp distance(h)];
         else
             temp=[temp inf];
         end
     end;
     [~, u] = min(temp);   % it starts from node with the shortest distance to the source;
     visited(u) = true;       % mark it as visited;
     for v = 1:n           % for each neighbors of node u;
         if (sbeG(u, v) + distance(u)) < distance(v)
             distance(v) = distance(u) + sbeG(u, v);   % update the shortest distance when a shorter pathv is found;
             parent(v) = u;                            % update its parent;
         end;             
     end;
end;

pathv = [];
if parent(x2) ~= 0   % if there is a pathv!
    t = x2;
    pathv = x2;
    while t ~= x1
        p = parent(t);
        pathv = [p pathv];
        
        if sbeG(t, farthestPreviousHop(t)) < sbeG(t, p)
            farthestPreviousHop(t) = p;
        end;
        if sbeG(p, farthestNextHop(p)) < sbeG(p, t)
            farthestNextHop(p) = t;
        end;

        t = p;      
    end
end
totalCost = distance(x2);
