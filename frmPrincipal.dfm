object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Cadastro de Produtos'
  ClientHeight = 536
  ClientWidth = 759
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnlTop: TPanel
    Left = 0
    Top = 0
    Width = 759
    Height = 49
    Align = alTop
    Color = clNavy
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 635
    object lblTitle: TLabel
      Left = 16
      Top = 18
      Width = 176
      Height = 19
      Caption = 'Cadastro de Produtos'
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
    Top = 495
    Width = 759
    Height = 41
    Align = alBottom
    TabOrder = 1
    ExplicitTop = 258
    ExplicitWidth = 635
    object btnInsert: TButton
      Left = 8
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Inserir'
      TabOrder = 0
      OnClick = btnInsertClick
    end
    object btnEdit: TButton
      Left = 89
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Editar'
      TabOrder = 1
      OnClick = btnEditClick
    end
    object btnRemove: TButton
      Left = 170
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Remover'
      TabOrder = 2
      OnClick = btnRemoveClick
    end
    object btnExit: TButton
      Left = 672
      Top = 6
      Width = 75
      Height = 25
      Caption = '&Sair'
      TabOrder = 3
      OnClick = btnExitClick
    end
  end
  object pnlBody: TPanel
    Left = 0
    Top = 49
    Width = 759
    Height = 446
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    ExplicitLeft = 48
    ExplicitTop = 160
    ExplicitWidth = 185
    ExplicitHeight = 41
    object grdProdutos: TDBGrid
      Left = 0
      Top = 0
      Width = 759
      Height = 446
      Align = alClient
      DataSource = dsProdutos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_PRODUTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NOME'
          Width = 532
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECO'
          Visible = True
        end>
    end
    object mmError: TMemo
      Left = 288
      Top = 176
      Width = 185
      Height = 89
      Lines.Strings = (
        'mmError')
      TabOrder = 1
      Visible = False
    end
  end
  object dsProdutos: TDataSource
    DataSet = dtmMain.cdsProduto
    Left = 528
    Top = 88
  end
end
