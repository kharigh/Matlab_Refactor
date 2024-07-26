function minHeight = calcMinReqBlockHeightForCurrBySrc(currBlkHndl)

minHeight = 0;
[maxHeightSrcBlockHndl, maxHeightSrcBlockVal] = calcMaxHeightSrcBlock(currBlkHndl);
%numOfCon = getNumOfInportConnections(currBlkHndl, maxHeightSrcBlockHndl);
numOfCon = getNumOfOutports(maxHeightSrcBlockHndl);

if numOfCon > 0

    heightPerPort = maxHeightSrcBlockVal / numOfCon;
    numOfInports = getNumOfInports(currBlkHndl);

    if numOfInports>1

        minHeight = ((heightPerPort)*numOfInports);

    end

end

end