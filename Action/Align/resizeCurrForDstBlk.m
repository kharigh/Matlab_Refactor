function resizeCurrForDstBlk()

currBlkHndls = getSelectedBlockHandles();
for ind_main=1:length(currBlkHndls)
    currBlkHndl = currBlkHndls(ind_main);

    minHeight = calcMinReqBlockHeightForCurrByDst(currBlkHndl);
    
    currBlockPos = num2cell(get_param(currBlkHndl,'Position'));
    [curr_X, curr_Y, curr_Width, curr_Height] = deal(currBlockPos{:});
    currHeight = curr_Height - curr_Y;
    
    
    numOfOutBlocks = getNumOfOutBlocks(currBlkHndl);
    allSepBlks = length(getDstBlockHandles(currBlkHndl)) == numOfOutBlocks;
    if numOfOutBlocks > 1 && allSepBlks
        minHeight = minHeight + (20*numOfOutBlocks);
    end
    
    if currHeight < minHeight
        
        set_param(currBlkHndl,'Position', [curr_X, curr_Y, curr_Width, curr_Y+minHeight]);
    
    elseif currHeight > minHeight
        dstBlkHndls = getDstBlockHandles(currBlkHndl);
        for ind = 1:numel(dstBlkHndls)
            srcBlockPos = num2cell(get_param(dstBlkHndls(ind),'Position'));
            [src_X, src_Y, src_Width, src_Height] = deal(srcBlockPos{:});
        
            minHeight = calcMinReqBlockHeightForDst(currBlkHndl, dstBlkHndls(ind));
    
            if (src_Height - src_Y) < minHeight
                set_param(dstBlkHndls(ind),'Position', [src_X, src_Y, src_Width, src_Y+minHeight]);
            end
        end
    
    
    end
end

end