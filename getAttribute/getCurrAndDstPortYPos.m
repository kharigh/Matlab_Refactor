function [currPortsYPos, dstPortsYPos, dstBlockHndls, lineHndls] = getCurrAndDstPortYPos(currBlkHndl)

currBlockInPortHndls = get_param(currBlkHndl,'PortHandles').Outport;
dstPortsYPos = [];
currPortsYPos = [];
dstBlockHndls = [];
lineHndls = [];
if ~isempty(currBlockInPortHndls)
    for ind = 1:numel(currBlockInPortHndls)
        currPortPos = get_param(currBlockInPortHndls(ind),'Position');   
        currPortLineHndl = get_param(currBlockInPortHndls(ind),'Line');
        if currPortLineHndl < 0
            continue
        end
        dstBlockInPortHndl = get_param(currPortLineHndl, 'DstPortHandle');
        dstPortPos = get_param(dstBlockInPortHndl,'Position');

        dstBlockHndl = get_param(currPortLineHndl, 'DstBlockHandle');

        if length(dstBlockHndl) > 1
            tmp_dstBlockHndls = dstBlockHndl;
            dstBlockHndl = [];
            for indHndls = 1:numel(tmp_dstBlockHndls)
                tmp = tmp_dstBlockHndls(indHndls);
                tmp_type = get_param(tmp,'BlockType')
                if strcmp(tmp_type, 'Outport')
                    dstBlockHndl = tmp;
                    dstPortPos = get_param(get_param(dstBlockHndl,'PortHandles').Inport,'Position');
                    break
                end
            end
        end
        
        dstBlockHndls = [dstBlockHndls dstBlockHndl];
        currPortsYPos = [currPortsYPos currPortPos(2)];
        dstPortsYPos = [dstPortsYPos dstPortPos(2)];
        lineHndls = [lineHndls currPortLineHndl];
    end
end

end