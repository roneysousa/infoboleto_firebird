object dmConsultas: TdmConsultas
  OldCreateOrder = False
  Left = 205
  Top = 167
  Height = 233
  Width = 317
  object dstCedentes: TSQLDataSet
    CommandText = 'Select CED_CODIGO, CED_NOME from CEDENTE order by CED_NOME'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmBoleto.sqlConnBoleto
    Left = 24
    Top = 24
  end
  object dspCedentes: TDataSetProvider
    DataSet = dstCedentes
    Options = [poAllowCommandText]
    Left = 88
    Top = 24
  end
  object cdsCedentes: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'dspCedentes'
    Left = 152
    Top = 24
    object cdsCedentesCED_CODIGO: TIntegerField
      FieldName = 'CED_CODIGO'
      Required = True
    end
    object cdsCedentesCED_NOME: TStringField
      FieldName = 'CED_NOME'
      Size = 50
    end
  end
  object qryConsulta: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmBoleto.sqlConnBoleto
    Left = 32
    Top = 136
  end
end
