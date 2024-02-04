unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, uniGUIBaseClasses, uniEdit,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, uniPageControl,
  uniStatusBar, uniSplitter, uniMemo, uniPanel, uniToolBar, FireDAC.Comp.DataSet;

type
  TMainForm = class(TUniForm)
    FDConnection1: TFDConnection;
    FDMemTable1: TFDMemTable;
    UniToolBar1: TUniToolBar;
    UniPanel1: TUniPanel;
    UniMemo1: TUniMemo;
    UniSplitter1: TUniSplitter;
    UniPanel2: TUniPanel;
    UniSplitter2: TUniSplitter;
    UniPanel3: TUniPanel;
    UniStatusBar1: TUniStatusBar;
    UniPageControl1: TUniPageControl;
    UniTabSheet_main: TUniTabSheet;
    UniStatusBar2: TUniStatusBar;
    UniToolBar2: TUniToolBar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

initialization
  RegisterAppFormClass(TMainForm);

end.
