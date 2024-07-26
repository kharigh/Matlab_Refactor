function cleanSignalPropagation()
    lines = find_system(bdroot, 'FindAll', 'on', 'type', 'line');
    for ind=1:length(lines)
        line = lines(ind);
        if get(line,'ShowPropagatedSignals')
            set(line, 'SignalPropagation', 'off');
            set(line, 'SignalPropagation', 'on');
        end
    end
end