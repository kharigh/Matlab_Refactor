function alignDstBlk()

% TODO: As of now works only for single destination block

currBlkHndls = getSelectedBlockHandles();
for ind_main=1:length(currBlkHndls)
    currBlkHndl = currBlkHndls(ind_main);
    [currPortsYPos, dstPortsYPos, dstBlockHndls, lineHndls] = getCurrAndDstPortYPos(currBlkHndl);
    
    if ~isempty(currPortsYPos) && ~isempty(dstPortsYPos) && ...
            ~isempty(dstBlockHndls) && ~isempty(lineHndls) && ...
            numel(currPortsYPos) == numel(dstPortsYPos) && ...
            numel(currPortsYPos) == numel(dstBlockHndls)
    
        prcdDstBlockHndls = zeros(size(dstBlockHndls));
    
        for ind = 1:numel(dstBlockHndls)
    
            if any(prcdDstBlockHndls(:) == dstBlockHndls(ind))
    
                % Dont change position of block that is already changed. Eg:
                % blocks having multiple connections
                    continue
    
            end
    
            dstBlockPos = num2cell(get_param(dstBlockHndls(ind),'Position'));
            [dst_X, dst_Y, dst_Width, dst_Height] = deal(dstBlockPos{:});
            delY = currPortsYPos(ind) - dstPortsYPos(ind);
            set_param(dstBlockHndls(ind),'Position', [dst_X, dst_Y+delY, dst_Width, dst_Height+delY]);
            prcdDstBlockHndls(ind) = dstBlockHndls(ind);
    
        end
    
        Simulink.BlockDiagram.routeLine(lineHndls);
    
    end
end
end