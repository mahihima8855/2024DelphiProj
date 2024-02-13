unit issueAnalizerByGraph_login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics,
  Controls, Forms, uniGUITypes, uniGUIAbstractClasses,
  uniGUIClasses, uniGUIRegClasses, uniGUIForm, uniButton, uniEdit,
  uniGUIBaseClasses, uniLabel;

type
  TUniLoginForm1 = class(TUniLoginForm)
    UniLabel1: TUniLabel;
    UniEdit1: TUniEdit;
    UniEdit2: TUniEdit;
    UniLabel2: TUniLabel;
    UniButton1: TUniButton;
    UniLabel3: TUniLabel;
    procedure UniButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function UniLoginForm1: TUniLoginForm1;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication;

function UniLoginForm1: TUniLoginForm1;
begin
  Result := TUniLoginForm1(UniMainModule.GetFormInstance(TUniLoginForm1));
end;

procedure TUniLoginForm1.UniButton1Click(Sender: TObject);
var
 s: string;
 ix : integer;
begin
  if (trim(self.UniEdit1.Text) = '') or (trim(self.UniEdit2.Text) = '') then begin
    self.UniLabel3.Visible := True;
    self.UniLabel3.Caption := 'userIDまたはpasswordフィールドが空です。';
    exit;
  end;

  s := trim(self.UniEdit2.text);
  if  (s = 'I Should Be So Lucky 2023.') or (s = 'katsuki2023') or (s = 'I am a 2024 e-Laws team member.') then begin
    self.UniLabel3.Visible := False;
    ModalResult := mrOK;
    UniApplication.Parameters.Values['userid'] := trim(self.UniEdit1.Text);
  end else begin
    self.UniLabel3.Visible := True;
    self.UniLabel3.Caption := 'パスワードが間違っています。';
  end;
end;

initialization
  RegisterAppFormClass(TUniLoginForm1);

end.
