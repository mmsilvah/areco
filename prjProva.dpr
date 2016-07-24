program prjProva;

uses
  Vcl.Forms,
  frmPrincipal in 'frmPrincipal.pas' {frmMain},
  frmCadProduto in 'frmCadProduto.pas' {fmCadProduto},
  dtmPrincipal in 'dtmPrincipal.pas' {dtmMain: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdtmMain, dtmMain);
  Application.Run;
end.
