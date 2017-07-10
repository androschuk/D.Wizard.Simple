unit WizardImpl;

interface

uses
  ToolsAPI;

type
  TSimpleMenuExpert = class(TNotifierObject, IOTAMenuWizard, IOTAWizard, IOTANotifier)
    {IOTAMenuWizard}
    function GetMenuText: string;

    {IOTAWizard}
    { Expert UI strings }
    function GetIDString: string;
    function GetName: string;
    function GetState: TWizardState;

    { Launch the AddIn }
    procedure Execute;
  end;

implementation

uses
  SysUtils, Dialogs;

{ TFirstExpertDLL }

procedure TSimpleMenuExpert.Execute;
begin
  if BorlandIDEServices = Nil then
    ShowMessage('BorlandIDEServices IS NULL');

  ShowMessage(Format('%s running', [GetName]));
end;

function TSimpleMenuExpert.GetIDString: string;
begin
  Result := 'SimpleMenuExpert';
end;

function TSimpleMenuExpert.GetMenuText: string;
begin
  Result := 'SimpleMenuExpert';
end;

function TSimpleMenuExpert.GetName: string;
begin
  Result := GetIDString;
end;

function TSimpleMenuExpert.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

end.
