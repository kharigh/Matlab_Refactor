function removeSignalPropagation()
    hndls = getSelectedLineHandles();
    for ind = 1:numel(hndls)
        try
            set(hndls(ind), 'SignalPropagation', 'off');
        catch
            
        end
    end
end