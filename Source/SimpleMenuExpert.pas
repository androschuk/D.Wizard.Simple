unit SimpleMenuExpert;

interface

uses
  ToolsAPI;

type
  TSimpleMenuExper = class(TNotifierObject, IOTAMenuWizard, IOTAWizard, IOTANotifier)
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

procedure TSimpleMenuExper.Execute;
begin
  if BorlandIDEServices = Nil then
    ShowMessage('BorlandIDEServices IS NULL');

  ShowMessage(Format('%s running', [GetName]));
end;

function TSimpleMenuExper.GetIDString: string;
begin
  Result := 'FirstExpertDLL';
end;

function TSimpleMenuExper.GetMenuText: string;
begin
  Result := 'SomeText';
end;

function TSimpleMenuExper.GetName: string;
begin
  Result := GetIDString;
end;

function TSimpleMenuExper.GetState: TWizardState;
begin
  Result := [wsEnabled];
end;

end.
