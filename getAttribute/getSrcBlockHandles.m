function srcBlkHndls = getSrcBlockHandles(currBlkHndl)

srcBlkHndls = [];

currBlockInPortHndls = get_param(currBlkHndl,'PortHandles').Inport;
    if ~isempty(currBlockInPortHndls)

        for ind = 1:numel(currBlockInPortHndls)
    
            currPortLineHndl = get_param(currBlockInPortHndls(ind),'Line');
            if ~isempty(currPortLineHndl) && currPortLineHndl >= 0
    
                srcBlockHndl = get_param(currPortLineHndl, 'SrcBlockHandle');
                srcBlkHndls = [srcBlkHndls srcBlockHndl];

            end

        end

    end

end