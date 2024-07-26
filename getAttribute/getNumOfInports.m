function numOfInports = getNumOfInports(currBlkHndl)

numOfInports = 0;

if ~isempty(currBlkHndl)
    numOfInports = length(get_param(currBlkHndl,'PortHandles').Inport);
end

end