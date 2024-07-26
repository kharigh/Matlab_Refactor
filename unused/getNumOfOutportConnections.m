function numOfCon = getNumOfOutportConnections(currBlkHndl,dstBlkHndl)

currBlockOutPortHndls = get_param(currBlkHndl,'PortHandles').Outport;
numOfCon = 0;

if ~isempty(currBlockOutPortHndls)

    for ind = 1:numel(currBlockOutPortHndls)

        currPortLineHndl = get_param(currBlockOutPortHndls(ind),'Line');
        if currPortLineHndl < 0
            continue
        end
        dstBlockHndl = get_param(currPortLineHndl, 'DstBlockHandle');

        if length(dstBlockHndl) > 1
            continue
        end

        if get_param(dstBlkHndl,'handle') == get_param(dstBlockHndl,'handle')

            numOfCon = numOfCon + 1;

        end
        
    end

end

end