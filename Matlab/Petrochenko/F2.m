function s=F2(l, k, t, M, V)

% Parameters initialization
d=zeros(1, length(t));
p=zeros(1, length(t));
s=zeros(1, length(t));
%-------------------------
for i=1:length(t)    
%---------------------- 1st iteration      
    if i==1 
      d(i)=V(i);
      p(i)=d(i);
      s(i)=p(i)+M*d(i);
    end
%-----------------------------------

%----------------------------------------------- when number of iteration "d" is less than l+k
    if i>1 && i<=(l+k) % if number of iteration "d" less than l and less than k
        if i<=l && i<=k
           d(i)=V(i);
        end      
        if i>k   % if number of iteration "d" more by one than k
            d(i)=V(i)- V(i-k);
        end
        if i>l  % if number of iteration "d" more by one than l
            d(i)=V(i)- V(i-l);
        end
        if i==l+k % if number of iteration"d" equal l+k
            d(i)=V(i)- V(i-l)- V(i-k);
        end
    end
%------------------------------------------------------------------------------------------ 

%----------------------------------------- when number of iteration "d" is more by one than l+k
    if i>1 && i>(l+k)
        d(i)=V(i)- V(i-l)- V(i-k)+ V(i-l-k);
    end
%------------------------------------------------------------------------------------------

%----------------------------------------- final  tracing of function
    if i ~= 1
       p(i)=p(i-1)+d(i);
       s(i)=s(i-1)+p(i)+M*d(i);
    end     
%------------------------------------------------------------------------------------------
end    
            
                