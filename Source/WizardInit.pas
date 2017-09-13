unit WizardInit;

interface

uses
  ToolsAPI;

function InitWizard(const BorlandIDEServices: IBorlandIDEServices;
    RegisterProc: TWizardRegisterProc;
    var Terminate: TWizardTerminateProc): Boolean; stdcall;

implementation

uses
  WizardImpl;

function InitWizard(const BorlandIDEServices: IBorlandIDEServices;
    RegisterProc: TWizardRegisterProc;
    var Terminate: TWizardTerminateProc): Boolean; stdcall;
var  WizardServices: IOTAWizardServices;
begin
  if ToolsApi.BorlandIDEServices = nil then
     ToolsApi.BorlandIDEServices := BorlandIDEServices;

  Result := RegisterProc(TSimpleMenuExpert.Create);
end;

end.
