unit uFrmCadClientes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, uFrmCadastro, FMTBcd, DBClient, Provider, DB, SqlExpr, Buttons,
  Grids, DBGrids, StdCtrls, ExtCtrls, ComCtrls, DBCtrls, Mask, ExtDlgs;

type
  TfrmCadClientes = class(TfrmCadastro)
    Label1: TLabel;
    DBText1: TDBText;
    Label2: TLabel;
    dbeNMCLIE: TDBEdit;
    dsClientes: TDataSource;
    Label3: TLabel;
    dbimgLogo: TDBImage;
    btLogo: TBitBtn;
    OpenPictureDialog1: TOpenPictureDialog;
    cdsConsultarCLI_CODIGO: TIntegerField;
    cdsConsultarCLI_NOME: TStringField;
    procedure btLogoClick(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grdConsultarDblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     procedure tratabotoes;
     procedure buscar;
     procedure REGISTRO;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadClientes: TfrmCadClientes;

implementation

uses udmBoleto, uFuncoes;

{$R *.dfm}

procedure TfrmCadClientes.btLogoClick(Sender: TObject);
begin
  inherited;
     Try
          If (OpenPictureDialog1.Execute) Then
             dbimgLogo.Picture.LoadFromFile(OpenPictureDialog1.FileName);
     Except
        on Exc:Exception do
        begin
           Application.MessageBox(PChar('Error ao tentar abrir foto!!!'+#13
                      + Exc.Message),
                      'ATENÇÃO', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
        End;
     End;

end;

procedure TfrmCadClientes.buscar;
begin
     With dmBoleto.cdsClientes  do
     begin
          Close;
          Params.ParamByName('pCODIGO').AsInteger  := cdsConsultar.FieldByName('CLI_CODIGO').AsInteger;
          Open;
     End;
end;

procedure TfrmCadClientes.REGISTRO;
begin
     dmBoleto.parametros;
     If (dmBoleto.cdsConfigCFG_CLIENTE.AsInteger  = 0) Then
         dmBoleto.cdsClientes.Open
     Else
     Begin
          With dmBoleto.cdsClientes do
            begin
                  Close;
                  Params.ParamByName('pCODIGO').AsInteger  := dmBoleto.mvcodigo('CLI_CODIGO','CLIENTES');
                  Open;
            End;
     End;
end;

procedure TfrmCadClientes.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
   btLogo.Enabled := not btLogo.Enabled;
end;

procedure TfrmCadClientes.BtAdicionarClick(Sender: TObject);
begin
  inherited;
  tratabotoes;
  dmBoleto.parametros;
  dmBoleto.cdsClientes.Append;
  dmBoleto.cdsClientes.FieldByName('CLI_CODIGO').AsInteger :=
    dmBoleto.cdsConfigCFG_CLIENTE.AsInteger + 1;
  dbeNMCLIE.SetFocus;
end;

procedure TfrmCadClientes.BtCancelarClick(Sender: TObject);
begin
  inherited;
     tratabotoes; 
     dmBoleto.cdsClientes.Cancel;
end;

procedure TfrmCadClientes.BtEditarClick(Sender: TObject);
begin
  inherited;
  if  not (dmBoleto.cdsClientes.IsEmpty)
    and (dmBoleto.cdsClientes.RecordCount > 0) then
  Begin
       tratabotoes;
       dmBoleto.cdsClientes.Edit;
       dbeNMCLIE.SetFocus;
  End;
end;

procedure TfrmCadClientes.BtExcluirClick(Sender: TObject);
begin
  inherited;
  if not (dmBoleto.cdsClientes.IsEmpty) and
     (dmBoleto.cdsClientes.RecordCount > 0) then
   begin
       If Application.MessageBox('Deseja excluir este cliente', 'Exclusão de cliente',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       Begin
            dmBoleto.cdsClientes.Delete;
            dmBoleto.cdsClientes.ApplyUpdates(0);
            //
            REGISTRO;
       end
       else
            Application.MessageBox('Não ha registro a ser excluido','ATENÇÃO',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
   End;
end;

procedure TfrmCadClientes.BtGravarClick(Sender: TObject);
begin
  inherited;
     If uFuncoes.Empty(dbeNMCLIE.Text) Then
       Begin
           Application.MessageBox('Digite o nome do cliente.','ATENÇÃO',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeNMCLIE.SetFocus;
           Exit;
       End;
     //
     try
          tratabotoes;
          //
          if (dmBoleto.cdsClientes.State in [dsinsert]) then
            begin
                 dmBoleto.parametros;
                 dmBoleto.CdsConfig.Edit;
                 dmBoleto.cdsConfig.FieldByName('CFG_CLIENTE').AsInteger :=
                      dmBoleto.cdsConfig.FieldByName('CFG_CLIENTE').AsInteger + 1;
                 dmBoleto.cdsClientes.FieldByName('CLI_CODIGO').AsInteger :=
                      dmBoleto.cdsConfig.FieldByName('CFG_CLIENTE').AsInteger;
                 dmBoleto.CdsConfig.ApplyUpdates(0);
             end;
          //
          dmBoleto.cdsClientes.ApplyUpdates(0);
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

procedure TfrmCadClientes.btnAlterarClick(Sender: TObject);
begin
  inherited;
       buscar;
       PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadClientes.edtConsultarChange(Sender: TObject);
begin
  inherited;
  If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := 'Select CLI_CODIGO, CLI_NOME from CLIENTES';
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (CLI_CODIGO = :pCODIGO)';
                1: CommandText := CommandText + ' Where (UPPER(CLI_NOME) like :pNOME)';
            end;
            CommandText := CommandText + ' order by CLI_NOME';
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

procedure TfrmCadClientes.FormShow(Sender: TObject);
begin
  inherited;
     REGISTRO;
     //
     If (dmBoleto.cdsClientes.IsEmpty) Then
          BtAdicionarClick(Sender);
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadClientes.grdConsultarDblClick(Sender: TObject);
begin
  inherited;
     If not (cdsConsultar.IsEmpty) Then
         btnAlterarClick(Sender);
end;

procedure TfrmCadClientes.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
      dmBoleto.cdsClientes.Close; 
      //
      Action := caFree;
end;

end.
