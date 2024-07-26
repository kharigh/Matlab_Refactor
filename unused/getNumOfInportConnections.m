function numOfCon = getNumOfInportConnections(currBlkHndl,srcBlkHndl)

currBlockInPortHndls = get_param(currBlkHndl,'PortHandles').Inport;
numOfCon = 0;

if ~isempty(currBlockInPortHndls)

    for ind = 1:numel(currBlockInPortHndls)

        currPortLineHndl = get_param(currBlockInPortHndls(ind),'Line');
        if currPortLineHndl < 0
            continue
        end
        srcBlockHndl = get_param(currPortLineHndl, 'SrcBlockHandle');

        if get_param(srcBlkHndl,'handle') == get_param(srcBlockHndl,'handle')

            numOfCon = numOfCon + 1;

        end
        
    end

end

end