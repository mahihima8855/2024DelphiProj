unit issueAnalizerByGraphP_bz;

interface

uses
FireDAC.Stan.Intf, IniFiles, System.SysUtils, system.DateUtils,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, uniGUIBaseClasses, uniEdit,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf;

type
        TissueAnalizerBz = class
        public
                dbpath : string;
                ini : TIniFile;
                conn : tfdconnection;
                query : tfdquery;
                memTable : tfdmemtable;
                tbl開始日,tbl最終日 : TDate;
                開始日,終了日 : TDate;       // 分析期間
                WhereToken_タスク : string;
                WhereToken_種類 : string;
                WhereToken_優先 : string;
                constructor create(conn: TFDConnection; query: TFDQuery; memTbl : TFDMemTable);
                destructor Destroy; override;
                procedure setDBPath;
                function doSQL(sql文: string): boolean;
                procedure createMemTable4Graph;
                procedure 日付セット(開始日, 終了日: TDateTime);
                procedure 発生件数計算;
                procedure 完了件数計算;
                function createWhereToken_タスク(eGov, eLaws, performance,
                  reasonkakugiinfraother: boolean): String;
                function createWhereToken_種類(bug, kadai, qa, moushiokurimemo
                  : boolean): string;
                function createWhereToken_優先(SS, A, B, B1,
                  B2B3C: boolean): string;
                procedure getTbl開始最終日;
              end;

implementation

uses Main;

procedure log(s:string);
begin
  MainForm.log(s);
end;

