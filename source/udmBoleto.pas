unit udmBoleto;

interface

uses
  SysUtils, Classes, DBXpress, DB, SqlExpr, FMTBcd, Provider, DBClient;

type
  TdmBoleto = class(TDataModule)
    sqlConnBoleto: TSQLConnection;
    dstConfig: TSQLDataSet;
    dspConfig: TDataSetProvider;
    cdsConfig: TClientDataSet;
    dstConfigCFG_CLIENTE: TIntegerField;
    dstConfigCFG_BOLETO: TIntegerField;
    cdsConfigCFG_CLIENTE: TIntegerField;
    cdsConfigCFG_BOLETO: TIntegerField;
    dsConfig: TDataSource;
    dstCedente: TSQLDataSet;
    dstCedenteCED_CODIGO: TIntegerField;
    dstCedenteCED_NOME: TStringField;
    dstCedenteCED_CDCEDENTE: TStringField;
    dstCedenteCED_DIGITOCODIGO: TStringField;
    dstCedenteCED_CDBANCO: TStringField;
    dstCedenteCED_NOME_BANCO: TStringField;
    dstCedenteCED_CDAGENCIA: TStringField;
    dstCedenteCED_DIGITO_AGENCIA: TStringField;
    dstCedenteCED_NRCOTA: TStringField;
    dstCedenteCED_DIGITO_NRCOTA: TStringField;
    dstCedenteCED_CARTEIRA: TStringField;
    dstCedenteCED_ENDERECO: TStringField;
    dstCedenteCED_NUMERO: TIntegerField;
    dstCedenteCED_COMPLEMENTO: TStringField;
    dstCedenteCED_BAIRRO: TStringField;
    dstCedenteCED_CIDADE: TStringField;
    dstCedenteCED_UF: TStringField;
    dstCedenteCED_CEP: TStringField;
    dspCedente: TDataSetProvider;
    cdsCedente: TClientDataSet;
    cdsCedenteCED_CODIGO: TIntegerField;
    cdsCedenteCED_NOME: TStringField;
    cdsCedenteCED_CDCEDENTE: TStringField;
    cdsCedenteCED_DIGITOCODIGO: TStringField;
    cdsCedenteCED_CDBANCO: TStringField;
    cdsCedenteCED_NOME_BANCO: TStringField;
    cdsCedenteCED_CDAGENCIA: TStringField;
    cdsCedenteCED_DIGITO_AGENCIA: TStringField;
    cdsCedenteCED_NRCOTA: TStringField;
    cdsCedenteCED_DIGITO_NRCOTA: TStringField;
    cdsCedenteCED_CARTEIRA: TStringField;
    cdsCedenteCED_ENDERECO: TStringField;
    cdsCedenteCED_NUMERO: TIntegerField;
    cdsCedenteCED_COMPLEMENTO: TStringField;
    cdsCedenteCED_BAIRRO: TStringField;
    cdsCedenteCED_CIDADE: TStringField;
    cdsCedenteCED_UF: TStringField;
    cdsCedenteCED_CEP: TStringField;
    dstConfigCFG_CEDENTE: TIntegerField;
    cdsConfigCFG_CEDENTE: TIntegerField;
    dstConfigCFG_CREDITO: TIntegerField;
    cdsConfigCFG_CREDITO: TIntegerField;
    dstContasReceber: TSQLDataSet;
    dspContasReceber: TDataSetProvider;
    cdsContasReceber: TClientDataSet;
    dstContasReceberREC_CREDITO: TIntegerField;
    dstContasReceberREC_CEDENTE: TIntegerField;
    dstContasReceberREC_CLIENTE: TIntegerField;
    dstContasReceberREC_DTDOCUMENTO: TDateField;
    dstContasReceberREC_DTVENCIMENTO: TDateField;
    dstContasReceberREC_DTRECEBIMENTO: TDateField;
    dstContasReceberREC_DTCREDITO: TDateField;
    dstContasReceberREC_NOSSONUMERO: TStringField;
    dstContasReceberREC_VLDOCUMENTO: TFMTBCDField;
    dstContasReceberREC_VLDESCONTO: TFMTBCDField;
    dstContasReceberREC_VLABATIMENTO: TFMTBCDField;
    dstContasReceberREC_VLMORA: TFMTBCDField;
    dstContasReceberREC_VLDESPESACOBRANCA: TFMTBCDField;
    dstContasReceberREC_OBSERVACAO: TMemoField;
    dstContasReceberREC_USUARIO: TIntegerField;
    cdsContasReceberREC_CREDITO: TIntegerField;
    cdsContasReceberREC_CEDENTE: TIntegerField;
    cdsContasReceberREC_CLIENTE: TIntegerField;
    cdsContasReceberREC_DTDOCUMENTO: TDateField;
    cdsContasReceberREC_DTVENCIMENTO: TDateField;
    cdsContasReceberREC_DTRECEBIMENTO: TDateField;
    cdsContasReceberREC_DTCREDITO: TDateField;
    cdsContasReceberREC_NOSSONUMERO: TStringField;
    cdsContasReceberREC_VLDOCUMENTO: TFMTBCDField;
    cdsContasReceberREC_VLDESCONTO: TFMTBCDField;
    cdsContasReceberREC_VLABATIMENTO: TFMTBCDField;
    cdsContasReceberREC_VLMORA: TFMTBCDField;
    cdsContasReceberREC_VLDESPESACOBRANCA: TFMTBCDField;
    cdsContasReceberREC_OBSERVACAO: TMemoField;
    cdsContasReceberREC_USUARIO: TIntegerField;
    cdsContasReceberREC_NMCEDENTE: TStringField;
    dsParcelas: TDataSource;
    dstConfigCFG_MENS_BOLETO: TMemoField;
    cdsConfigCFG_MENS_BOLETO: TMemoField;
    dstConfigCFG_LOCAL_PAGAMENTO: TStringField;
    cdsConfigCFG_LOCAL_PAGAMENTO: TStringField;
    dstCedenteCED_DIGITO_BANCO: TStringField;
    cdsCedenteCED_DIGITO_BANCO: TStringField;
    spIncParcelas: TSQLStoredProc;
    spUpdateParcelas: TSQLStoredProc;
    dstParcelas: TSQLDataSet;
    dspParcelas: TDataSetProvider;
    cdsRecParcelas: TClientDataSet;
    cdsRecParcelasPAR_SEQUECIA: TIntegerField;
    cdsRecParcelasPAR_CREDITO: TIntegerField;
    cdsRecParcelasPAR_OPCAO: TIntegerField;
    cdsRecParcelasPAR_VLENTRADA: TFMTBCDField;
    cdsRecParcelasPAR_NRPARCELAS: TIntegerField;
    cdsRecParcelasPAR_VLPARCELA: TFMTBCDField;
    cdsParcelas: TClientDataSet;
    cdsParcelasPAR_SEQUE: TIntegerField;
    cdsParcelasPAR_CREDITO: TIntegerField;
    cdsParcelasPAR_OPCAO: TIntegerField;
    cdsParcelasPAR_VLENTRADA: TCurrencyField;
    cdsParcelasPAR_NRPARCELAS: TIntegerField;
    cdsParcelasPAR_VLPARCELA: TCurrencyField;
    dstContasReceberREC_OBSERVACAO2: TMemoField;
    cdsContasReceberREC_OBSERVACAO2: TMemoField;
    dstContasReceberREC_NMSACADO: TStringField;
    cdsContasReceberREC_NMSACADO: TStringField;
    dstContasReceberREC_CPFCNPJ: TStringField;
    dstContasReceberREC_ENDERECO_SACADO: TStringField;
    dstContasReceberREC_BAIRRO: TStringField;
    dstContasReceberREC_CIDADE: TStringField;
    dstContasReceberREC_CEP_SACADO: TStringField;
    dstContasReceberREC_UP_SACADO: TStringField;
    cdsContasReceberREC_CPFCNPJ: TStringField;
    cdsContasReceberREC_ENDERECO_SACADO: TStringField;
    cdsContasReceberREC_BAIRRO: TStringField;
    cdsContasReceberREC_CIDADE: TStringField;
    cdsContasReceberREC_CEP_SACADO: TStringField;
    cdsContasReceberREC_UP_SACADO: TStringField;
    dstClientes: TSQLDataSet;
    dstClientesCLI_CODIGO: TIntegerField;
    dstClientesCLI_NOME: TStringField;
    dstClientesCLI_FOTO: TBlobField;
    dspClientes: TDataSetProvider;
    cdsClientes: TClientDataSet;
    cdsClientesCLI_CODIGO: TIntegerField;
    cdsClientesCLI_NOME: TStringField;
    cdsClientesCLI_FOTO: TBlobField;
    procedure dspClientesGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspConfigGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
    procedure dspContasReceberGetTableName(Sender: TObject;
      DataSet: TDataSet; var TableName: String);
    procedure dspParcelasGetTableName(Sender: TObject; DataSet: TDataSet;
      var TableName: String);
  private
    { Private declarations }
  public
     function mscodigo(campo,tabela:string):string;
     function mvcodigo(campo,tabela:string):integer;
     Procedure parametros;
    { Public declarations }
  end;

