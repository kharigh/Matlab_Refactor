function resolveSignalObject()
hndls = getSelectedLineHandles();
for ind = 1:numel(hndls)
    if ~isempty(get_param(hndls(ind), 'name'))
        set(hndls(ind), 'MustResolveToSignalObject', 1);
    end
end
end