function [data] = deleteRegions( data, list_c )
% deleteRegions : deletes regions in list_c from mask in data. 
%
% INPUT :
%       data: region (cell) data structure (seg/err) file
%       list:  regions labels to be deleted
% OUTPUT :
%       data : updated region (cell) data structure
%
% Copyright (C) 2016 Wiggins Lab
% University of Washington, 2016
% This file is part of SuperSeggerOpti.

try
    for uu = 1:numel(list_c)   
        mm = list_c(uu);
        [xx,yy] = getBB( data.regs.props(mm).BoundingBox);
        tmp = (data.regs.regs_label(yy,xx) == mm);
        data.regs.regs_label(yy,xx) = data.regs.regs_label(yy,xx)-mm*tmp;
    end
catch ME
   printError(ME);
end
data.mask_cell = (data.regs.regs_label > 0);

end