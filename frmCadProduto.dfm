object fmCadProduto: TfmCadProduto
  Left = 0
  Top = 0
  BorderIcons = []
  BorderStyle = bsToolWindow
  Caption = 'Produto'
  ClientHeight = 241
  ClientWidth = 645
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 56
    Width = 11
    Height = 13
    Caption = 'ID'
    FocusControl = dbeIDProduto
  end
  object Label2: TLabel
    Left = 8
    Top = 96
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
    FocusControl = dbeDescricao
  end
  object Label3: TLabel
    Left = 8
    Top = 136
    Width = 27
    Height = 13
    Caption = 'Pre'#231'o'
    FocusControl = dbePreco
  end
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 645
    Height = 49
    Align = alTop
    Color = clNavy
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 635
    object lblTitle: TLabel
      Left = 16
      Top = 18
      Width = 251
      Height = 19
      Caption = 'Inclus'#227'o/Altera'#231#227'o de Produto'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object pnlBottom: TPanel
    Left = 0
    Top = 200
    Width = 645
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 258
    ExplicitWidth = 635
    object btnOK: TButton
      Left = 463
      Top = 8
      Width = 75
      Height = 25
      Caption = '&OK'
      TabOrder = 0
      OnClick = btnOKClick
    end
    object btnCancel: TButton
      Left = 544
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 1
      OnClick = btnCancelClick
    end
  end
  object dbeIDProduto: TDBEdit
    Left = 8
    Top = 72
    Width = 134
    Height = 21
    DataField = 'ID_PRODUTO'
    DataSource = dsProduto
    Enabled = False
    TabOrder = 2
  end
  object dbeDescricao: TDBEdit
    Left = 8
    Top = 112
    Width = 611
    Height = 21
    DataField = 'NOME'
    DataSource = dsProduto
    TabOrder = 3
  end
  object dbePreco: TDBEdit
    Left = 8
    Top = 152
    Width = 251
    Height = 21
    DataField = 'PRECO'
    DataSource = dsProduto
    TabOrder = 4
  end
  object dsProduto: TDataSource
    DataSet = dtmMain.cdsProduto
    Left = 536
    Top = 8
  end
end
