function triggeredSubs = getEnabledSubSystems(sys)
% Generate a cell list of all blocks in the current Simulink model
blockList = find_system(sys,'Type','block');

% Generate a list of the block types
blockTypes = get_param(blockList,'BlockType');

% Find all blocks with trigger ports (enabled subsystems)
indexTrigger = find(strcmp(blockTypes,'EnablePort'));

triggeredSubs = {};
% Interate through all found triggers and determine "parent" subsystem
for i = 1:numel(indexTrigger)
    triggeredSubs{i} = get_param(blockList{indexTrigger(i)},'Parent');
end