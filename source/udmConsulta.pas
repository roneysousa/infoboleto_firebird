unit udmConsulta;

interface

uses
  SysUtils, Classes, FMTBcd, DBClient, Provider, DB, SqlExpr;

type
  TdmConsultas = class(TDataModule)
    dstCedentes: TSQLDataSet;
    dspCedentes: TDataSetProvider;
    cdsCedentes: TClientDataSet;
    cdsCedentesCED_CODIGO: TIntegerField;
    cdsCedentesCED_NOME: TStringField;
    qryConsulta: TSQLQuery;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CEDENTES;
  end;

var
  dmConsultas: TdmConsultas;

implementation

uses udmBoleto;

{$R *.dfm}

{ TdmConsultas }

procedure TdmConsultas.CEDENTES;
begin
     cdsCedentes.Close;
     cdsCedentes.Open;     
end;

end.
