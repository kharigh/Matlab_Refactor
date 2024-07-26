function numOfOutports = getNumOfOutports(currBlkHndl)

numOfOutports = 0;

if ~isempty(currBlkHndl)
    numOfOutports = length(get_param(currBlkHndl,'PortHandles').Outport);
end

end