function alignSrcBlk()

currBlkHndls = getSelectedBlockHandles();
for ind_main=1:length(currBlkHndls)
    currBlkHndl = currBlkHndls(ind_main);

    [currPortsYPos, srcPortsYPos, srcBlockHndls, lineHndls] = getCurrAndSrcPortYPos(currBlkHndl);
    
    if ~isempty(currPortsYPos) && ~isempty(srcPortsYPos) && ...
            ~isempty(srcBlockHndls) && ~isempty(lineHndls) && ...
            numel(currPortsYPos) == numel(srcPortsYPos) && ...
            numel(currPortsYPos) == numel(srcBlockHndls)
    
        prcdSrcBlockHndls = zeros(size(srcBlockHndls));
        
        for ind = 1:numel(srcBlockHndls)
    
            if any(prcdSrcBlockHndls(:) == srcBlockHndls(ind))
    
                % Dont change position of block that is already changed. Eg:
                % blocks having multiple connections
                    continue
    
            end
    
            srcBlockPos = num2cell(get_param(srcBlockHndls(ind),'Position'));
            [src_X, src_Y, src_Width, src_Height] = deal(srcBlockPos{:});
            delY = currPortsYPos(ind) - srcPortsYPos(ind);
            set_param(srcBlockHndls(ind),'Position', [src_X, src_Y+delY, src_Width, src_Height+delY]);
            prcdSrcBlockHndls(ind) = srcBlockHndls(ind);
    
        end
    
        Simulink.BlockDiagram.routeLine(lineHndls);
    
    end
end
end