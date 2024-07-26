function removeDesc()
    blks = find_system(bdroot,'FindAll','On', 'BlockType','Constant');
    for ind = 1:length(blks)
        blk = blks(ind);
        set_param(blk,'AttributesFormatString','')
    end

    outports = find_system(bdroot,'FindAll','On', 'BlockType','Outport');
    for ind=1:length(outports)
        outport = outports(ind);
        set_param(outport,'AttributesFormatString','')
    end
end