program InfoBoleto;

uses
  Forms,
  uFrmPrincBoleto in 'uFrmPrincBoleto.pas' {frmPrincBoleto},
  uFrmCadastro in 'uFrmCadastro.pas' {frmCadastro},
  uFuncoes in 'uFuncoes.pas',
  udmBoleto in 'udmBoleto.pas' {dmBoleto: TDataModule},
  uFrmCadCedente in 'uFrmCadCedente.pas' {frmCadCedente},
  uFrmCadTitulos in 'uFrmCadTitulos.pas' {frmCadTitulos},
  udmConsulta in 'udmConsulta.pas' {dmConsultas: TDataModule},
  uBoletoPersonalizado in 'uBoletoPersonalizado.pas' {repBoletoPersonalizado: TQuickRep};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TdmBoleto, dmBoleto);
  Application.CreateForm(TdmConsultas, dmConsultas);
  Application.CreateForm(TfrmPrincBoleto, frmPrincBoleto);
  Application.CreateForm(TrepBoletoPersonalizado, repBoletoPersonalizado);
  Application.Run;
end.
