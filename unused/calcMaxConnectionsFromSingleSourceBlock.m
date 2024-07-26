function maxCon = calcMaxConnectionsFromSingleSourceBlock(currBlkHndl)

currBlockInPortHndls = get_param(currBlkHndl,'PortHandles').Inport;
srcBlockHndls = [];
maxCon = 0;

if ~isempty(currBlockInPortHndls)

    for ind = 1:numel(currBlockInPortHndls)

        currPortLineHndl = get_param(currBlockInPortHndls(ind),'Line');
        if ~isempty(currPortLineHndl) && currPortLineHndl >= 0

            srcBlockHndl = get_param(currPortLineHndl, 'SrcBlockHandle');
            srcBlockHndls = [srcBlockHndls srcBlockHndl];
            
        end

    end

    maxCon = length(find(mode(srcBlockHndls)==srcBlockHndls));

end

end