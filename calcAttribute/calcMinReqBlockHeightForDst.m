function minHeight = calcMinReqBlockHeightForDst(currBlkHndl, dstBlkHndl)

minHeight = 0;
currBlockPos = num2cell(get_param(currBlkHndl,'Position'));
[~, curr_Y, ~, curr_Height] = deal(currBlockPos{:});
HeightCurrBlockVal = curr_Height - curr_Y;
numOfOutports = getNumOfOutports(currBlkHndl);

if numOfOutports > 0

    heightPerPort = HeightCurrBlockVal / numOfOutports;
    numOfDstInports = getNumOfInports(dstBlkHndl);

    if numOfDstInports>1

        minHeight = ((heightPerPort)*numOfDstInports);

    end

end

end