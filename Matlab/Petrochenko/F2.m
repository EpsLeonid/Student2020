function s=F2(l, k, A, tau1, tau2, t, M)

% Parameters initialization
d=zeros(1, length(t));
p=zeros(1, length(t));
s=zeros(1, length(t));
%-------------------------

% Auxiliary check m and l (what's more)
if l<=k
   min=l;
   max=k;
else
   min=k;
   max=l;
end
%--------------------------------------    
    
for i=1:length(t)
    
%---------------------- 1st iteration      
    if i==1 
      d(i)=F1(A, t(i), tau1, tau2);
      p(i)=d(i);
      s(i)=p(i)+M*d(i);
    end
%-----------------------------------

%----------------------------------------------- when number of iteration "d" is less than l+k
    if i>1 && i<=(l+k) % if number of iteration "d" less than l and less than k
        if i<=min
           d(i)=F1(A, t(i), tau1, tau2);
        end      
        if i>k && i<=max;  % if number of iteration "d" more by one than k and less than max
            d(i)=F1(A, t(i), tau1, tau2)- F1(A, t(i-k), tau1, tau2);
        end
        if i>l && i<=max; % if number of iteration "d" more by one than l and less than max
            d(i)=F1(A, t(i), tau1, tau2)- F1(A, t(i-l), tau1, tau2);
        end
        if i>k && i>l % if number of iteration"d"  more than l and k at least by one
            d(i)=F1(A, t(i), tau1, tau2)- F1(A, t(i-l), tau1, tau2)- F1(A, t(i-k), tau1, tau2);
        end
    end
%------------------------------------------------------------------------------------------ 

%----------------------------------------- when number of iteration "d" is more by one than l+k
    if i>1 && i>(l+k)
        d(i)=(F1(A, t(i), tau1, tau2)- F1(A, t(i-l), tau1, tau2)- F1(A, t(i-k), tau1, tau2)+ F1(A, t(i-l-k), tau1, tau2));
    end
%------------------------------------------------------------------------------------------

%----------------------------------------- final  tracing of function
    if i ~= 1
       p(i)=p(i-1)+d(i);
       s(i)=s(i-1)+p(i)+M*d(i);
    end     
%------------------------------------------------------------------------------------------
end    
            
                