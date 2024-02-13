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
  uniStatusBar, uniSplitter, uniMemo, uniPanel, uniToolBar, FireDAC.Comp.DataSet,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteWrapper.Stat, FireDAC.DApt, uniButton, uniBasicGrid,
  uniDBGrid, uniDateTimePicker, uniChart, uniCheckBox, uniLabel, uniBitBtn,
  uniSpeedButton, uniGridExporters, uniRadioGroup;

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
    UniTabSheet_datatable: TUniTabSheet;
    UniStatusBar2: TUniStatusBar;
    UniToolBar2: TUniToolBar;
    FDQuery1: TFDQuery;
    FDMemTable1id: TIntegerField;
    FDMemTable1date: TDateField;
    FDMemTable1value_1: TIntegerField;
    FDMemTable1value_2: TIntegerField;
    FDMemTable1value_3: TIntegerField;
    FDMemTable1value_4: TIntegerField;
    FDMemTable1value_5: TIntegerField;
    UniDBGrid1: TUniDBGrid;
    DataSource1: TDataSource;
    UniTabSheet_graphofCount: TUniTabSheet;
    UniToolBar3: TUniToolBar;
    UniStatusBar3: TUniStatusBar;
    UniChart1: TUniChart;
    Day_ALL_created: TUniLineSeries;
    Day_ALL_completed: TUniLineSeries;
    UniPanel4: TUniPanel;
    UniButton_createTable4Graph: TUniButton;
    UniButton_setStartDate_endDate: TUniButton;
    UniButton_createdCount: TUniButton;
    UniButton_completedCount: TUniButton;
    UniButton1: TUniButton;
    UniPanel5: TUniPanel;
    UniLabel4: TUniLabel;
    UniCheckBox_eGov: TUniCheckBox;
    UniCheckBox_eLaws: TUniCheckBox;
    UniCheckBox_performance: TUniCheckBox;
    UniCheckBox_ReasonOthers: TUniCheckBox;
    UniLabel5: TUniLabel;
    UniCheckBox_bug: TUniCheckBox;
    UniCheckBox_kadai: TUniCheckBox;
    UniCheckBox_QA: TUniCheckBox;
    UniCheckBox_moushiokuriOthers: TUniCheckBox;
    UniLabel6: TUniLabel;
    UniCheckBox_PrioSS: TUniCheckBox;
    UniCheckBox_PrioA: TUniCheckBox;
    UniCheckBox_PrioB: TUniCheckBox;
    UniCheckBox_prioB1: TUniCheckBox;
    UniCheckBox_prioB2B3C: TUniCheckBox;
    UniButton_createDataandGraph: TUniButton;
    FDMemTable1createdCountofTable: TIntegerField;
    FDMemTable1completedCountofTable: TIntegerField;
    FDMemTable1createdCountonCondition: TIntegerField;
    FDMemTable1sumofcompletedCountonDay: TIntegerField;
    FDMemTable1sumofcreatedCountonDay: TIntegerField;
    FDMemTable1completedPeriodonCondition: TIntegerField;
    FDMemTable1completedPeriodonUntilTheDay: TIntegerField;
    FDMemTable1sumUncompletedCountonTheDay: TIntegerField;
    UniTabSheet_completedPeriod: TUniTabSheet;
    UniToolBar4: TUniToolBar;
    UniStatusBar4: TUniStatusBar;
    UniGridExcelExporter_graphData: TUniGridExcelExporter;
    UniSpeedButton_exportExcel_graphData: TUniSpeedButton;
    UniLabel1: TUniLabel;
    UniButton_initializeTable: TUniButton;
    FDMemTable1completedCountOnCondition: TIntegerField;
    FDMemTable1value_6: TIntegerField;
    FDMemTable1noDisplayFlg: TBooleanField;
    FDMemTable1weekday: TStringField;
    FDMemTable1sumOfCompleted_ConditionByD: TIntegerField;
    FDMemTable1sumOfCreated_ConditionByD: TIntegerField;
    Sum_ALL_created: TUniLineSeries;
    Sum_ALL_completed: TUniLineSeries;
    Sum_ALL_umcompleted: TUniLineSeries;
    Day_COND_created: TUniLineSeries;
    Day_COND_completed: TUniLineSeries;
    Sum_COND_created: TUniLineSeries;
    Sum_COND_completed: TUniLineSeries;
    UniTabSheet1: TUniTabSheet;
    UniToolBar5: TUniToolBar;
    UniStatusBar5: TUniStatusBar;
    UniDBGrid_SourceData: TUniDBGrid;
    DataSource_Source: TDataSource;
    FDQuery_Source: TFDQuery;
    FDMemTable1sumUncompletedOnConditionTheDay: TIntegerField;
    Sum_COND_uncompleted: TUniLineSeries;
    UniPanel6: TUniPanel;
    UniLabel7: TUniLabel;
    UniDateTimePicker_startDate: TUniDateTimePicker;
    UniLabel8: TUniLabel;
    UniDateTimePicker_endDate: TUniDateTimePicker;
    UniSpeedButton_excelExport_sourceData: TUniSpeedButton;
    UniGridExcelExporter_sourceData: TUniGridExcelExporter;
    UniRadioGroup1: TUniRadioGroup;
    UniChart2: TUniChart;
    UniToolBar6: TUniToolBar;
    Day_ave_completed: TUniLineSeries;
    untilTheDay_ave_completed: TUniLineSeries;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniButton_setStartDate_endDateClick(Sender: TObject);
    procedure UniButton_createdCountClick(Sender: TObject);
    procedure UniButton_completedCountClick(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
    procedure UniButton_initializeTableClick(Sender: TObject);
    procedure UniCheckBox_eGovClick(Sender: TObject);
    procedure UniButton_createDataandGraphClick(Sender: TObject);
    procedure UniButton_createTable4GraphClick(Sender: TObject);
    procedure UniMemo1DblClick(Sender: TObject);
    procedure UniDateTimePicker_startDateChange(Sender: TObject);
    procedure UniRadioGroup1ChangeValue(Sender: TObject);
    procedure UniSpeedButton_excelExport_sourceDataClick(Sender: TObject);
    procedure UniSpeedButton_exportExcel_graphDataClick(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
    procedure log(s:string);
    procedure UI条件でのSQL文作成;
    procedure chart更新;
  end;

function MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  uniGUIVars, MainModule, uniGUIApplication, issueAnalizerByGraphP_bz;

var
  bz : TissueAnalizerBz;

function MainForm: TMainForm;
begin
  Result := TMainForm(UniMainModule.GetFormInstance(TMainForm));
end;

procedure TMainForm.log(s: string);             // log
var
  ts : TStrings;
begin
  if bz.debug = False then begin        // debug = Falseの時は=D=> は表示しない。
    if Pos('=D=> ',s) > 0 then exit;
  end;

  ts := TStringList.Create;
  ts.Assign(uniMemo1.lines);
  uniMemo1.Lines.Clear;
  unimemo1.Lines.Add(DateTimetostr(Now)+' '+s);
  for var t in ts do
      unimemo1.lines.add(t);
  freeandnil(ts);
end;

procedure TMainForm.chart更新;                  // chart更新
begin
  uniChart1.Update;
  uniChart1.RefreshData;
  uniChart1.Refresh;
  uniChart2.Update;
  uniChart2.RefreshData;
  uniChart2.Refresh;
end;

procedure TMainForm.UI条件でのSQL文作成;
begin
 bz.createWhereToken_タスク(Self.UniCheckBox_eGov.checked,
                            self.UniCheckBox_eLaws.checked,
                            self.UniCheckBox_performance.checked,
                            self.UniCheckBox_ReasonOthers.Checked);
 bz.createWhereToken_種類(self.UniCheckBox_bug.Checked,
                          self.UniCheckBox_kadai.Checked,
                          self.UniCheckBox_QA.Checked,
                          self.UniCheckBox_moushiokuriOthers.checked);
 bz.createWhereToken_優先(self.UniCheckBox_PrioSS.Checked,
                          self.UniCheckBox_PrioA.Checked,
                          self.UniCheckBox_PrioB.Checked,
                          self.UniCheckBox_prioB1.Checked,
                          self.UniCheckBox_prioB2B3C.Checked);
 log('=I=> 作成されたWhere句 = '+bz.sqlWhere条件作成FromUI);
end;

procedure TMainForm.UniCheckBox_eGovClick(Sender: TObject);   // checkBox click
begin
  self.UI条件でのSQL文作成;
end;

procedure TMainForm.UniDateTimePicker_startDateChange(Sender: TObject);    // 開始と終了日付指定Change
begin
  bz.開始日 := self.UniDateTimePicker_startDate.DateTime;
  bz.終了日 := self.UniDateTimePicker_endDate.Datetime;
  bz.フィルターフラグによる期間設定(self.UniDateTimePicker_startDate.DateTime,self.UniDateTimePicker_endDate.DateTime);
  chart更新;
end;

procedure TMainForm.UniMemo1DblClick(Sender: TObject);       // メモクリア
begin
  UniMemo1.Lines.Clear;
end;

procedure TMainForm.UniRadioGroup1ChangeValue(Sender: TObject);    // グラフ x軸設定
var
  s,t : string;
  series :  TUniLineSeries;
begin
    if uniRadioGroup1.ItemIndex = -1 then exit;
    t := '';
    s := uniRadioGroup1.Items[uniRadioGroup1.ItemIndex] ;
    if s = '日付' then
      t := 'date'
      else if s = '曜日' then
           t := 'weekday'
           else if s = '連番' then
             t := 'id';
    if t <> '' then begin
      for series in uniChart1.SeriesList do begin
        series.XLabelsSource  := t;
      end;
      for series in uniChart2.SeriesList do begin
        series.XLabelsSource  := t;
      end;
      chart更新;
    end;
 end;

procedure TMainForm.UniSpeedButton_excelExport_sourceDataClick(Sender: TObject);   // excel出力　ソースデータ
begin
  uniDBGrid_SourceData.Exporter.ExportGrid;
end;

procedure TMainForm.UniSpeedButton_exportExcel_graphDataClick(Sender: TObject);  // excel出力　グラフ集計データ
begin
   uniDBGrid1.Exporter.Title := 'グラフ用集計データ:'+bz.条件;
   uniDBGrid1.Exporter.ExportGrid;
end;

procedure TMainForm.UniButton_createDataandGraphClick(Sender: TObject);    // 主UIボタン
begin
  bz.UI上の条件変更に基づくテーブルデータ設定;
  chart更新;　
  bz.ソーステーブル更新;
end;

procedure TMainForm.UniButton_initializeTableClick(Sender: TObject);   // アプリ的初期化  (内部呼び出し、UIからボタンは使っていない)
begin
  self.UI条件でのSQL文作成;
  bz.setInitialdata2Table;
  dataSource1.DataSet := bz.memTable;
  chart更新;
  bz.ソーステーブル更新;
  UniButton_createDataandGraph.Enabled := True;
end;

procedure TMainForm.UniFormShow(Sender: TObject);     // Form初期表示
begin
   bz.setDBPath;  // fdquery connection dbpath設定、fdquery open

   // グラフテーブル初期化、グラフ初期表示
   UniButton_initializeTableClick(UniButton_initializeTable);

   // UI上カレンダー日付設定
   self.UniDateTimePicker_startDate.DateTime := bz.tbl開始日;       // 分析開始は20日前
   self.UniDateTimePicker_endDate.DateTime := bz.tbl最終日;
end;

procedure TMainForm.UniFormCreate(Sender: TObject);  // form initialize
begin
  bz := TissueAnalizerBz.Create(self.FDConnection1,self.FDQuery1,self.FDQuery_Source,self.FDMemTable1);
  bz.条件 := '';
end;

procedure TMainForm.UniFormDestroy(Sender: TObject); // form破棄
begin
   freeandnil(bz);
end;

///////     使っていない
procedure TMainForm.UniButton1Click(Sender: TObject); // 使っていない
begin
 chart更新;
end;
procedure TMainForm.UniButton_completedCountClick(Sender: TObject);  // 使っていない
begin
  bz.完了件数計算('');
end;
procedure TMainForm.UniButton_createdCountClick(Sender: TObject);    // 使っていない
begin
  bz.発生件数計算('');
end;
procedure TMainForm.UniButton_createTable4GraphClick(Sender: TObject);  //  使っていない
begin
  bz.createMemTable4Graph;
  dataSource1.DataSet := bz.memTable;
end;
procedure TMainForm.UniButton_setStartDate_endDateClick(Sender: TObject);   // 使っていいない
begin
  bz.日付セット(self.UniDateTimePicker_startDate.DateTime,self.UniDateTimePicker_endDate.DateTime);
end;
/////

initialization
  RegisterAppFormClass(TMainForm);
finalization

end.
