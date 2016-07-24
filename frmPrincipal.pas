unit frmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls, Datasnap.DBClient;

type
  TfrmMain = class(TForm)
    pnlTop: TPanel;
    pnlBottom: TPanel;
    btnInsert: TButton;
    btnEdit: TButton;
    btnRemove: TButton;
    btnExit: TButton;
    lblTitle: TLabel;
    dsProdutos: TDataSource;
    pnlBody: TPanel;
    grdProdutos: TDBGrid;
    mmError: TMemo;
    procedure btnExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses dtmPrincipal, frmCadProduto;

procedure TfrmMain.btnEditClick(Sender: TObject);
var
  frmCadastro: TfmCadProduto;
begin
  if (dsProdutos.State = dsBrowse) and (not dsProdutos.DataSet.IsEmpty) then
  begin
    frmCadastro := TfmCadProduto.Create(self);
     try
       grdProdutos.DataSource.DataSet.Edit;
       frmCadastro.ShowModal;
     finally
       frmCadastro.Free;
     end;
  end;
end;

procedure TfrmMain.btnExitClick(Sender: TObject);
begin
  close;
end;

procedure TfrmMain.btnInsertClick(Sender: TObject);
var
  frmCadastro: TfmCadProduto;
begin
  if (dsProdutos.State = dsBrowse) then
  begin
    frmCadastro := TfmCadProduto.Create(self);
     try
       grdProdutos.DataSource.DataSet.Append;
       frmCadastro.ShowModal;
     finally
       frmCadastro.Free;
     end;
  end;
end;

procedure TfrmMain.btnRemoveClick(Sender: TObject);
begin
  if (dsProdutos.State = dsBrowse) and (not dsProdutos.DataSet.IsEmpty) then
  begin
    if MessageBox(Handle, pchar('Tem certeza que deseja excluir o produto "'+dsProdutos.DataSet.Fields.FieldByName('NOME').AsString+'"?'), 'Atenção', MB_OKCANCEL + MB_ICONQUESTION) = mrOk then
    begin
      dsProdutos.DataSet.Delete;
      (dsProdutos.DataSet as TClientDataSet).ApplyUpdates(0);
    end;
  end;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  try
    grdProdutos.DataSource.DataSet.Open;
  except
  on e:exception do
    begin
       mmError.Visible := true;
       mmError.Lines.Clear;
       mmError.Lines.Add('********************************');
       mmError.Lines.Add('Erro ao iniciar o banco de dedos');
       mmError.Lines.Add('********************************');
       mmError.Lines.Add('Falha:');
       mmError.Lines.Add(e.Message);
       mmError.Lines.Add('********************************');
       mmError.Lines.Add('Verifique se o servidor Firebird está iniciado.');
       mmError.Lines.Add('Verifique se o arquivo de banco de dados prjProva.fdb está localizado na mesma pasta deste executável:');
       mmError.Lines.Add('********************************');
       mmError.Lines.Add('Após as verofocações, o aplicativo deve ser reiniciado.');
       mmError.Align := alClient;
       btnInsert.Enabled := false;
       btnEdit.Enabled := false;
       btnRemove.Enabled := false;
       grdProdutos.Enabled := false;
    end;

  end;
end;

end.
