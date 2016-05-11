object dmBoleto: TdmBoleto
  OldCreateOrder = False
  Left = 215
  Top = 164
  Height = 320
  Width = 406
  object sqlConnBoleto: TSQLConnection
    ConnectionName = 'Boleto'
    DriverName = 'UIB FireBird15'
    GetDriverFunc = 'getSQLDriverINTERBASE'
    LibraryName = 'dbexpUIBfire15.dll'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=UIB FireBird15'
      'BlobSize=-1'
      'CommitRetain=False'
      'Database=D:\Sistemas\InfoBoleto\Dados\INFOBOLETO.FDB'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'Password=masterkey'
      'RoleName=RoleName'
      'ServerCharSet=win1252'
      'SQLDialect=3'
      'Interbase TransIsolation=ReadCommited'
      'User_Name=SYSDBA'
      'WaitOnLocks=True')
    VendorLib = 'C:\windows\system32\fbclient.dll'
    Left = 40
    Top = 16
  end
  object dstConfig: TSQLDataSet
    CommandText = 'select * from PARAMENTOS'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConnBoleto
    Left = 144
    Top = 16
    object dstConfigCFG_CLIENTE: TIntegerField
      FieldName = 'CFG_CLIENTE'
    end
    object dstConfigCFG_BOLETO: TIntegerField
      FieldName = 'CFG_BOLETO'
    end
    object dstConfigCFG_CEDENTE: TIntegerField
      FieldName = 'CFG_CEDENTE'
    end
    object dstConfigCFG_CREDITO: TIntegerField
      FieldName = 'CFG_CREDITO'
    end
    object dstConfigCFG_MENS_BOLETO: TMemoField
      FieldName = 'CFG_MENS_BOLETO'
      BlobType = ftMemo
      Size = 1
    end
    object dstConfigCFG_LOCAL_PAGAMENTO: TStringField
      FieldName = 'CFG_LOCAL_PAGAMENTO'
      Size = 50
    end
  end
  object dspConfig: TDataSetProvider
    DataSet = dstConfig
    Options = [poAllowCommandText]
    OnGetTableName = dspConfigGetTableName
    Left = 200
    Top = 16
  end
  object cdsConfig: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConfig'
    Left = 256
    Top = 16
    object cdsConfigCFG_CLIENTE: TIntegerField
      FieldName = 'CFG_CLIENTE'
    end
    object cdsConfigCFG_BOLETO: TIntegerField
      FieldName = 'CFG_BOLETO'
    end
    object cdsConfigCFG_CEDENTE: TIntegerField
      FieldName = 'CFG_CEDENTE'
    end
    object cdsConfigCFG_CREDITO: TIntegerField
      FieldName = 'CFG_CREDITO'
    end
    object cdsConfigCFG_MENS_BOLETO: TMemoField
      FieldName = 'CFG_MENS_BOLETO'
      BlobType = ftMemo
      Size = 1
    end
    object cdsConfigCFG_LOCAL_PAGAMENTO: TStringField
      FieldName = 'CFG_LOCAL_PAGAMENTO'
      Size = 50
    end
  end
  object dsConfig: TDataSource
    DataSet = cdsConfig
    Left = 304
    Top = 16
  end
  object dstCedente: TSQLDataSet
    CommandText = 'select * from CEDENTE Where (CED_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = sqlConnBoleto
    Left = 40
    Top = 72
    object dstCedenteCED_CODIGO: TIntegerField
      FieldName = 'CED_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstCedenteCED_NOME: TStringField
      FieldName = 'CED_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstCedenteCED_CDCEDENTE: TStringField
      FieldName = 'CED_CDCEDENTE'
      ProviderFlags = [pfInUpdate]
      Size = 12
    end
    object dstCedenteCED_DIGITOCODIGO: TStringField
      FieldName = 'CED_DIGITOCODIGO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstCedenteCED_CDBANCO: TStringField
      FieldName = 'CED_CDBANCO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object dstCedenteCED_NOME_BANCO: TStringField
      FieldName = 'CED_NOME_BANCO'
      ProviderFlags = [pfInUpdate]
    end
    object dstCedenteCED_CDAGENCIA: TStringField
      FieldName = 'CED_CDAGENCIA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 4
    end
    object dstCedenteCED_DIGITO_AGENCIA: TStringField
      FieldName = 'CED_DIGITO_AGENCIA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstCedenteCED_NRCOTA: TStringField
      FieldName = 'CED_NRCOTA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object dstCedenteCED_DIGITO_NRCOTA: TStringField
      FieldName = 'CED_DIGITO_NRCOTA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
    object dstCedenteCED_CARTEIRA: TStringField
      FieldName = 'CED_CARTEIRA'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 3
    end
    object dstCedenteCED_ENDERECO: TStringField
      FieldName = 'CED_ENDERECO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstCedenteCED_NUMERO: TIntegerField
      FieldName = 'CED_NUMERO'
      ProviderFlags = [pfInUpdate]
    end
    object dstCedenteCED_COMPLEMENTO: TStringField
      FieldName = 'CED_COMPLEMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstCedenteCED_BAIRRO: TStringField
      FieldName = 'CED_BAIRRO'
      ProviderFlags = [pfInUpdate]
    end
    object dstCedenteCED_CIDADE: TStringField
      FieldName = 'CED_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dstCedenteCED_UF: TStringField
      FieldName = 'CED_UF'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
    object dstCedenteCED_CEP: TStringField
      FieldName = 'CED_CEP'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object dstCedenteCED_DIGITO_BANCO: TStringField
      FieldName = 'CED_DIGITO_BANCO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 1
    end
  end
  object dspCedente: TDataSetProvider
    DataSet = dstCedente
    Options = [poAllowCommandText]
    Left = 104
    Top = 72
  end
  object cdsCedente: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspCedente'
    Left = 168
    Top = 72
    object cdsCedenteCED_CODIGO: TIntegerField
      FieldName = 'CED_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsCedenteCED_NOME: TStringField
      FieldName = 'CED_NOME'
      Size = 50
    end
    object cdsCedenteCED_CDCEDENTE: TStringField
      FieldName = 'CED_CDCEDENTE'
      EditMask = '999999999999;0;_'
      Size = 12
    end
    object cdsCedenteCED_DIGITOCODIGO: TStringField
      FieldName = 'CED_DIGITOCODIGO'
      EditMask = '9;0;_'
      FixedChar = True
      Size = 1
    end
    object cdsCedenteCED_CDBANCO: TStringField
      FieldName = 'CED_CDBANCO'
      EditMask = '999;0;_'
      FixedChar = True
      Size = 3
    end
    object cdsCedenteCED_NOME_BANCO: TStringField
      FieldName = 'CED_NOME_BANCO'
    end
    object cdsCedenteCED_CDAGENCIA: TStringField
      FieldName = 'CED_CDAGENCIA'
      EditMask = '9999;0;_'
      FixedChar = True
      Size = 4
    end
    object cdsCedenteCED_DIGITO_AGENCIA: TStringField
      FieldName = 'CED_DIGITO_AGENCIA'
      EditMask = '9;0;_'
      FixedChar = True
      Size = 1
    end
    object cdsCedenteCED_NRCOTA: TStringField
      FieldName = 'CED_NRCOTA'
      EditMask = '9999999999;0;_'
      FixedChar = True
      Size = 10
    end
    object cdsCedenteCED_DIGITO_NRCOTA: TStringField
      FieldName = 'CED_DIGITO_NRCOTA'
      EditMask = '9;0;_'
      FixedChar = True
      Size = 1
    end
    object cdsCedenteCED_CARTEIRA: TStringField
      FieldName = 'CED_CARTEIRA'
      FixedChar = True
      Size = 3
    end
    object cdsCedenteCED_ENDERECO: TStringField
      FieldName = 'CED_ENDERECO'
      Size = 40
    end
    object cdsCedenteCED_NUMERO: TIntegerField
      FieldName = 'CED_NUMERO'
    end
    object cdsCedenteCED_COMPLEMENTO: TStringField
      FieldName = 'CED_COMPLEMENTO'
    end
    object cdsCedenteCED_BAIRRO: TStringField
      FieldName = 'CED_BAIRRO'
    end
    object cdsCedenteCED_CIDADE: TStringField
      FieldName = 'CED_CIDADE'
    end
    object cdsCedenteCED_UF: TStringField
      FieldName = 'CED_UF'
      FixedChar = True
      Size = 2
    end
    object cdsCedenteCED_CEP: TStringField
      Alignment = taRightJustify
      FieldName = 'CED_CEP'
      EditMask = '99999-999;0;_'
      FixedChar = True
      Size = 8
    end
    object cdsCedenteCED_DIGITO_BANCO: TStringField
      FieldName = 'CED_DIGITO_BANCO'
      EditMask = '9;0;_'
      FixedChar = True
      Size = 1
    end
  end
  object dstContasReceber: TSQLDataSet
    CommandText = 'select * from CONTASRECEBER Where (REC_CREDITO =  :pCREDITO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCREDITO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = sqlConnBoleto
    Left = 40
    Top = 176
    object dstContasReceberREC_CREDITO: TIntegerField
      FieldName = 'REC_CREDITO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstContasReceberREC_CEDENTE: TIntegerField
      FieldName = 'REC_CEDENTE'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_CLIENTE: TIntegerField
      FieldName = 'REC_CLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_DTDOCUMENTO: TDateField
      FieldName = 'REC_DTDOCUMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_DTVENCIMENTO: TDateField
      FieldName = 'REC_DTVENCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_DTRECEBIMENTO: TDateField
      FieldName = 'REC_DTRECEBIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_DTCREDITO: TDateField
      FieldName = 'REC_DTCREDITO'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_NOSSONUMERO: TStringField
      FieldName = 'REC_NOSSONUMERO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object dstContasReceberREC_VLDOCUMENTO: TFMTBCDField
      FieldName = 'REC_VLDOCUMENTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstContasReceberREC_VLDESCONTO: TFMTBCDField
      FieldName = 'REC_VLDESCONTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstContasReceberREC_VLABATIMENTO: TFMTBCDField
      FieldName = 'REC_VLABATIMENTO'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstContasReceberREC_VLMORA: TFMTBCDField
      FieldName = 'REC_VLMORA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstContasReceberREC_VLDESPESACOBRANCA: TFMTBCDField
      FieldName = 'REC_VLDESPESACOBRANCA'
      ProviderFlags = [pfInUpdate]
      Precision = 15
      Size = 2
    end
    object dstContasReceberREC_OBSERVACAO: TMemoField
      FieldName = 'REC_OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object dstContasReceberREC_USUARIO: TIntegerField
      FieldName = 'REC_USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_OBSERVACAO2: TMemoField
      FieldName = 'REC_OBSERVACAO2'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object dstContasReceberREC_NMSACADO: TStringField
      FieldName = 'REC_NMSACADO'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstContasReceberREC_CPFCNPJ: TStringField
      FieldName = 'REC_CPFCNPJ'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 16
    end
    object dstContasReceberREC_ENDERECO_SACADO: TStringField
      FieldName = 'REC_ENDERECO_SACADO'
      ProviderFlags = [pfInUpdate]
      Size = 40
    end
    object dstContasReceberREC_BAIRRO: TStringField
      FieldName = 'REC_BAIRRO'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_CIDADE: TStringField
      FieldName = 'REC_CIDADE'
      ProviderFlags = [pfInUpdate]
    end
    object dstContasReceberREC_CEP_SACADO: TStringField
      FieldName = 'REC_CEP_SACADO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 8
    end
    object dstContasReceberREC_UP_SACADO: TStringField
      FieldName = 'REC_UP_SACADO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 2
    end
  end
  object dspContasReceber: TDataSetProvider
    DataSet = dstContasReceber
    Options = [poAllowCommandText]
    OnGetTableName = dspContasReceberGetTableName
    Left = 136
    Top = 176
  end
  object cdsContasReceber: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCREDITO'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspContasReceber'
    Left = 232
    Top = 176
    object cdsContasReceberREC_CREDITO: TIntegerField
      FieldName = 'REC_CREDITO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      DisplayFormat = '0000000000'
    end
    object cdsContasReceberREC_CEDENTE: TIntegerField
      FieldName = 'REC_CEDENTE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContasReceberREC_CLIENTE: TIntegerField
      FieldName = 'REC_CLIENTE'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContasReceberREC_DTDOCUMENTO: TDateField
      FieldName = 'REC_DTDOCUMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContasReceberREC_DTVENCIMENTO: TDateField
      FieldName = 'REC_DTVENCIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContasReceberREC_DTRECEBIMENTO: TDateField
      FieldName = 'REC_DTRECEBIMENTO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContasReceberREC_DTCREDITO: TDateField
      FieldName = 'REC_DTCREDITO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContasReceberREC_NOSSONUMERO: TStringField
      FieldName = 'REC_NOSSONUMERO'
      ProviderFlags = [pfInUpdate]
      FixedChar = True
      Size = 10
    end
    object cdsContasReceberREC_VLDOCUMENTO: TFMTBCDField
      FieldName = 'REC_VLDOCUMENTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,##0.#0'
      EditFormat = '#,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsContasReceberREC_VLDESCONTO: TFMTBCDField
      FieldName = 'REC_VLDESCONTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,##0.#0'
      EditFormat = '#,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsContasReceberREC_VLABATIMENTO: TFMTBCDField
      FieldName = 'REC_VLABATIMENTO'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,##0.#0'
      EditFormat = '#,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsContasReceberREC_VLMORA: TFMTBCDField
      FieldName = 'REC_VLMORA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,##0.#0'
      EditFormat = '#,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsContasReceberREC_VLDESPESACOBRANCA: TFMTBCDField
      FieldName = 'REC_VLDESPESACOBRANCA'
      ProviderFlags = [pfInUpdate]
      DisplayFormat = '#,##0.#0'
      EditFormat = '#,##0.#0'
      Precision = 15
      Size = 2
    end
    object cdsContasReceberREC_OBSERVACAO: TMemoField
      FieldName = 'REC_OBSERVACAO'
      ProviderFlags = [pfInUpdate]
      BlobType = ftMemo
      Size = 1
    end
    object cdsContasReceberREC_USUARIO: TIntegerField
      FieldName = 'REC_USUARIO'
      ProviderFlags = [pfInUpdate]
    end
    object cdsContasReceberREC_NMCEDENTE: TStringField
      FieldKind = fkLookup
      FieldName = 'REC_NMCEDENTE'
      LookupDataSet = dmConsultas.cdsCedentes
      LookupKeyFields = 'CED_CODIGO'
      LookupResultField = 'CED_NOME'
      KeyFields = 'REC_CEDENTE'
      Size = 50
      Lookup = True
    end
    object cdsContasReceberREC_OBSERVACAO2: TMemoField
      FieldName = 'REC_OBSERVACAO2'
      BlobType = ftMemo
      Size = 1
    end
    object cdsContasReceberREC_NMSACADO: TStringField
      FieldName = 'REC_NMSACADO'
      Size = 50
    end
    object cdsContasReceberREC_CPFCNPJ: TStringField
      FieldName = 'REC_CPFCNPJ'
      FixedChar = True
      Size = 16
    end
    object cdsContasReceberREC_ENDERECO_SACADO: TStringField
      FieldName = 'REC_ENDERECO_SACADO'
      Size = 40
    end
    object cdsContasReceberREC_BAIRRO: TStringField
      FieldName = 'REC_BAIRRO'
    end
    object cdsContasReceberREC_CIDADE: TStringField
      FieldName = 'REC_CIDADE'
    end
    object cdsContasReceberREC_CEP_SACADO: TStringField
      Alignment = taRightJustify
      FieldName = 'REC_CEP_SACADO'
      EditMask = '99999-999;0;_'
      FixedChar = True
      Size = 8
    end
    object cdsContasReceberREC_UP_SACADO: TStringField
      FieldName = 'REC_UP_SACADO'
      FixedChar = True
      Size = 2
    end
  end
  object dsParcelas: TDataSource
    AutoEdit = False
    DataSet = cdsParcelas
    Left = 312
    Top = 80
  end
  object spIncParcelas: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PCREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'POPCAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PVLENTRADA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNRPARCELAS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PVLPARCELA'
        ParamType = ptInput
      end>
    SQLConnection = sqlConnBoleto
    StoredProcName = 'PRO_INC_PARCELA'
    Left = 304
    Top = 136
  end
  object spUpdateParcelas: TSQLStoredProc
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'PSEQUENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PCREDITO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'POPCAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PVLENTRADA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PNRPARCELAS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PVLPARCELA'
        ParamType = ptInput
      end>
    SQLConnection = sqlConnBoleto
    StoredProcName = 'NEW_PROCEDURE'
    Left = 328
    Top = 192
  end
  object dstParcelas: TSQLDataSet
    CommandText = 'select * from PARCELAS Where (PAR_CREDITO = :pCREDITO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCREDITO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = sqlConnBoleto
    Left = 40
    Top = 224
  end
  object dspParcelas: TDataSetProvider
    DataSet = dstParcelas
    Options = [poAllowCommandText]
    OnGetTableName = dspParcelasGetTableName
    Left = 112
    Top = 224
  end
  object cdsRecParcelas: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCREDITO'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspParcelas'
    Left = 184
    Top = 224
    object cdsRecParcelasPAR_SEQUECIA: TIntegerField
      FieldName = 'PAR_SEQUECIA'
      Required = True
    end
    object cdsRecParcelasPAR_CREDITO: TIntegerField
      FieldName = 'PAR_CREDITO'
      Required = True
    end
    object cdsRecParcelasPAR_OPCAO: TIntegerField
      FieldName = 'PAR_OPCAO'
    end
    object cdsRecParcelasPAR_VLENTRADA: TFMTBCDField
      FieldName = 'PAR_VLENTRADA'
      Precision = 15
      Size = 2
    end
    object cdsRecParcelasPAR_NRPARCELAS: TIntegerField
      FieldName = 'PAR_NRPARCELAS'
    end
    object cdsRecParcelasPAR_VLPARCELA: TFMTBCDField
      FieldName = 'PAR_VLPARCELA'
      Precision = 15
      Size = 2
    end
  end
  object cdsParcelas: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 240
    Top = 80
    Data = {
      BD0000009619E0BD010000001800000006000000000003000000BD0009504152
      5F534551554504000100000000000B5041525F4352454449544F040001000000
      0000095041525F4F5043414F04000100000000000D5041525F564C454E545241
      4441080004000000010007535542545950450200490006004D6F6E6579000E50
      41525F4E5250415243454C415304000100000000000D5041525F564C50415243
      454C41080004000000010007535542545950450200490006004D6F6E65790000
      00}
    object cdsParcelasPAR_SEQUE: TIntegerField
      FieldName = 'PAR_SEQUE'
    end
    object cdsParcelasPAR_CREDITO: TIntegerField
      FieldName = 'PAR_CREDITO'
    end
    object cdsParcelasPAR_OPCAO: TIntegerField
      FieldName = 'PAR_OPCAO'
    end
    object cdsParcelasPAR_VLENTRADA: TCurrencyField
      FieldName = 'PAR_VLENTRADA'
      DisplayFormat = '#,##0.#0'
      EditFormat = '#,##0.#0'
      currency = False
    end
    object cdsParcelasPAR_NRPARCELAS: TIntegerField
      FieldName = 'PAR_NRPARCELAS'
      DisplayFormat = '00'
    end
    object cdsParcelasPAR_VLPARCELA: TCurrencyField
      FieldName = 'PAR_VLPARCELA'
      DisplayFormat = '#,##0.#0'
      EditFormat = '#,##0.#0'
      currency = False
    end
  end
  object dstClientes: TSQLDataSet
    CommandText = 'select * from CLIENTES Where (CLI_CODIGO = :pCODIGO)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    SQLConnection = sqlConnBoleto
    Left = 32
    Top = 120
    object dstClientesCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object dstClientesCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      ProviderFlags = [pfInUpdate]
      Size = 50
    end
    object dstClientesCLI_FOTO: TBlobField
      FieldName = 'CLI_FOTO'
      ProviderFlags = [pfInUpdate]
      Size = 1
    end
  end
  object dspClientes: TDataSetProvider
    DataSet = dstClientes
    Options = [poAllowCommandText]
    OnGetTableName = dspClientesGetTableName
    Left = 88
    Top = 120
  end
  object cdsClientes: TClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'pCODIGO'
        ParamType = ptInput
        Value = 0
      end>
    ProviderName = 'dspClientes'
    Left = 152
    Top = 120
    object cdsClientesCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsClientesCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Size = 50
    end
    object cdsClientesCLI_FOTO: TBlobField
      FieldName = 'CLI_FOTO'
      Size = 1
    end
  end
end
