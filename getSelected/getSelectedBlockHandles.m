function [blockHndls] = getSelectedBlockHandles()

slectedHndls = [];

if isempty(bdroot)
    blockHndls = [];

else
    hndls = find_system(gcs,'FindAll', 'on', 'SearchDepth',1, 'type', 'block', 'selected', 'on');

    if isempty(hndls)
        blockHndls = [];
    else

        for ind = 1:numel(hndls)

            if hndls(ind) ~= get_param(gcs,'handle')
                slectedHndls = [slectedHndls hndls(ind)];
            end
            
        end

        blockHndls = slectedHndls;
    end

end

end