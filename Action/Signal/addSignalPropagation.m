function addSignalPropagation()
    hndls = getSelectedLineHandles();
    for ind = 1:numel(hndls)
        try
            set(hndls(ind), 'SignalPropagation', 'off');
            set(hndls(ind), 'SignalPropagation', 'on');
        catch
            
        end
    end
end