function setInitValDescForOutports()
blks = getEnabledSubSystems(bdroot);
blks = [blks getTriggeredSubSystems(bdroot)];
outports = find_system(blks,'FindAll','On', 'SearchDepth',1, 'BlockType','Outport');
for ind=1:length(outports)
    try
        outport = outports(ind);
        outportVar = get_param(outport,'InitialOutput');
        set_param(outport,'AttributesFormatString',strcat("Init Value = ",getValFromVar(outportVar)," (",string(outportVar),")")) 
    catch
        warning([get_param(outport,'name') ' in ' get_param(outport,'parent') ' has error'])
    end
end
end