var
  dmBoleto: TdmBoleto;

implementation

uses udmConsulta;

{$R *.dfm}

procedure TdmBoleto.dspClientesGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'CLIENTES';
end;

function TdmBoleto.mscodigo(campo, tabela: string): string;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select min('+campo+') from '+tabela;
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := sqlConnBoleto;
      sql.Add(texto);
      open;
      result := fields[0].AsString;
    finally
      free;
    end;
end;

function TdmBoleto.mvcodigo(campo, tabela: string): integer;
var qraux : TSQLquery;
    texto : string;
begin
  texto := 'Select min('+campo+') from '+tabela;
  QrAux := TSqlquery.Create(nil);
  with QrAux do
    try
      SQLConnection := sqlConnBoleto;
      sql.Add(texto);
      open;
      result := fields[0].AsInteger;
    finally
      free;
    end;
end;

procedure TdmBoleto.parametros;
begin
     cdsConfig.Close;
     cdsConfig.Open;
end;

procedure TdmBoleto.dspConfigGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
      TableName := 'PARAMENTOS';
end;

procedure TdmBoleto.dspContasReceberGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
     TableName := 'CONTASRECEBER';
end;

procedure TdmBoleto.dspParcelasGetTableName(Sender: TObject;
  DataSet: TDataSet; var TableName: String);
begin
      TableName := 'PARCELAS';
end;

end.
