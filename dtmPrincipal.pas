unit dtmPrincipal;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, Data.SqlExpr, Data.DBXFirebird, Vcl.Forms;

type
  TdtmMain = class(TDataModule)
    dbFirebird: TSQLConnection;
    qryProduto: TSQLQuery;
    dspProduto: TDataSetProvider;
    cdsProduto: TClientDataSet;
    cdsProdutoID_PRODUTO: TIntegerField;
    cdsProdutoNOME: TStringField;
    cdsProdutoPRECO: TFMTBCDField;
    procedure DataModuleCreate(Sender: TObject);
    procedure dbFirebirdBeforeConnect(Sender: TObject);
    procedure cdsProdutoBeforePost(DataSet: TDataSet);
    procedure cdsProdutoAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dtmMain: TdtmMain;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses frmPrincipal;

{$R *.dfm}


procedure TdtmMain.cdsProdutoAfterPost(DataSet: TDataSet);
begin
  cdsProduto.ApplyUpdates(0);
end;

procedure TdtmMain.cdsProdutoBeforePost(DataSet: TDataSet);
var
  vqry: TSQLQuery;
  vNovoId: integer;
begin
  if DataSet.State = dsInsert then
  begin
    vNovoId := 1;

    vqry := TSQLQuery.Create(self);
    try
      vqry.SQLConnection := dbFirebird;
      vqry.SQL.Text :=
        'SELECT MAX(ID_PRODUTO) AS NOVO_ID ' +
        'FROM PRODUTO';
      vqry.Open;
      if not vqry.IsEmpty then
        if not vqry.Fields[0].IsNull then
          vNovoId := vqry.Fields[0].AsInteger + 1;
      vqry.Close;
    finally
      vqry.Free;
    end;

    DataSet.FieldByName('ID_PRODUTO').AsInteger := vNovoId;
  end;
end;

procedure TdtmMain.DataModuleCreate(Sender: TObject);
begin
   try
      dbFirebird.Open;
   except

   end;
end;

procedure TdtmMain.dbFirebirdBeforeConnect(Sender: TObject);
begin
  dbFirebird.Params.Add('DATABASENAME='+  ChangeFileExt( Application.ExeName ,'.fdb'));
end;

end.
