function [lineHndls] = getSelectedLineHandles()
if isempty(bdroot)
    lineHndls = [];
else
    hndls = find_system(gcs,'FindAll', 'on', 'SearchDepth',1, 'type','line','selected','on');
    if isempty(hndls)
        lineHndls = [];
    else
        lineHndls = hndls;
    end
end
end