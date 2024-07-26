function resizeCurrForSrcBlk(currBlkHndl)

currBlkHndls = getSelectedBlockHandles();
for ind_main=1:length(currBlkHndls)
    currBlkHndl = currBlkHndls(ind_main);

    minHeight = calcMinReqBlockHeightForCurrBySrc(currBlkHndl);
    
    currBlockPos = num2cell(get_param(currBlkHndl,'Position'));
    [curr_X, curr_Y, curr_Width, curr_Height] = deal(currBlockPos{:});
    currHeight = curr_Height - curr_Y;
    
    
    numOfInBlocks = getNumOfInBlocks(currBlkHndl);
    allSepBlks = length(getSrcBlockHandles(currBlkHndl)) == numOfInBlocks;
    if numOfInBlocks > 1 && allSepBlks
        minHeight = minHeight + (20*numOfInBlocks);
    end
    
    if currHeight < minHeight
    
        set_param(currBlkHndl,'Position', [curr_X, curr_Y, curr_Width, curr_Y+minHeight]);
    
    elseif currHeight > minHeight
    
        srcBlkHndls = getSrcBlockHandles(currBlkHndl);
        for ind = 1:numel(srcBlkHndls)
            srcBlockPos = num2cell(get_param(srcBlkHndls(ind),'Position'));
            [src_X, src_Y, src_Width, src_Height] = deal(srcBlockPos{:});
        
            minHeight = calcMinReqBlockHeightForSrc(currBlkHndl, srcBlkHndls(ind));
            if (src_Height - src_Y) < minHeight
                set_param(srcBlkHndls(ind),'Position', [src_X, src_Y, src_Width, src_Y+minHeight]);
            end
        end
    
    
    end
end

end