object dtmMain: TdtmMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 206
  Width = 264
  object dbFirebird: TSQLConnection
    ConnectionName = 'FBConnection'
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Firebird'
      
        'Database=C:\Users\User\Documents\Embarcadero\Studio\Projects\Pro' +
        'va\Win32\Debug\prjProva.FDB'
      'RoleName=RoleName'
      'User_Name=sysdba'
      'Password=masterkey'
      'ServerCharSet='
      'SQLDialect=3'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'BlobSize=-1'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'IsolationLevel=ReadCommitted'
      'Trim Char=False')
    BeforeConnect = dbFirebirdBeforeConnect
    Left = 32
    Top = 8
  end
  object qryProduto: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'select ID_PRODUTO, NOME, PRECO from produto')
    SQLConnection = dbFirebird
    Left = 32
    Top = 64
  end
  object dspProduto: TDataSetProvider
    DataSet = qryProduto
    Left = 112
    Top = 64
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    BeforePost = cdsProdutoBeforePost
    AfterPost = cdsProdutoAfterPost
    Left = 200
    Top = 64
    object cdsProdutoID_PRODUTO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_PRODUTO'
      ProviderFlags = [pfInKey]
      Required = True
    end
    object cdsProdutoNOME: TStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'NOME'
      Size = 100
    end
    object cdsProdutoPRECO: TFMTBCDField
      DisplayLabel = 'Pre'#231'o'
      FieldName = 'PRECO'
      DisplayFormat = '#.00'
      Precision = 18
      Size = 2
    end
  end
end
