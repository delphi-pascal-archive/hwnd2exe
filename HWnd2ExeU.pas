unit HWnd2ExeU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    edtHWnd: TEdit;
    btnIdentify: TButton;
    lblExe: TLabel;
    procedure btnIdentifyClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$define TOOLHELP}

uses
{$ifdef TOOLHELP}
  TlHelp32;
{$else}
  PsAPI;
{$endif}

{$R *.dfm}

function Wnd2PID(Wnd: THandle): LongWord;
begin
  GetWindowThreadProcessId(Wnd, Result)
end;

{$ifdef TOOLHELP}

function PID2Name(PID: LongWord): String;
var
  SS: THandle;
  PE: TProcessEntry32;
begin
  SS := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, GetCurrentProcessId);
  try
    if Process32First(SS, PE) then
      repeat
        if PE.th32ProcessID = PID then
        begin
          Result := PE.szExeFile;
          Break
        end
      until not Process32Next(SS, PE)
  finally
    CloseHandle(SS)
  end
end;

{$else}

function PID2Name(PID: LongWord): String;
var
  PH, MH: THandle;
  Needed: LongWord;
  ModName: array[0..MAX_PATH-1] of Char;
begin
  PH := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ, False, PID);
  try
    Win32Check(EnumProcessModules(PH, @MH, SizeOf(MH), Needed));
    Win32Check(Bool(GetModuleFileNameEx(PH, MH, ModName, SizeOf(ModName))));
    Result := ModName
  finally
    CloseHandle(PH)
  end
end;

{$endif}

procedure TForm1.btnIdentifyClick(Sender: TObject);
var
  Wnd: THandle;
begin
  Wnd := StrToIntDef(edtHWnd.Text, 0);
  if Wnd = 0 then
    Wnd := StrToIntDef('$' + edtHWnd.Text, 0);
  lblExe.Caption := 'EXE: ' + PID2Name(Wnd2PID(Wnd));
end;

end.
