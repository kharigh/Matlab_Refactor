function numOfInBlocks = getNumOfInBlocks(currBlkHndl)
    numOfInBlocks = length(unique(getSrcBlockHandles(currBlkHndl)));
end

