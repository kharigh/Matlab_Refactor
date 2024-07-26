function unresolveSignalObject()
hndls = getSelectedLineHandles();
for ind = 1:numel(hndls)
    if ~isempty(get_param(hndls(ind), 'name'))
        set(hndls(ind), 'MustResolveToSignalObject', 0);
    end
end
end