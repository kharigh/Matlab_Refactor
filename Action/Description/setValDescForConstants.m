function setValDescForConstants()
    blks = find_system(bdroot,'FindAll','On', 'BlockType','Constant');
    for ind = 1:length(blks)
        try
            blk = blks(ind);
            blk_var = get_param(blk,'Value');
            if isnan(str2double(blk_var))
                set_param(blk,'AttributesFormatString',strcat("Value = ",getValFromVar(blk_var)))
            end
        catch
            warning([get_param(blk,'name') ' in ' get_param(blk,'parent') ' has error'])
        end
    end
end