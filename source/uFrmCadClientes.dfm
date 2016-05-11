inherited frmCadClientes: TfrmCadClientes
  Left = 205
  Top = 103
  Caption = 'Cadastro de Clientes'
  ClientHeight = 368
  OldCreateOrder = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  inherited PageControl1: TPageControl
    Height = 339
    ActivePage = TabSheet2
    inherited TabSheet1: TTabSheet
      object Label1: TLabel [0]
        Left = 9
        Top = 12
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
        Transparent = True
      end
      object DBText1: TDBText [1]
        Left = 9
        Top = 29
        Width = 80
        Height = 22
        AutoSize = True
        DataField = 'CLI_CODIGO'
        DataSource = dsClientes
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
        Top = 56
        Width = 28
        Height = 13
        Caption = 'Nome'
        FocusControl = dbeNMCLIE
        Transparent = True
      end
      object Label3: TLabel [3]
        Left = 8
        Top = 98
        Width = 57
        Height = 13
        Caption = 'Logo Marca'
        FocusControl = dbimgLogo
        Transparent = True
      end
      inherited Panel1: TPanel
        Top = 270
      end
      object dbeNMCLIE: TDBEdit
        Left = 9
        Top = 72
        Width = 425
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CLI_NOME'
        DataSource = dsClientes
        TabOrder = 1
      end
      object dbimgLogo: TDBImage
        Left = 8
        Top = 114
        Width = 185
        Height = 105
        DataField = 'CLI_FOTO'
        DataSource = dsClientes
        Stretch = True
        TabOrder = 2
      end
      object btLogo: TBitBtn
        Left = 59
        Top = 224
        Width = 75
        Height = 25
        Hint = 'Procurar logo marca'
        Caption = '&Logo...'
        Enabled = False
        TabOrder = 3
        OnClick = btLogoClick
        Glyph.Data = {
          F6040000424DF604000000000000360000002800000015000000130000000100
          180000000000C004000000000000000000000000000000000000FEEDE0FEECDE
          FEEBDCFDE9DAFDE8D8FDE7D5FDE6D3FCE4D1FCE3CFFCE2CDFBE0CAFCE1CBF9DC
          C4F7D7BEF5D2B8F3CEB2F1C9ACEFC4A6ECC09FEABB99E8B69300FEEDE0FEECDE
          FEEBDCFDE8D8FDE7D5FDE6D3FCE4D1FCE3CFFCE2CDFBE0CAFCE1CBF9DCC4F7D7
          BEF5D2B8F3CEB2F1C9ACEFC4A6ECC09FEABB99EABB99E8B69300FEEDE0FEECDE
          FEEBDCFDE8D8FDE7D5FDE6D3FCE4D1FCE3CFFCE2CDFBE0CAFCE1CBF9DCC4F7D7
          BEF5D2B8F3CEB2F1C9ACEFC4A6ECC09FEABB99EABB99E8B69300FEEDE0FEECDE
          FEEBDCFDE8D8B08060B08060B08060D5B197A070508048308048208040208040
          20804020803810803810803010703010703010EABB99E8B69300FEEDE0FEECDE
          FEEBDCFDE8D8FDE7D5FDE6D3FCE4D1FCE3CFA07060FFE8F0D0A890C09880C090
          80A08070907860806850503830504840703010EABB99E8B69300FEEDE0FEECDE
          FEEBDCB08060B08060D6B299A070508048308048208040208040208040208038
          10803810803010703010703010403830803010EABB99E8B69300FEEDE0FEECDE
          FEEBDCFDE8D8FDE7D5FDE6D3A07060FFE8F0D0A890C09880C09080A080709078
          60806850503830504840703010504040803810EABB99E8B69300FEEDE0FEECDE
          FEEBDCFDE8D8B08870D6B299A07860FFE8F0FFF8FFF0D8D0E0B0A0D09880C098
          80503830A08870403830803010F0C0A0803810EABB99E8B69300FEEDE0FEECDE
          FEEBDCFDE8D8FDE7D5F9E0CCB08060B0A090FFF8FFF0D8D0E0B0A0D0A8907058
          50C0B8B0706860504040803810F0C0B0804020EABB99E8B69300FEEDE0FEECDE
          FEEBDCC08870B08060D6B299B08870F0E0E0B09890FFF0F0F0D8D0705840A088
          80A09080503830F0C0A0803810F0C8C0804020EABB99E8B69300FEEDE0FEECDE
          FEEBDCFDE8D8FDE7D5FDE6D3B09070FFFFFFE0D8D0B09890A08880C0A8A0C0A8
          A0C0A8A0FFD8D0F0C0B0804020F0D0C0804020EABB99E8B69300FEEDE0FEECDE
          FEEBDCFDE8D8B08870D6B299C09880FFFFFFFFFFFFE0E0D0F0D8D0E0E0F05068
          D03058D0D0C0D0F0C8C0804020F0D8D0804820EABB99E8B69300FEEDE0FEECDE
          FEEBDCFDE8D8FDE7D5F9E0CCC0A080FFFFFFFFFFFFFFFFFFFFFFFF6070D050A0
          F02078D03048C0F0D0C0804020FFF0F0804830EABB99E8B69300FEEDE0FEECDE
          FEEBDCC08870B08060D6B299C0A090FFFFFFFFF8FFFFF8FFFFFFFF9098D090C0
          F050A8F06070C0F0D8D0804820A07060A07050EABB99E8B69300FEEDE0FEECDE
          FEEBDCFDE8D8FDE7D5FDE6D3C0A890FFFFFFFFFFFFFFFFFFFFFFFFE0E8F0A0A8
          E09098D0F0E8F0FFF0F0804830ECC09FEABB99EABB99E8B69300FEEDE0FEECDE
          FEEBDCFDE8D8FDE7D5FDE6D3D0A890C0A890C0A090C0A080C09880B09070B088
          70B08060A07860A07060A07050ECC09FEABB99EABB99E8B69300FEEDE0FEECDE
          FEEBDCFDE8D8FDE7D5FDE6D3FCE4D1FCE3CFFCE2CDFBE0CAFCE1CBF9DCC4F7D7
          BEF5D2B8F3CEB2F1C9ACEFC4A6ECC09FEABB99EABB99E8B69300FEEDE0FEECDE
          FEEBDCFDE9DAFDE8D8FDE7D5FDE6D3FCE4D1FCE3CFFCE2CDFBE0CAFCE1CBF9DC
          C4F7D7BEF5D2B8F3CEB2F1C9ACEFC4A6ECC09FEABB99E8B69300FEEDE0FEECDE
          FEEBDCFDE9DAFDE8D8FDE7D5FDE6D3FCE4D1FCE3CFFCE2CDFBE0CAFCE1CBF9DC
          C4F7D7BEF5D2B8F3CEB2F1C9ACEFC4A6ECC09FEABB99E8B69300}
      end
    end
    inherited TabSheet2: TTabSheet
      inherited grdConsultar: TDBGrid
        Height = 252
        DataSource = dsConsultar
        Columns = <
          item
            Expanded = False
            FieldName = 'CLI_CODIGO'
            Title.Caption = 'CODIGO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLI_NOME'
            Title.Caption = 'NOME'
            Width = 435
            Visible = True
          end>
      end
      inherited Panel3: TPanel
        Height = 252
      end
    end
  end
  inherited dsConsultar: TDataSource
    Left = 284
    Top = 234
  end
  inherited datasetConsultar: TSQLDataSet
    CommandText = 'select CLI_CODIGO, CLI_NOME from CLIENTES'
    MaxBlobSize = -1
    SQLConnection = dmBoleto.sqlConnBoleto
    Left = 316
    Top = 234
  end
  inherited dspConsultar: TDataSetProvider
    Left = 356
    Top = 234
  end
  inherited cdsConsultar: TClientDataSet
    Left = 388
    Top = 226
    object cdsConsultarCLI_CODIGO: TIntegerField
      FieldName = 'CLI_CODIGO'
      Required = True
      DisplayFormat = '0000000'
    end
    object cdsConsultarCLI_NOME: TStringField
      FieldName = 'CLI_NOME'
      Size = 50
    end
  end
  object dsClientes: TDataSource
    AutoEdit = False
    DataSet = dmBoleto.cdsClientes
    Left = 232
    Top = 80
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Filter = 'Bitmaps (*.bmp)|*.bmp'
    Left = 308
    Top = 78
  end
end
