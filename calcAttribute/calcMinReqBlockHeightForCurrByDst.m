function minHeight = calcMinReqBlockHeightForCurrByDst(currBlkHndl)

minHeight = 0;
[maxHeightDstBlockHndl, maxHeightDstBlockVal] = calcMaxHeightDstBlock(currBlkHndl);
%numOfCon = getNumOfOutportConnections(currBlkHndl, maxHeightDstBlockHndl);
numOfCon = getNumOfInports(maxHeightDstBlockHndl);

if numOfCon > 0

    heightPerPort = maxHeightDstBlockVal / numOfCon;
    numOfOutports = getNumOfOutports(currBlkHndl);

    if numOfOutports>1

        minHeight = ((heightPerPort)*numOfOutports);

    end

end

end