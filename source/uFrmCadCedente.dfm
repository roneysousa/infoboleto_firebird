inherited frmCadCedente: TfrmCadCedente
  Left = 191
  Top = 90
  Caption = 'Cadastro de Cedente'
  ClientHeight = 434
  ClientWidth = 582
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Width = 582
    Height = 405
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 9
        Top = 7
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        Transparent = True
      end
      object DBText1: TDBText [1]
        Left = 9
        Top = 21
        Width = 80
        Height = 22
        AutoSize = True
        DataField = 'CED_CODIGO'
        DataSource = dsCedente
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
      object Label2: TLabel [2]
        Left = 9
        Top = 47
        Width = 86
        Height = 13
        Caption = 'Nome do Cedente'
        FocusControl = dbeNMCEDE
      end
      inherited Panel1: TPanel
        Top = 336
        Width = 574
      end
      object dbeNMCEDE: TDBEdit
        Left = 9
        Top = 63
        Width = 533
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CED_NOME'
        DataSource = dsCedente
        TabOrder = 1
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 92
        Width = 537
        Height = 106
        Caption = '[ Dados banc'#225'rios do cedente ]'
        TabOrder = 2
        object Label5: TLabel
          Left = 6
          Top = 15
          Width = 150
          Height = 13
          Caption = 'Banco (C'#243'digo / Digito / Nome)'
        end
        object Label7: TLabel
          Left = 311
          Top = 14
          Width = 130
          Height = 13
          Caption = 'C'#243'digo do cedente / D'#237'gito'
          Transparent = True
        end
        object Label9: TLabel
          Left = 488
          Top = 14
          Width = 36
          Height = 13
          Caption = 'Carteira'
          Transparent = True
        end
        object Label10: TLabel
          Left = 6
          Top = 56
          Width = 121
          Height = 13
          Caption = 'Ag'#234'ncia (C'#243'digo / D'#237'gito)'
          Transparent = True
        end
        object Label13: TLabel
          Left = 311
          Top = 56
          Width = 114
          Height = 13
          Caption = 'Conta (N'#250'mero / D'#237'gito)'
          Transparent = True
        end
        object DBEdit1: TDBEdit
          Left = 8
          Top = 32
          Width = 43
          Height = 21
          DataField = 'CED_CDBANCO'
          DataSource = dsCedente
          TabOrder = 0
        end
        object DBEdit2: TDBEdit
          Left = 89
          Top = 32
          Width = 212
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CED_NOME_BANCO'
          DataSource = dsCedente
          TabOrder = 2
        end
        object DBEdit3: TDBEdit
          Left = 311
          Top = 32
          Width = 118
          Height = 21
          DataField = 'CED_CDCEDENTE'
          DataSource = dsCedente
          TabOrder = 3
        end
        object DBEdit4: TDBEdit
          Left = 439
          Top = 32
          Width = 35
          Height = 21
          DataField = 'CED_DIGITOCODIGO'
          DataSource = dsCedente
          TabOrder = 4
        end
        object DBEdit5: TDBEdit
          Left = 488
          Top = 32
          Width = 43
          Height = 21
          DataField = 'CED_CARTEIRA'
          DataSource = dsCedente
          TabOrder = 5
        end
        object DBEdit6: TDBEdit
          Left = 8
          Top = 72
          Width = 74
          Height = 21
          DataField = 'CED_CDAGENCIA'
          DataSource = dsCedente
          TabOrder = 6
        end
        object DBEdit7: TDBEdit
          Left = 89
          Top = 72
          Width = 38
          Height = 21
          DataField = 'CED_DIGITO_AGENCIA'
          DataSource = dsCedente
          TabOrder = 7
        end
        object DBEdit8: TDBEdit
          Left = 311
          Top = 72
          Width = 118
          Height = 21
          DataField = 'CED_NRCOTA'
          DataSource = dsCedente
          TabOrder = 8
        end
        object DBEdit9: TDBEdit
          Left = 439
          Top = 72
          Width = 35
          Height = 21
          DataField = 'CED_DIGITO_NRCOTA'
          DataSource = dsCedente
          TabOrder = 9
        end
        object DBEdit15: TDBEdit
          Left = 56
          Top = 32
          Width = 28
          Height = 21
          DataField = 'CED_DIGITO_BANCO'
          DataSource = dsCedente
          TabOrder = 1
        end
      end
      object GroupBox2: TGroupBox
        Left = 8
        Top = 206
        Width = 537
        Height = 147
        Caption = '[ Endere'#231'o de cedente ]'
        TabOrder = 3
        object Label3: TLabel
          Left = 9
          Top = 16
          Width = 46
          Height = 13
          Caption = 'Endere'#231'o'
          FocusControl = DBEdit10
          Transparent = True
        end
        object Label4: TLabel
          Left = 408
          Top = 16
          Width = 37
          Height = 13
          Caption = 'N'#250'mero'
          FocusControl = DBEdit11
          Transparent = True
        end
        object Label6: TLabel
          Left = 8
          Top = 56
          Width = 64
          Height = 13
          Caption = 'Complemento'
          FocusControl = DBEdit12
          Transparent = True
        end
        object Label8: TLabel
          Left = 264
          Top = 56
          Width = 27
          Height = 13
          Caption = 'Bairro'
          FocusControl = DBEdit13
          Transparent = True
        end
        object Label11: TLabel
          Left = 8
          Top = 96
          Width = 33
          Height = 13
          Caption = 'Cidade'
          FocusControl = DBEdit14
          Transparent = True
        end
        object Label12: TLabel
          Left = 349
          Top = 96
          Width = 14
          Height = 13
          Caption = 'UF'
          Transparent = True
        end
        object Label14: TLabel
          Left = 419
          Top = 96
          Width = 21
          Height = 13
          Caption = 'CEP'
          FocusControl = DBEdit16
          Transparent = True
        end
        object DBEdit10: TDBEdit
          Left = 9
          Top = 32
          Width = 392
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CED_ENDERECO'
          DataSource = dsCedente
          TabOrder = 0
        end
        object DBEdit11: TDBEdit
          Left = 408
          Top = 32
          Width = 118
          Height = 21
          DataField = 'CED_NUMERO'
          DataSource = dsCedente
          TabOrder = 1
        end
        object DBEdit12: TDBEdit
          Left = 8
          Top = 72
          Width = 244
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CED_COMPLEMENTO'
          DataSource = dsCedente
          TabOrder = 2
        end
        object DBEdit13: TDBEdit
          Left = 264
          Top = 72
          Width = 264
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CED_BAIRRO'
          DataSource = dsCedente
          TabOrder = 3
        end
        object DBEdit14: TDBEdit
          Left = 8
          Top = 112
          Width = 330
          Height = 21
          CharCase = ecUpperCase
          DataField = 'CED_CIDADE'
          DataSource = dsCedente
          TabOrder = 4
        end
        object DBEdit16: TDBEdit
          Left = 419
          Top = 112
          Width = 108
          Height = 21
          DataField = 'CED_CEP'
          DataSource = dsCedente
          TabOrder = 6
        end
        object DBComboBox2: TDBComboBox
          Left = 349
          Top = 112
          Width = 62
          Height = 22
          Style = csOwnerDrawFixed
          DataField = 'FUN_UFIDEN'
          ItemHeight = 16
          Items.Strings = (
            'AC'
            'AL'
            'AM'
            'AP'
            'BA'
            'CE'
            'DF'
            'ES'
            'GO'
            'MA'
            'MG'
            'MS'
            'MT'
            'PA'
            'PE'
            'PR'
            'PI'
            'RJ'
            'RN'
            'RO'
            'RR'
            'RS'
            'SC'
            'SE'
            'SP'
            'TO')
          TabOrder = 5
        end
      end
    end
    inherited TabSheet2: TTabSheet
      inherited Panel2: TPanel
        Width = 574
      end
      inherited grdConsultar: TDBGrid
        Width = 540
        Height = 318
        DataSource = dsConsultar
        Columns = <
          item
            Expanded = False
            FieldName = 'CED_CODIGO'
            Title.Caption = 'CODIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CED_NOME'
            Title.Caption = 'CEDENTE'
            Width = 429
            Visible = True
          end>
      end
      inherited Panel3: TPanel
        Left = 540
        Height = 318
      end
    end
  end
  inherited Panel4: TPanel
    Width = 582
  end
  inherited dsConsultar: TDataSource
    Left = 308
    Top = 66
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select CED_CODIGO, CED_NOME from CEDENTE'
    MaxBlobSize = -1
    SQLConnection = dmBoleto.sqlConnBoleto
    Left = 348
    Top = 66
  end
  inherited dspConsultar: TDataSetProvider
    Left = 420
    Top = 66
  end
  inherited cdsConsultar: TClientDataSet
    Left = 492
    Top = 66
    object cdsConsultarCED_CODIGO: TIntegerField
      FieldName = 'CED_CODIGO'
      Required = True
      DisplayFormat = '000'
    end
    object cdsConsultarCED_NOME: TStringField
      FieldName = 'CED_NOME'
      Size = 50
    end
  end
  object dsCedente: TDataSource
    AutoEdit = False
    DataSet = dmBoleto.cdsCedente
    Left = 264
    Top = 72
  end
end
