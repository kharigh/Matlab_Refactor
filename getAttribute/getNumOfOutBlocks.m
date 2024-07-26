function numOfOutBlocks = getNumOfOutBlocks(currBlkHndl)
    numOfOutBlocks = length(unique(getDstBlockHandles(currBlkHndl)));
end

