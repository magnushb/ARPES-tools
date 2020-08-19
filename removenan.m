%%% Functinn for setting NaNs in matrix to desired value

function mat=removenan(mat,val)

s=size(mat);
te=isnan(mat);

if numel(s)==3
   for a=1:s(1)
       for b=1:s(2)
           for c=1:s(3)
               if te(a,b,c)==1
               mat(a,b,c)=val;
               else
               end
           end
       end
   end
elseif numel(s)==2
    for a=1:s(1)
       for b=1:s(2)
         if te(a,b)==1
            mat(a,b)=val;
         else
         end
       end
    end
else
end