% Pick out non negative elemetns of a vector or matix (1D,2D or 3D)

function mat=nonneg(mat)

s=size(mat);

if length(s)==2

    for r=1:s(1)
        for t=1:s(2)
            if mat(r,t)<0
                mat(r,t)=0;
            else
            end
        end
    end
elseif length(s)==3
    for r=1:s(1)
        for t=1:s(2)
            for u=1:s(3)
                if mat(r,t,u)<0
                    mat(r,t,u)=0;
                else
                end
            end
        end
    end
else
    mat='Check dimensions';
end

    
