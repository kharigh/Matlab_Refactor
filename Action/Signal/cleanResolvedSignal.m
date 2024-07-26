function cleanResolvedSignal()
    lines = find_system(bdroot, 'FindAll', 'on', 'type', 'line');
    for ind=1:length(lines)
        line = lines(ind);
        if get(line,'MustResolveToSignalObject')
            set(line, 'MustResolveToSignalObject', 0);
            set(line, 'MustResolveToSignalObject', 1);
        end
    end
end