function s=test2(l, k, t, M, y)

%dimension
for n=1:length(t)  
    
%checking conditions    
if n==1                 %state 1      
      d(n)=y(n);
      p(n)=d(n);
      s(n)=p(n)+M*d(n);
end

if n>1 && n<=(l+k)      %state 2
       
   if n<=k
      d(n)=y(n);
   end
   
   if n>k 
      d(n)=y(n)-y(n-k);
   end
   
   if n>l 
      d(n)=y(n)-y(n-l);
   end
   
   if n==l+k 
      d(n)=y(n)-y(n-l)-y(n-k);
   end
   
end


if n>1 && n>(l+k)       %state 3
   d(n)=y(n)-y(n-l)-y(n-k)+y(n-l-k);
end

if n ~= 1               %state 4      
   p(n)=p(n-1)+d(n);
   s(n)=s(n-1)+p(n)+M*d(n);
end     
end    