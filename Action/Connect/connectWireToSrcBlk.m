function connectWireToSrcBlk()
    blkHndls = getSelectedBlockHandles();
    lineHndls = getSelectedLineHandles();
    % Sort line handles
    points = [];
    for ind = 1:length(lineHndls)
        point = get_param(lineHndls(ind),'Points');
        points = [points; lineHndls(ind) point(1,2)];
    end
    [~,idx] = sort(points(:,2));
    points = points(idx,:);
    lineHndls = points(:,1);

    srcPorts = unique(strrep(get(lineHndls,'SourcePort'),':','/'),'stable');
    dstPorts = {};

    for ind=1:length(blkHndls)
        blkHndl = blkHndls(ind);
        blkInportHndls = get_param(blkHndl,'PortHandles').Inport;
        blkOpenInportHndls = find_system(blkInportHndls,'Line',-1);
        blkName = get(blkHndl,'name');
        numOfConn = min(length(srcPorts),length(blkOpenInportHndls));
        for ind1 = 1:numOfConn
            blkPortNumber = get_param(blkOpenInportHndls(ind1),'PortNumber');
            dstPorts{ind1} = [blkName '/' char(string(blkPortNumber))];
        end
        add_line(gcs,srcPorts(1:numOfConn),dstPorts,'autorouting','on')

    end

end