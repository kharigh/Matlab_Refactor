% sl_refresh_customizations
function sl_customization(cm)

  %% Register custom menu function.
  %cm.addCustomMenuFcn('Simulink:ContextMenu', @getMyMenuItems);
  cm.addCustomMenuFcn('Simulink:MenuBar', @getMyMenuItems);
end

%% Define the custom menu function.
function schemaFcns = getMyMenuItems(callbackInfo) 
  schemaFcns = {@Refactor};
end

%% Define the schema function for first menu item.
function schema = Refactor(callbackInfo)     
  schema = sl_container_schema;
  schema.label = 'Refactor';     
	schema.childrenFcns = {@Align,...
                            @connect,...
                            @Signal,...
                            @Annotation,...
                            @Replace,...
                            @Description,...
                            @Format};
end 
%% Align
function schema = Align(callbackInfo)     
  schema = sl_container_schema;
  schema.label = 'Align';     
	schema.childrenFcns = {@alignSrcBlkItem,...
                            @alignDstBlkItem,...
                            @alignAllBlkItem,...
                            @resizeAlignSrcBlkItem,...
                            @resizeAlignDstBlkItem,...
                            @resizeAlignAllBlkItem,...
                            @alignWireBtwnBlkItem};
end

function schema = alignSrcBlkItem(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Align source block';
  schema.userdata = 'Align source block';
  schema.accelerator = 'Shift+s';
  schema.callback = @alignSrcBlkCallback; 
end

function alignSrcBlkCallback(callbackInfo)
  alignSrcBlk();
end

function schema = alignDstBlkItem(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Align destn. block';
  schema.userdata = 'Align destn. block';
  schema.accelerator = 'Shift+d';
  schema.callback = @alignDstBlkCallback; 
end

function alignDstBlkCallback(callbackInfo)
  alignDstBlk();
end

function schema = alignAllBlkItem(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Align All block';
  schema.userdata = 'Align All block';
  schema.accelerator = 'Shift+a';
  schema.callback = @alignAllBlkCallback; 
end

function alignAllBlkCallback(callbackInfo)
  alignSrcDstBlk();
end

function schema = resizeAlignSrcBlkItem(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Resize & Align source block';
  schema.userdata = 'Resize & Align source block';
  schema.accelerator = 'Shift+x';
  schema.callback = @resizeAlignSrcBlkCallback; 
end

function resizeAlignSrcBlkCallback(callbackInfo)
  resizeCurrAlignSrcBlk();
end

function schema = resizeAlignDstBlkItem(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Resize & Align destn. block';
  schema.userdata = 'Resize & Align destn. block';
  schema.accelerator = 'Shift+c';
  schema.callback = @resizeAlignDstBlkCallback; 
end

function resizeAlignDstBlkCallback(callbackInfo)
  resizeCurrAlignDstBlk();
end

function schema = resizeAlignAllBlkItem(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Resize & Align All block';
  schema.userdata = 'Resize & Align All block';
  schema.accelerator = 'Shift+z';
  schema.callback = @resizeAlignAllBlkCallback; 
end

function resizeAlignAllBlkCallback(callbackInfo)
  resizeCurrAlignSrcDstBlk();
end

function schema = alignWireBtwnBlkItem(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Align wire between block';
  schema.userdata = 'Align wire between block';
  schema.accelerator = 'Shift+t';
  schema.callback = @alignWireBtwnBlkCallback; 
end

function alignWireBtwnBlkCallback(callbackInfo)
  alignWireBetweenBlocks();
end

%% Connect
function schema = connect(callbackInfo)     
  schema = sl_container_schema;
  schema.label = 'Connect';     
	schema.childrenFcns = {@connectWireToBlkItem};
end

function schema = connectWireToBlkItem(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Connect line to Block';
  schema.userdata = 'Connect line to Block';
  schema.accelerator = 'Shift+y';
  schema.callback = @connectWireToBlkCallback; 
end

function connectWireToBlkCallback(callbackInfo)
  connectWireToSrcBlk();
end

%% Signal
function schema = Signal(callbackInfo)     
  schema = sl_container_schema;
  schema.label = 'Signal';     
	schema.childrenFcns = {@addPropagationItem,...
                            @removePropagationItem,...
                            @resolveSignalItem,...
                            @unresolveSignalItem,...
                            @cleanSignalItem};
end

function schema = addPropagationItem(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Add Propagation';
  schema.userdata = 'Add Propagation';
  schema.accelerator = 'Shift+q';
  schema.callback = @addPropagationCallback; 
end

function addPropagationCallback(callbackInfo)
  addSignalPropagation();
end

function schema = removePropagationItem(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Remove Propagation';
  schema.userdata = 'Remove Propagation';
  schema.accelerator = 'Shift+w';
  schema.callback = @removePropagationCallback; 
end

function removePropagationCallback(callbackInfo)
  removeSignalPropagation();
end

function schema = resolveSignalItem(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Resolve Signal';
  schema.userdata = 'Resolve Signal';
  schema.accelerator = 'Shift+r';
  schema.callback = @resolveSignalCallback; 
end

function resolveSignalCallback(callbackInfo)
  resolveSignalObject();
end

function schema = unresolveSignalItem(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Unresolve Signal';
  schema.userdata = 'Unresolve Signal';
  schema.accelerator = 'Shift+e';
  schema.callback = @unresolveSignalCallback; 
end

function unresolveSignalCallback(callbackInfo)
  unresolveSignalObject();
end

function schema = cleanSignalItem(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Clean Signal';
  schema.userdata = 'Clean Signal';
  schema.callback = @cleanSignalCallback; 
end

function cleanSignalCallback(callbackInfo)
  cleanResolvedSignal();
  cleanSignalPropagation();
end
%% Annotation
function schema = Annotation(callbackInfo)     
  schema = sl_container_schema;
  schema.label = 'Annotation';     
	schema.childrenFcns = {@highlightItem,...
                            @unhighlightItem};
end

function schema = highlightItem(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Highlight';
  schema.userdata = 'Highlight';
  schema.accelerator = 'Shift+h';
  schema.callback = @highlightCallback; 
end

function highlightCallback(callbackInfo)
  highlightSelected();
end

function schema = unhighlightItem(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Unhighlight';
  schema.userdata = 'Unhighlight';
  schema.accelerator = 'Shift+b';
  schema.callback = @unhighlightCallback; 
end

function unhighlightCallback(callbackInfo)
  removeHighlightSelected();
end

%% Replace
function schema = Replace(callbackInfo)     
  schema = sl_container_schema;
  schema.label = 'Replace';     
	schema.childrenFcns = {@replaceItem};
end

function schema = replaceItem(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Replace...';
  schema.userdata = 'Replace...';
  schema.accelerator = 'Shift+l';
  schema.callback = @replaceCallback; 
end

function replaceCallback(callbackInfo)
  replaceBlockNamesAndValsV2;
end

%% Description
function schema = Description(callbackInfo)     
  schema = sl_container_schema;
  schema.label = 'Description';     
	schema.childrenFcns = {@DescriptionOutportItem,...
                            @DescriptionConstantItem,...
                            @DescriptionUnitDelayItem,...
                            @DescriptionRemoveItem};
end

function schema = DescriptionOutportItem(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Add Outport Description';
  schema.userdata = 'Add Outport Description';
  schema.callback = @setInitValDescForOutportsCallback; 
end

function setInitValDescForOutportsCallback(callbackInfo)
  setInitValDescForOutports;
end

function schema = DescriptionConstantItem(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Add Constant Description';
  schema.userdata = 'Add Constant Description';
  schema.callback = @setValDescForConstantsCallback; 
end

function setValDescForConstantsCallback(callbackInfo)
  setValDescForConstants;
end

function schema = DescriptionUnitDelayItem(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Add UnitDelay Description';
  schema.userdata = 'Add UnitDelay Description';
  schema.callback = @setValDescForUnitDelayCallback; 
end

function setValDescForUnitDelayCallback(callbackInfo)
  setInitValDescForUnitDelay;
end

function schema = DescriptionRemoveItem(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Remove Description';
  schema.userdata = 'Remove Description';
  schema.callback = @removeDescCallback; 
end

function removeDescCallback(callbackInfo)
  removeDesc;
end

%% Format
function schema = Format(callbackInfo)     
  schema = sl_container_schema;
  schema.label = 'Format';     
	schema.childrenFcns = {@SubsysPreviewRemoveItem};
end

function schema = SubsysPreviewRemoveItem(callbackInfo)
  schema = sl_action_schema;
  schema.label = 'Remove subsystem preview';
  schema.userdata = 'Remove subsystem preview';
  schema.callback = @removeSubSysPreviewCallback; 
end

function removeSubSysPreviewCallback(callbackInfo)
  removeSubSysPreview;
end