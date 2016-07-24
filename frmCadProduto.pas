unit frmCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Mask, Vcl.DBCtrls;

type
  TfmCadProduto = class(TForm)
    pnlTop: TPanel;
    lblTitle: TLabel;
    pnlBottom: TPanel;
    btnOK: TButton;
    btnCancel: TButton;
    Label1: TLabel;
    dbeIDProduto: TDBEdit;
    dsProduto: TDataSource;
    Label2: TLabel;
    dbeDescricao: TDBEdit;
    Label3: TLabel;
    dbePreco: TDBEdit;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    function validacao: string;
  public
    { Public declarations }
  end;

var
  fmCadProduto: TfmCadProduto;

implementation

{$R *.dfm}

{ TfmCadProduto }

procedure TfmCadProduto.btnCancelClick(Sender: TObject);
begin
  if MessageBox(Handle, 'Tem certeza que deseja cancelar?'+chr(13)+'Todas as alterações serão perdidas.', 'Atenção', MB_OKCANCEL + MB_ICONQUESTION) = mrOk then
  begin

    if dsProduto.State in [dsInsert, dsEdit] then
      dsProduto.DataSet.Cancel;
    close;

  end;
end;

procedure TfmCadProduto.btnOKClick(Sender: TObject);
var
  vMensagem: string;
begin

  vMensagem := validacao;

  if vMensagem = '' then
  begin
    if dsProduto.State in [dsInsert, dsEdit] then
    begin
      dsProduto.DataSet.Post;
    end;
    close;
  end
  else
    MessageBox(Handle, pchar(vMensagem) , 'Atenção', MB_OK + MB_ICONEXCLAMATION);
end;


procedure TfmCadProduto.FormShow(Sender: TObject);
begin
  if dbeDescricao.CanFocus then
    dbeDescricao.SetFocus;
end;

function TfmCadProduto.validacao: string;
begin
  if Trim(dbeDescricao.Text) = '' then
  begin
    dbeDescricao.SetFocus;
    result := 'É necessário digitar a descrição do produto.';
  end
  else if (dbePreco.Field.IsNull) or (dbePreco.Field.AsFloat = 0) then
  begin
    dbePreco.SetFocus;
    result := 'O preço do produto deve ser maior que 0.';
  end
  else
    result := '';

end;

end.
