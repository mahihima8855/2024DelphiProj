unit issueAnalizerByGraphP_bz;

interface

uses
FireDAC.Stan.Intf, IniFiles,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, uniGUIBaseClasses, uniEdit,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf;

type
        TissueAnalizerBz = class
        public
                dbpath : string;
                ini : TIniFile;
                constructor Create;
                destructor Destroy; override;
        end;

implementation

uses Main;

procedure log(s:string);
begin
  MainForm.log(s);
end;

constructor TissueAnalizerBz.Create;
begin
        inherited Create;
        ini := TIniFile.Create('app.ini');
        dbPath := ini.ReadString('main','dbpath','c:\temp\backlogbug.db');
end;

destructor TissueAnalizerBz.Destroy;
begin
        inherited Destroy;
        ini.Free;
end;

end.
