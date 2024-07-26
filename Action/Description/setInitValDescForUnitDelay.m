function setInitValDescForUnitDelay()
    blks = find_system(bdroot,'FindAll','On', 'BlockType','UnitDelay');
    for ind = 1:length(blks)
        try
            blk = blks(ind);
            blk_var = get_param(blk,'InitialCondition');
            set_param(blk,'AttributesFormatString',strcat("Initial Value = ",getValFromVar(blk_var)," (",string(blk_var),")"))
        catch
            warning([get_param(blk,'name') ' in ' get_param(blk,'parent') ' has error'])
        end
    end
end