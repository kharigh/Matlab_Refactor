classdef replaceBlockNamesAndValsV2 < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        FindandReplaceUIFigure        matlab.ui.Figure
        SignalButton                  matlab.ui.control.StateButton
        ValueButton                   matlab.ui.control.StateButton
        ReplaceTypeLabel              matlab.ui.control.Label
        NameButton                    matlab.ui.control.StateButton
        ConditionEditField            matlab.ui.control.EditField
        ConditionEditFieldLabel       matlab.ui.control.Label
        LayerdepthEditField           matlab.ui.control.NumericEditField
        LayerdepthEditFieldLabel      matlab.ui.control.Label
        ReplaceoptionDropDown         matlab.ui.control.DropDown
        ReplaceoptionDropDown_2Label  matlab.ui.control.Label
        RegexCheckBox                 matlab.ui.control.CheckBox
        ReplaceEditField              matlab.ui.control.EditField
        ReplaceEditFieldLabel         matlab.ui.control.Label
        FindEditField                 matlab.ui.control.EditField
        FindEditFieldLabel            matlab.ui.control.Label
        ReplaceButton                 matlab.ui.control.Button
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: ReplaceButton
        function replaceBtnCallback(app, event)
            
            regexSwitch = app.RegexCheckBox.Value;
            findStr = app.FindEditField.Value;
            replaceStr = app.ReplaceEditField.Value;
            replaceOpt = app.ReplaceoptionDropDown.Value;
            replaceTypeName = app.NameButton.Value;
            replaceTypeValue = app.ValueButton.Value;
            replaceTypeSignal = app.SignalButton.Value;
            numOfLayers = app.LayerdepthEditField.Value;
            CndnStr = app.ConditionEditField.Value;

            replaceBlkVal(regexSwitch,findStr,replaceStr,CndnStr,replaceOpt,replaceTypeName,replaceTypeValue,replaceTypeSignal,numOfLayers);

        end

        % Value changed function: ReplaceoptionDropDown
        function replaceOptChanged(app, event)
            value = app.ReplaceoptionDropDown.Value;
            if strcmp(value,'Specify depth...')
                app.LayerdepthEditField.Enable = "on";
            else
                app.LayerdepthEditField.Enable = "off";
            end
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create FindandReplaceUIFigure and hide until all components are created
            app.FindandReplaceUIFigure = uifigure('Visible', 'off');
            app.FindandReplaceUIFigure.Position = [100 100 427 285];
            app.FindandReplaceUIFigure.Name = 'Find and Replace';

            % Create ReplaceButton
            app.ReplaceButton = uibutton(app.FindandReplaceUIFigure, 'push');
            app.ReplaceButton.ButtonPushedFcn = createCallbackFcn(app, @replaceBtnCallback, true);
            app.ReplaceButton.Position = [304 19 100 23];
            app.ReplaceButton.Text = 'Replace';

            % Create FindEditFieldLabel
            app.FindEditFieldLabel = uilabel(app.FindandReplaceUIFigure);
            app.FindEditFieldLabel.HorizontalAlignment = 'right';
            app.FindEditFieldLabel.Position = [22 240 29 22];
            app.FindEditFieldLabel.Text = 'Find';

            % Create FindEditField
            app.FindEditField = uieditfield(app.FindandReplaceUIFigure, 'text');
            app.FindEditField.Position = [87 240 317 22];

            % Create ReplaceEditFieldLabel
            app.ReplaceEditFieldLabel = uilabel(app.FindandReplaceUIFigure);
            app.ReplaceEditFieldLabel.HorizontalAlignment = 'right';
            app.ReplaceEditFieldLabel.Position = [22 208 50 22];
            app.ReplaceEditFieldLabel.Text = 'Replace';

            % Create ReplaceEditField
            app.ReplaceEditField = uieditfield(app.FindandReplaceUIFigure, 'text');
            app.ReplaceEditField.Position = [87 208 317 22];

            % Create RegexCheckBox
            app.RegexCheckBox = uicheckbox(app.FindandReplaceUIFigure);
            app.RegexCheckBox.Text = 'Regex';
            app.RegexCheckBox.Position = [23 168 57 22];

            % Create ReplaceoptionDropDown_2Label
            app.ReplaceoptionDropDown_2Label = uilabel(app.FindandReplaceUIFigure);
            app.ReplaceoptionDropDown_2Label.HorizontalAlignment = 'right';
            app.ReplaceoptionDropDown_2Label.Position = [24 57 86 22];
            app.ReplaceoptionDropDown_2Label.Text = 'Replace option';

            % Create ReplaceoptionDropDown
            app.ReplaceoptionDropDown = uidropdown(app.FindandReplaceUIFigure);
            app.ReplaceoptionDropDown.Items = {'Selected', 'Current Layer', 'Current & Lower Layers', 'Whole model', 'Specify depth...'};
            app.ReplaceoptionDropDown.ValueChangedFcn = createCallbackFcn(app, @replaceOptChanged, true);
            app.ReplaceoptionDropDown.Position = [125 57 281 22];
            app.ReplaceoptionDropDown.Value = 'Selected';

            % Create LayerdepthEditFieldLabel
            app.LayerdepthEditFieldLabel = uilabel(app.FindandReplaceUIFigure);
            app.LayerdepthEditFieldLabel.HorizontalAlignment = 'right';
            app.LayerdepthEditFieldLabel.Enable = 'off';
            app.LayerdepthEditFieldLabel.Position = [24 19 69 22];
            app.LayerdepthEditFieldLabel.Text = 'Layer depth';

            % Create LayerdepthEditField
            app.LayerdepthEditField = uieditfield(app.FindandReplaceUIFigure, 'numeric');
            app.LayerdepthEditField.Limits = [0 Inf];
            app.LayerdepthEditField.Enable = 'off';
            app.LayerdepthEditField.Position = [108 19 45 22];

            % Create ConditionEditFieldLabel
            app.ConditionEditFieldLabel = uilabel(app.FindandReplaceUIFigure);
            app.ConditionEditFieldLabel.HorizontalAlignment = 'right';
            app.ConditionEditFieldLabel.Position = [122 168 56 22];
            app.ConditionEditFieldLabel.Text = 'Condition';

            % Create ConditionEditField
            app.ConditionEditField = uieditfield(app.FindandReplaceUIFigure, 'text');
            app.ConditionEditField.Position = [193 168 211 22];

            % Create NameButton
            app.NameButton = uibutton(app.FindandReplaceUIFigure, 'state');
            app.NameButton.Text = 'Name';
            app.NameButton.Position = [26 103 100 23];
            app.NameButton.Value = true;

            % Create ReplaceTypeLabel
            app.ReplaceTypeLabel = uilabel(app.FindandReplaceUIFigure);
            app.ReplaceTypeLabel.Position = [23 132 79 22];
            app.ReplaceTypeLabel.Text = 'Replace Type';

            % Create ValueButton
            app.ValueButton = uibutton(app.FindandReplaceUIFigure, 'state');
            app.ValueButton.Text = 'Value';
            app.ValueButton.Position = [160 103 100 23];

            % Create SignalButton
            app.SignalButton = uibutton(app.FindandReplaceUIFigure, 'state');
            app.SignalButton.Text = 'Signal';
            app.SignalButton.Position = [294 103 100 23];

            % Show the figure after all components are created
            app.FindandReplaceUIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = replaceBlockNamesAndValsV2

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.FindandReplaceUIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.FindandReplaceUIFigure)
        end
    end
end