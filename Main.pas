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
  uniSpeedButton, uniGridExporters;

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
    UniLineSeries1: TUniLineSeries;
    UniLineSeries2: TUniLineSeries;
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
    UniLabel7: TUniLabel;
    UniDateTimePicker_startDate: TUniDateTimePicker;
    UniLabel8: TUniLabel;
    UniDateTimePicker_endDate: TUniDateTimePicker;
    UniDateTimePicker_endDateOfcompletedPeriod: TUniDateTimePicker;
    UniLabel9: TUniLabel;
    UniLabel10: TUniLabel;
    UniDateTimePicker_startDateOfcompletedPeriod: TUniDateTimePicker;
    UniGridExcelExporter1: TUniGridExcelExporter;
    UniSpeedButton_exportExcel: TUniSpeedButton;
    UniLabel1: TUniLabel;
    UniButton_initializeTable: TUniButton;
    FDMemTable1completedCountOnCondition: TIntegerField;
    FDMemTable1value_6: TIntegerField;
    procedure UniFormCreate(Sender: TObject);
    procedure UniFormShow(Sender: TObject);
    procedure UniFormDestroy(Sender: TObject);
    procedure UniButton_setStartDate_endDateClick(Sender: TObject);
    procedure UniButton_createdCountClick(Sender: TObject);
    procedure UniButton_completedCountClick(Sender: TObject);
    procedure UniButton1Click(Sender: TObject);
    procedure UniButton_initializeTableClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure log(s:string);
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

procedure TMainForm.log(s: string);
var
  ts : TStrings;
begin
  ts := TStringList.Create;
  ts.Assign(uniMemo1.lines);
  uniMemo1.Lines.Clear;
  unimemo1.Lines.Add(DateTimetostr(Now)+' '+s);
  for var t in ts do
      unimemo1.lines.add(t);
  freeandnil(ts);
end;

procedure TMainForm.UniButton1Click(Sender: TObject);
begin
 uniChart1.Update;
 uniChart1.RefreshData;
 uniChart1.Refresh;
exit;
   uniLineSeries1.XLabelsSource := 'date';
   uniLineSeries1.YValues.ValueSource := 'value_1';
   uniLineSeries2.XLabelsSource := 'date';
   uniLineSeries2.YValues.ValueSource := 'value_2'
end;

procedure TMainForm.UniButton_completedCountClick(Sender: TObject);
begin
  bz.完了件数計算('');
end;

procedure TMainForm.UniButton_createdCountClick(Sender: TObject);
begin
  bz.発生件数計算('');
end;

procedure TMainForm.UniButton_initializeTableClick(Sender: TObject);
begin
 bz.createWhereToken_タスク(Self.UniCheckBox_eGov.checked,
                            self.UniCheckBox_eLaws.checked,
                            self.UniCheckBox_performance.checked,
                            self.UniCheckBox_performance.checked);
 bz.createWhereToken_種類(self.UniCheckBox_bug.Checked,
                          self.UniCheckBox_kadai.Checked,
                          self.UniCheckBox_QA.Checked,
                          self.UniCheckBox_moushiokuriOthers.checked);
 bz.createWhereToken_優先(self.UniCheckBox_PrioSS.Checked,
                          self.UniCheckBox_PrioA.Checked,
                          self.UniCheckBox_PrioB.Checked,
                          self.UniCheckBox_prioB1.Checked,
                          self.UniCheckBox_prioB2B3C.Checked);
 bz.setInitialdata2Table;
end;

procedure TMainForm.UniButton_setStartDate_endDateClick(Sender: TObject);
begin
  bz.日付セット(self.UniDateTimePicker_startDate.DateTime,self.UniDateTimePicker_endDate.DateTime);
end;

procedure TMainForm.UniFormCreate(Sender: TObject);  // form initialize
begin
  bz := TissueAnalizerBz.Create(self.FDConnection1,self.FDQuery1,self.FDMemTable1);
end;
procedure TMainForm.UniFormDestroy(Sender: TObject); // form破棄
begin
   freeandnil(bz);
end;

procedure TMainForm.UniFormShow(Sender: TObject);     // Form初期表示
begin
   bz.setDBPath;
   self.UniDateTimePicker_startDate.DateTime := now - 20;       // 分析開始は20日前
   self.UniDateTimePicker_endDate.DateTime := now;
end;

initialization
  RegisterAppFormClass(TMainForm);

finalization

end.
