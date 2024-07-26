function dstBlkHndls = getDstBlockHandles(currBlkHndl)

dstBlkHndls = [];

currBlockInPortHndls = get_param(currBlkHndl,'PortHandles').Outport;
    if ~isempty(currBlockInPortHndls)

        for ind = 1:numel(currBlockInPortHndls)
    
            currPortLineHndl = get_param(currBlockInPortHndls(ind),'Line');
            if ~isempty(currPortLineHndl) && currPortLineHndl >= 0
    
                dstBlockHndl = get_param(currPortLineHndl, 'DstBlockHandle');

                if length(dstBlockHndl) > 1
                    tmp_dstBlockHndls = dstBlockHndl;
                    dstBlockHndl = [];
                    for indHndls = 1:numel(tmp_dstBlockHndls)
                        tmp = tmp_dstBlockHndls(indHndls);
                        tmp_type = get_param(tmp,'BlockType')
                        if strcmp(tmp_type, 'Outport')
                            dstBlockHndl = tmp;
                            break
                        end
                    end
                end

                dstBlkHndls = [dstBlkHndls dstBlockHndl];

            end

        end

    end

end