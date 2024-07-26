function [currPortsYPos, srcPortsYPos, srcBlockHndls, lineHndls] = getCurrAndSrcPortYPos(currBlkHndl)
currBlockInPortHndls = get_param(currBlkHndl,'PortHandles').Inport;
srcPortsYPos = [];
currPortsYPos = [];
srcBlockHndls = [];
lineHndls = [];
if ~isempty(currBlockInPortHndls)
    for ind = 1:numel(currBlockInPortHndls)
        currPortPos = get_param(currBlockInPortHndls(ind),'Position');   
        currPortLineHndl = get_param(currBlockInPortHndls(ind),'Line');
        if currPortLineHndl < 0
            continue
        end
        srcBlockInPortHndl = get_param(currPortLineHndl, 'SrcPortHandle');
        srcPortPos = get_param(srcBlockInPortHndl,'Position');
        
        srcBlockHndls = [srcBlockHndls get_param(currPortLineHndl, 'SrcBlockHandle')];
        currPortsYPos = [currPortsYPos currPortPos(2)];
        srcPortsYPos = [srcPortsYPos srcPortPos(2)];
        lineHndls = [lineHndls currPortLineHndl];
    end
end
end
