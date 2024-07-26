function replaceBlkVal(regexSwitch,findStr,replaceStr,CndnStr,replaceOpt,replaceTypeName,replaceTypeValue,replaceTypeSignal,numOfLayers)
    blks = [];
    
    if ~isempty(findStr) && ~isempty(replaceStr)
    
        % Parse Replace Option
        
        if strcmp(replaceOpt,'Selected')
            blks = getSelectedBlockHandles();
            lines = getSelectedLineHandles();
        elseif strcmp(replaceOpt,'Current Layer')
            tmp = find_system(gcs,'SearchDepth',1);
            blks = cell2mat(get_param({tmp{2:end}},'handle'));
            lines = find_system(gcs,'FindAll', 'on', 'SearchDepth',1, 'type','line');
        elseif strcmp(replaceOpt,'Current & Lower Layers')
            tmp = find_system(gcs);
            blks = cell2mat(get_param({tmp{2:end}},'handle'));
            lines = find_system(gcs,'FindAll', 'on', 'type','line');
        elseif strcmp(replaceOpt,'Specify depth...')
            tmp = find_system(gcs,'SearchDepth',numOfLayers);
            blks = cell2mat(get_param({tmp{2:end}},'handle'));
            lines = find_system(gcs,'FindAll', 'on', 'SearchDepth',numOfLayers, 'type','line');
        elseif strcmp(replaceOpt,'Whole model')
            tmp = find_system(bdroot);
            blks = cell2mat(get_param({tmp{2:end}},'handle'));
            lines = find_system(bdroot,'FindAll', 'on', 'type','line');
        end

        % Parse Replace type and perform replace
        if replaceTypeName
            for ind = 1:numel(blks)
                if isfield(get_param(blks(ind),'ObjectParameters'),'Name')
                    strVal = get_param(blks(ind),'Name');
                    if ~isempty(regexp(get_param(blks(ind),'Name'),CndnStr, 'once'))
                        if regexSwitch
                            newStrVal = regexprep(strVal,findStr,replaceStr);
                        else
                            newStrVal = replace(strVal,findStr,replaceStr);
                        end
                        if ~strcmp(strVal,newStrVal)
                            set_param(blks(ind),'Name',newStrVal);
                        end
                    elseif strcmp(CndnStr,'')
                        if regexSwitch
                            newStrVal = regexprep(strVal,findStr,replaceStr);
                        else
                            newStrVal = replace(strVal,findStr,replaceStr);
                        end
                        if ~strcmp(strVal,newStrVal)
                            set_param(blks(ind),'Name',newStrVal);
                        end
                    end
                end
            end
        end

        if replaceTypeValue
            for ind = 1:numel(blks)
                if isfield(get_param(blks(ind),'ObjectParameters'),'Value')
                    strVal = get_param(blks(ind),'Value');
                    if ~isempty(regexp(get_param(blks(ind),'Value'),CndnStr, 'once'))
                        if regexSwitch
                            newStrVal = regexprep(strVal,findStr,replaceStr);
                        else
                            newStrVal = replace(strVal,findStr,replaceStr);
                        end
                        if ~strcmp(strVal,newStrVal)
                            set_param(blks(ind),'Value',newStrVal);
                        end
                    elseif strcmp(CndnStr,'')
                        if regexSwitch
                            newStrVal = regexprep(strVal,findStr,replaceStr);
                        else
                            newStrVal = replace(strVal,findStr,replaceStr);
                        end
                        if ~strcmp(strVal,newStrVal)
                            set_param(blks(ind),'Value',newStrVal);
                        end
                    end
                end
            end
        end

        if replaceTypeSignal
            for ind = 1:numel(lines)
                if isfield(get_param(lines(ind),'ObjectParameters'),'Name')
                    strVal = get_param(lines(ind),'Name');
                    if ~isempty(regexp(get_param(lines(ind),'Name'),CndnStr, 'once'))
                        if regexSwitch
                            newStrVal = regexprep(strVal,findStr,replaceStr);
                        else
                            newStrVal = replace(strVal,findStr,replaceStr);
                        end
                        if ~strcmp(strVal,newStrVal)
                            set_param(lines(ind),'Name',newStrVal);
                        end
                    elseif strcmp(CndnStr,'')
                        if regexSwitch
                            newStrVal = regexprep(strVal,findStr,replaceStr);
                        else
                            newStrVal = replace(strVal,findStr,replaceStr);
                        end
                        if ~strcmp(strVal,newStrVal)
                            set_param(lines(ind),'Name',newStrVal);
                        end
                    end
                end
            end
        end
               
    end
end

