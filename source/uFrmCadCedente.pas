unit uFrmCadCedente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, Mask, DBCtrls, DBClient, Provider, DB,
  SqlExpr, Buttons, Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls;

type
  TfrmCadCedente = class(TfrmCadastro)
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    dbeNMCEDE: TDBEdit;
    dsCedente: TDataSource;
    cdsConsultarCED_CODIGO: TIntegerField;
    cdsConsultarCED_NOME: TStringField;
    GroupBox1: TGroupBox;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label7: TLabel;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    Label10: TLabel;
    Label13: TLabel;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    DBEdit10: TDBEdit;
    Label4: TLabel;
    DBEdit11: TDBEdit;
    Label6: TLabel;
    DBEdit12: TDBEdit;
    Label8: TLabel;
    DBEdit13: TDBEdit;
    Label11: TLabel;
    DBEdit14: TDBEdit;
    Label12: TLabel;
    Label14: TLabel;
    DBEdit16: TDBEdit;
    DBComboBox2: TDBComboBox;
    DBEdit15: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
  private
     procedure tratabotoes;
     procedure buscar;
     procedure REGISTRO;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadCedente: TfrmCadCedente;

implementation

uses udmBoleto, uFuncoes;

{$R *.dfm}

{ TfrmCadCedente }

procedure TfrmCadCedente.buscar;
begin
     With dmBoleto.cdsCedente  do
     begin
          Close;
          Params.ParamByName('pCODIGO').AsInteger  := cdsConsultar.FieldByName('CED_CODIGO').AsInteger;
          Open;
     End;
end;

procedure TfrmCadCedente.REGISTRO;
begin
     dmBoleto.parametros;
     If (dmBoleto.cdsConfigCFG_CEDENTE.AsInteger  = 0) Then
         dmBoleto.cdsCedente.Open
     Else
     Begin
          With dmBoleto.cdsCedente do
            begin
                  Close;
                  Params.ParamByName('pCODIGO').AsInteger  := dmBoleto.mvcodigo('CED_CODIGO','CEDENTE');
                  Open;
            End;
     End;
end;

procedure TfrmCadCedente.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadCedente.FormShow(Sender: TObject);
begin
  inherited;
     REGISTRO;
     //
     If (dmBoleto.cdsCedente.IsEmpty) Then
          BtAdicionarClick(Sender);
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadCedente.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
      dmBoleto.cdsCedente.Close;
      //
      Action := caFree;
end;

procedure TfrmCadCedente.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dmBoleto.parametros;
  dmBoleto.cdsCedente.Append;
  dmBoleto.cdsCedente.FieldByName('CED_CODIGO').AsInteger :=
    dmBoleto.cdsConfigCFG_CEDENTE.AsInteger + 1;
  dbeNMCEDE.SetFocus;
end;

procedure TfrmCadCedente.BtEditarClick(Sender: TObject);
begin
  inherited;
  if  not (dmBoleto.cdsCedente.IsEmpty)
    and (dmBoleto.cdsCedente.RecordCount > 0) then
  Begin
       tratabotoes;
       dmBoleto.cdsCedente.Edit;
       dbeNMCEDE.SetFocus;
  End;
end;

procedure TfrmCadCedente.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if not (dmBoleto.cdsCedente.IsEmpty) and
     (dmBoleto.cdsCedente.RecordCount > 0) then
   begin
       If Application.MessageBox('Deseja excluir este cedente', 'Exclusão de cedente',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       Begin
            dmBoleto.cdsCedente.Delete;
            dmBoleto.cdsCedente.ApplyUpdates(0);
            //
            REGISTRO;
       end
       else
            Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
   End;
end;

procedure TfrmCadCedente.BtCancelarClick(Sender: TObject);
begin
  inherited;
     tratabotoes;
     dmBoleto.cdsCedente.Cancel;
end;

procedure TfrmCadCedente.BtGravarClick(Sender: TObject);
begin
  inherited;
     If uFuncoes.Empty(dbeNMCEDE.Text) Then
       Begin
           Application.MessageBox('Digite o nome do cedente.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeNMCEDE.SetFocus;
           Exit;
       End;
     //
     try
          tratabotoes;
          //
          if (dmBoleto.cdsCedente.State in [dsinsert]) then
            begin
                 dmBoleto.parametros;
                 dmBoleto.CdsConfig.Edit;
                 dmBoleto.cdsConfig.FieldByName('CFG_CEDENTE').AsInteger :=
                      dmBoleto.cdsConfig.FieldByName('CFG_CEDENTE').AsInteger + 1;
                 dmBoleto.cdsCedente.FieldByName('CED_CODIGO').AsInteger :=
                      dmBoleto.cdsConfig.FieldByName('CFG_CEDENTE').AsInteger;
                 dmBoleto.CdsConfig.ApplyUpdates(0);
             end;
          //
          dmBoleto.cdsCedente.ApplyUpdates(0);
          //
     Except
          on Exc:Exception do
            begin
               Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               dmBoleto.cdsClientes.Cancel;
            End;
     End;
end;

procedure TfrmCadCedente.btnAlterarClick(Sender: TObject);
begin
  inherited;
       buscar;
       PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadCedente.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := 'Select CED_CODIGO, CED_NOME from CEDENTE';
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (CED_CODIGO = :pCODIGO)';
                1: CommandText := CommandText + ' Where (UPPER(CED_NOME) like :pNOME)';
            end;
            CommandText := CommandText + ' order by CED_NOME';
            case rgConsultar.ItemIndex of
                0: datasetConsultar.Params.ParamByName('pCODIGO').AsInteger := StrtoInt(edtConsultar.Text);
                1: datasetConsultar.Params.ParamByName('pNOME').AsString   := edtConsultar.Text + '%';
            end;
            Active := True;
        end;
        cdsConsultar.FetchParams;
        cdsConsultar.Open;
   End;
end;

end.