function TissueAnalizerBz.doSQL(sql文: string) : boolean;
begin
  result := true;
  try
  　query.Close;
    query.SQL.Clear;
    query.SQL.Add(sql文);
    query.IndexFieldNames := '';
    query.Open;
    query.FetchAll;
    query.First;
    log('=I=> SQL実行OK:'+sql文);
  except
    on e:Exception do begin
      log('=E=> SQL失敗　'+sql文+#13#10+e.Message);
      result := False;
    end;
  end;
end;

constructor TissueAnalizerBz.Create(conn: TFDConnection; query: TFDQuery; memTbl : TFDMemTable);
begin
        inherited Create;
        self.conn := conn;
        self.query := query;
        self.memTable := memtbl;
        ini := TIniFile.Create('app.ini');
        dbPath := ini.ReadString('main','dbpath','c:\temp\backlogbug.db');
end;

destructor TissueAnalizerBz.Destroy;
begin
        inherited Destroy;
        ini.Free;
end;

procedure TissueAnalizerBz.setDBPath;
begin
  conn.Connected :=False;
  conn.Params.values['Database'] := dbPath;
  conn.Connected := True;
  doSQL('select * from issueTbl');
end;

procedure TissueAnalizerBz.createMemTable4Graph;
begin
  with memTable do begin
    fieldDefs.Add('id',ftInteger,0,True);
    fieldDefs.Add('date',TFieldType.ftDate,0,False);
    fieldDefs.Add('value_1',ftInteger,0,false);
    fieldDefs.Add('value_2',ftInteger,0,false);
    fieldDefs.Add('value_3',ftInteger,0,false);
    fieldDefs.Add('value_4',ftInteger,0,false);
    fieldDefs.Add('value_5',ftInteger,0,false);
  end;
end;

procedure TissueAnalizerBz.日付セット(開始日,終了日: TDateTime);
var
  i,days : integer;
begin
  self.開始日 := 開始日;
  self.終了日 := 終了日;
  days := daysbetween(終了日,開始日);
  memTable.Open;
  memTable.EmptyDataSet;
  for i := 0 to days do begin
    memTable.Append;
    memTable.FieldByName('id').AsInteger := i+1;
    memTable.fieldbyName('date').AsDateTime := 開始日+i;
    memTable.post;
  end;
end;

procedure TissueAnalizerBz.発生件数計算;
var
  day : TDateTime;
  day_ : String;
  sql : string;
  発生件数 : integer;
begin
  memTable.First;
  while not memTable.eof do begin
     day := memTable.FieldByName('date').AsDateTime;
     day_ := datetimetostr(day);
     day_ := copy(day_,1,10)+'%';
     sql := 'select count(*) as cc from issueTbl where created like "'+day_+'";';
     doSQL(sql);
     発生件数 := query.FieldByName('cc').AsInteger;
     memTable.edit;
     memTable.FieldByName('value_1').AsInteger := 発生件数;
     memTable.post;
     memTable.Next;
  end;
end;

procedure TissueAnalizerBz.完了件数計算;
var
  day : TDateTime;
  day_ : String;
  sql : string;
  発生件数 : integer;
begin
  memTable.First;
  while not memTable.eof do begin
     day := memTable.FieldByName('date').AsDateTime;
     day_ := datetimetostr(day);
     day_ := copy(day_,1,10)+'%';
     sql := 'select count(*) as cc from issueTbl where completed like "'+day_+'";';
     doSQL(sql);
     発生件数 := query.FieldByName('cc').AsInteger;
     memTable.edit;
     memTable.FieldByName('value_2').AsInteger := 発生件数;
     memTable.post;
     memTable.Next;
  end;
end;

function TissueAnalizerBz.createWhereToken_タスク(eGov,eLaws,performance,reasonkakugiinfraother: boolean): String;
var
  isAll : boolean;
  token : string;
begin
 result := '';
 WhereToken_タスク := '';
 isAll := eGOv and eLaws and performance and reasonkakugiinfraother;
 if isAll then exit;  // where token不要

 if eGov then begin
   token := '((taskKind = "01.e-Gov/e-LAWS") or (taskKind = "02.e-Gov"))';
   if result = '' then
      result := token else
      result := result + ' and '+ token;
 end;
 if eLaws then begin
   token := '((taskKind = "01.e-Gov/e-LAWS") or (taskKind = "03.e-LAWS"))';
   if result = '' then
      result := token else
      result := result + ' and '+ token;
 end;
 if performance then begin
   token := '(taskKind = "04.性能")';
   if result = '' then
      result := token else
      result := result + ' and '+ token;
 end;
 if reasonkakugiinfraother then begin
   token := '((taskKind = "05.理由") or (taskKind = "06.閣議") or (taskKind = "07.環境") or (taskKind = "99.その他") or (taskKind = ""))';
   if result = '' then
      result := token else
      result := result + ' and '+ token;
 end;
 WhereToken_タスク := result;
end;

function TissueAnalizerBz.createWhereToken_種類(bug,kadai,qa,moushiokurimemo:boolean): string;
var
  isAll : boolean;
  token : string;
begin
 result := '';
 WhereToken_種類 := '';
 isAll := bug and kadai and qa and moushiokurimemo;
 if isAll then exit;  // where token不要

 if bug then begin
   token := '(issueType = "バグ")';
   if result = '' then
      result := token else
      result := result + ' and '+ token;
 end;
 if kadai then begin
   token := '(issueType = "課題")';
   if result = '' then
      result := token else
      result := result + ' and '+ token;
 end;
 if qa then begin
   token := '(issueType = "質問")';
   if result = '' then
      result := token else
      result := result + ' and '+ token;
 end;
 if moushiokurimemo then begin
   token := '((issueType = "申し送り") or (issueType = "メモ") or (issueType = ""))';
   if result = '' then
      result := token else
      result := result + ' and '+ token;
 end;
 WhereToken_種類 := result;
end;

function TissueAnalizerBz.createWhereToken_優先(SS,A,B,B1,B2B3C: boolean): string;
var
  isAll : boolean;
  token : string;
begin
 result := '';
 WhereToken_優先 := '';
 isAll := SS and A and B and B1 and B2B3C;
 if isAll then exit;  // where token不要

 if SS then begin
   token := '(prioS = "SS")';
   if result = '' then
      result := token else
      result := result + ' and '+ token;
 end;
 if A then begin
   token := '(prioS = "A")';
   if result = '' then
      result := token else
      result := result + ' and '+ token;
 end;
 if B then begin
   token := '(prioS = "B")';
   if result = '' then
      result := token else
      result := result + ' and '+ token;
 end;
  if B1 then begin
   token := '(prioS = "B1")';
   if result = '' then
      result := token else
      result := result + ' and '+ token;
 end;
 if B2B3C then begin
   token := '((prioS = "B2") or (prioS = "B3") or (prioS = "C") or (prioS = ""))';
   if result = '' then
      result := token else
      result := result + ' and '+ token;
 end;
 WhereToken_優先 := result;
end;

procedure TissueAnalizerBz.getTbl開始最終日;
var
  sql : string;
begin
  sql := 'select min(date) as dd from issueTbl';
  doSQL(sql);
  self.tbl開始日 := query.FieldByName('dd').AsDateTime;
  sql := 'select max(date) as dd from issueTbl';
  doSQL(sql);
  self.tbl最終日 := query.FieldByName('dd').AsDateTime;
end;

end.
