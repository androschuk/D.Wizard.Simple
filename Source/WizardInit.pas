unit WizardInit;

interface

uses
  ToolsAPI;

function InitWizard(const BorlandIDEServices: IBorlandIDEServices;
    RegisterProc: TWizardRegisterProc;
    var Terminate: TWizardTerminateProc): Boolean; stdcall;

procedure DoneWizard;

implementation

uses
  Forms, WizardImpl;

var
  FExpertIndex: integer;
const
  InvalidIndex : integer = -1;

procedure DoneWizard;
var  WizardServices: IOTAWizardServices;
begin
  if FExpertIndex <> InvalidIndex then
  begin
    WizardServices := BorlandIDEServices as IOTAWizardServices;
    WizardServices.RemoveWizard(FExpertIndex);
    FExpertIndex := InvalidIndex;
  end;
end;

function InitWizard(const BorlandIDEServices: IBorlandIDEServices;
    RegisterProc: TWizardRegisterProc;
    var Terminate: TWizardTerminateProc): Boolean; stdcall;
var  WizardServices: IOTAWizardServices;
begin
  if ToolsApi.BorlandIDEServices = nil then
     ToolsApi.BorlandIDEServices := BorlandIDEServices;

  Terminate := DoneWizard;
  WizardServices := BorlandIDEServices as IOTAWizardServices;
  FExpertIndex := WizardServices.AddWizard(TSimpleMenuExpert.Create);

  Result := (FExpertIndex <> InvalidIndex);
end;

end.
