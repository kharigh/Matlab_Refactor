
function removeSubSysPreview()
    blks = find_system(bdroot,'FindAll','On', 'BlockType','SubSystem');
    set(blks,'ContentPreviewEnabled','Off')
end
