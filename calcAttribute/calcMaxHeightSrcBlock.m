function [maxHeightSrcBlockHndl, maxHeightSrcBlockVal] = calcMaxHeightSrcBlock(currBlkHndl)

currBlockInPortHndls = get_param(currBlkHndl,'PortHandles').Inport;
maxHeightSrcBlockVal = 0;
maxHeightSrcBlockHndl = [];

if ~isempty(currBlockInPortHndls)

    for ind = 1:numel(currBlockInPortHndls)

        currPortLineHndl = get_param(currBlockInPortHndls(ind),'Line');
        if ~isempty(currPortLineHndl) && currPortLineHndl >= 0

            srcBlockHndl = get_param(currPortLineHndl, 'SrcBlockHandle');
            srcBlockPos = num2cell(get_param(srcBlockHndl,'Position'));
            [~, src_Y, ~, src_Height] = deal(srcBlockPos{:});
            srcBlockHeight = src_Height - src_Y;
    
            if srcBlockHeight > maxHeightSrcBlockVal
                
                maxHeightSrcBlockVal = srcBlockHeight;
                maxHeightSrcBlockHndl = srcBlockHndl;
    
            end
            
        end

    end

end

end