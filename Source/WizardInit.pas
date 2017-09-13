unit WizardInit;

interface

uses
  ToolsAPI;

function InitWizard(const BorlandIDEServices: IBorlandIDEServices;
    RegisterProc: TWizardRegisterProc;
    var Terminate: TWizardTerminateProc): Boolean; stdcall;

implementation

uses
  WizardImpl, Forms, SysUtils;

function InitWizard(const BorlandIDEServices: IBorlandIDEServices;
    RegisterProc: TWizardRegisterProc;
    var Terminate: TWizardTerminateProc): Boolean; stdcall;
var
  Services: IOTAServices;
begin
  if ToolsApi.BorlandIDEServices = nil then
     ToolsApi.BorlandIDEServices := BorlandIDEServices;

  if Supports(BorlandIDEServices, IOTAServices, Services) then
    Application.Handle := Services.GetParentHandle;

  Result := RegisterProc(TSimpleMenuExpert.Create);
end;

end.
