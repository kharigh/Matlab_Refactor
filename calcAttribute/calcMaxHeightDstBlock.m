function [maxHeightDstBlockHndl, maxHeightDstBlockVal] = calcMaxHeightDstBlock(currBlkHndl)

currBlockInPortHndls = get_param(currBlkHndl,'PortHandles').Outport;
maxHeightDstBlockVal = 0;
maxHeightDstBlockHndl = [];

if ~isempty(currBlockInPortHndls)

    for ind = 1:numel(currBlockInPortHndls)

        currPortLineHndl = get_param(currBlockInPortHndls(ind),'Line');
        if ~isempty(currPortLineHndl) && currPortLineHndl >= 0

            dstBlockHndl = get_param(currPortLineHndl, 'DstBlockHandle');

            % TODO: Not handled for multiple destination block
            if length(dstBlockHndl) > 1
                continue
            end

            dstBlockPos = num2cell(get_param(dstBlockHndl,'Position'));
            [~, src_Y, ~, src_Height] = deal(dstBlockPos{:});
            srcBlockHeight = src_Height - src_Y;
    
            if srcBlockHeight > maxHeightDstBlockVal
                
                maxHeightDstBlockVal = srcBlockHeight;
                maxHeightDstBlockHndl = dstBlockHndl;
    
            end
            
        end

    end

end

end