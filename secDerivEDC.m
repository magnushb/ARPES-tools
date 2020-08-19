%%% Function for calculating second derivative along energy direction of
%%% ARPES data. Smoothing is an option, both before calculating 2nd derivative and after.
%%% If smoot_elements_XX is set to zero, no smoothing is done.
%%% Assumes first index in matrix is energy direction.

function ddmat = secDerivEDC(mat,smooth_elements_before,smooth_elements_between,smooth_elements_after)

s=size(mat);

% smooth before
if smooth_elements_before == 0
else
    for r=1:s(2)
        mat(:,r)=smooth(mat(:,r),smooth_elements_before);
    end
end

% calulate second derivative
for r=1:s(2)
    dmat(:,r)=diff(mat(:,r));
    % smooth between
    if smooth_elements_between == 0
    else
       dmat(:,r)=smooth(dmat(:,r),smooth_elements_between);
    end
    ddmat(:,r)=diff(dmat(:,r));
end


if smooth_elements_after == 0
else
    for r=1:s(2)
        ddmat(:,r)=smooth(ddmat(:,r),smooth_elements_after);
    end
end