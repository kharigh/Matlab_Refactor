function minHeight = calcMinReqBlockHeightForSrc(currBlkHndl, srcBlkHndl)

minHeight = 0;
currBlockPos = num2cell(get_param(currBlkHndl,'Position'));
[~, curr_Y, ~, curr_Height] = deal(currBlockPos{:});
HeightCurrBlockVal = curr_Height - curr_Y;
numOfInports = getNumOfInports(currBlkHndl);

if numOfInports > 0

    heightPerPort = HeightCurrBlockVal / numOfInports;
    numOfSrcOutports = getNumOfOutports(srcBlkHndl);

    if numOfSrcOutports>1

        minHeight = ((heightPerPort)*numOfSrcOutports);

    end

end

end