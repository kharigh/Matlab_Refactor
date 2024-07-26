function alignWireBetweenBlocks()
% Align line between single source blocks to multiple destination block
% Current selection shall be all source block

srcBlkHndls = getSelectedBlockHandles();
srcBlkOutLineHndls = [];
for ind=1:length(srcBlkHndls)
    srcBlkHndl = srcBlkHndls(ind);
    srcBlkLineHndls = get_param(srcBlkHndl,'LineHandles');
    srcBlkOutLineHndls = [srcBlkOutLineHndls srcBlkLineHndls.Outport];
end

for ind = 1:length(srcBlkOutLineHndls)
    srcBlkOutLineHndl = srcBlkOutLineHndls(ind);
    srcPortHndl = get_param(srcBlkOutLineHndl,'SrcPortHandle');
    dstPortHndls = get_param(srcBlkOutLineHndl, 'DstPortHandle');
    if length(dstPortHndls) == 1
        continue
    end
    dist = [];
    for ind1 = 1:length(dstPortHndls)
        dstPortHndl = dstPortHndls(ind1);
        diff_coor = get(dstPortHndl,'Position') - get(srcPortHndl,'Position');
        dist = [dist sqrt(diff_coor(1)^2 + diff_coor(2)^2)];
    end
    % Calculate minimum distance
    minDist = round((length(srcBlkOutLineHndls)-ind+0.8)*min(dist)/(length(srcBlkOutLineHndls)+3));
    
    delete_line(srcBlkOutLineHndl);
    srcPortPos = get_param(srcPortHndl, 'Position');
    add_line(gcs,[srcPortPos;srcPortPos+[minDist,0]])
    lowestElbowPoint = 0;

    dstPortPosArr = get_param(dstPortHndls, 'Position');
    Idx = cellfun(@(x)x(2),dstPortPosArr);
    [dummy,order] = sort(Idx);
    dstPortPosArr = dstPortPosArr(order);
    
    for ind1 = 1:length(dstPortPosArr)
        %dstPortHndl = 
        dstPortPos = dstPortPosArr{ind1};
        if srcPortPos(2) == dstPortPos(2)
            add_line(gcs,[srcPortPos+[minDist,lowestElbowPoint];dstPortPos])
        else
            add_line(gcs,[srcPortPos+[minDist,lowestElbowPoint];[srcPortPos(1)+minDist,dstPortPos(2)];dstPortPos])
        end
        lowestElbowPoint = dstPortPos(2)-srcPortPos(2);
    end
end
end
