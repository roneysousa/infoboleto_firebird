unit uFrmCadTitulos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, DB, Mask, DBCtrls,
  ToolEdit, RXDBCtrl, FMTBcd, DBClient, Provider, SqlExpr, Grids, DBGrids,
  gbCobranca, DBXpress;

type
  TfrmCadTitulos = class(TForm)
    Panel4: TPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    BtAdicionar: TBitBtn;
    BtEditar: TBitBtn;
    BtExcluir: TBitBtn;
    BtPesquisar: TBitBtn;
    BtCancelar: TBitBtn;
    BtGravar: TBitBtn;
    BtSair: TBitBtn;
    Label1: TLabel;
    DBText1: TDBText;
    dsReceber: TDataSource;
    Label2: TLabel;
    cmbCedente: TDBLookupComboBox;
    Label4: TLabel;
    dbeDTDOCU: TDBDateEdit;
    dbeDTVENC: TDBDateEdit;
    Label5: TLabel;
    Label19: TLabel;
    dbeNossoNumero: TDBEdit;
    dbeVLDOCU: TDBEdit;
    dbeVLDESC: TDBEdit;
    dbeVLABAT: TDBEdit;
    dbeJUROS: TDBEdit;
    dbeVLDESP: TDBEdit;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    lblValorDespesaCobranca: TLabel;
    Label6: TLabel;
    DBMemo1: TDBMemo;
    dsConsultar: TDataSource;
    datasetConsultar: TSQLDataSet;
    dspConsultar: TDataSetProvider;
    cdsConsultar: TClientDataSet;
    cdsConsultarREC_CREDITO: TIntegerField;
    cdsConsultarREC_DTDOCUMENTO: TDateField;
    cdsConsultarREC_DTVENCIMENTO: TDateField;
    cdsConsultarREC_DTRECEBIMENTO: TDateField;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel5: TPanel;
    btIncluir: TBitBtn;
    btApagar: TBitBtn;
    grdConsultar: TDBGrid;
    Panel6: TPanel;
    Label7: TLabel;
    dbeVLENTR: TDBEdit;
    Label8: TLabel;
    dbeParcelas: TDBEdit;
    Label9: TLabel;
    dbeValor: TDBEdit;
    DBText2: TDBText;
    btConfirma: TBitBtn;
    TabSheet3: TTabSheet;
    Panel7: TPanel;
    lblConsultar: TLabel;
    rgConsultar: TRadioGroup;
    edtConsultar: TEdit;
    btnAlterar: TBitBtn;
    Panel8: TPanel;
    sbProximo: TSpeedButton;
    sbUltimo: TSpeedButton;
    sbAnterior: TSpeedButton;
    sbPrimeiro: TSpeedButton;
    DBGrid1: TDBGrid;
    edtDTINIC: TDateEdit;
    edtDTFINAL: TDateEdit;
    lbl_periodo: TLabel;
    btAlterar: TBitBtn;
    gbTitulo1: TgbTitulo;
    Label10: TLabel;
    mmoInstrucoes: TDBMemo;
    cdsConsultarREC_NMSACADO: TStringField;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    dbeNMSACA: TDBEdit;
    Label11: TLabel;
    dbeCPFCNJP: TDBEdit;
    Label12: TLabel;
    dbeEndereco: TDBEdit;
    Label14: TLabel;
    dbeCep: TDBEdit;
    Label18: TLabel;
    dbeBairro: TDBEdit;
    Label20: TLabel;
    dbeCidade: TDBEdit;
    cmbUF: TDBComboBox;
    Label21: TLabel;
    procedure BtSairClick(Sender: TObject);
    procedure dbeDTDOCUExit(Sender: TObject);
    procedure dbeDTVENCExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtEditarClick(Sender: TObject);
    procedure BtAdicionarClick(Sender: TObject);
    procedure BtExcluirClick(Sender: TObject);
    procedure BtCancelarClick(Sender: TObject);
    procedure BtGravarClick(Sender: TObject);
    procedure dbeNossoNumeroKeyPress(Sender: TObject; var Key: Char);
   procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbeNossoNumeroExit(Sender: TObject);
    procedure btIncluirClick(Sender: TObject);
    procedure btApagarClick(Sender: TObject);
    procedure btConfirmaClick(Sender: TObject);
    procedure dsConsultarDataChange(Sender: TObject; Field: TField);
    procedure dsConsultarStateChange(Sender: TObject);
    procedure btAlterarClick(Sender: TObject);
    procedure grdConsultarEnter(Sender: TObject);
    procedure BtPesquisarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure edtConsultarChange(Sender: TObject);
    procedure rgConsultarClick(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure edtConsultarKeyPress(Sender: TObject; var Key: Char);
    procedure edtDTFINALChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure TabSheet2Exit(Sender: TObject);
    procedure edtDTINICExit(Sender: TObject);
    procedure edtDTFINALExit(Sender: TObject);
    procedure sbPrimeiroClick(Sender: TObject);
    procedure sbAnteriorClick(Sender: TObject);
    procedure sbProximoClick(Sender: TObject);
    procedure sbUltimoClick(Sender: TObject);
  private
     procedure tratabotoes;
     procedure tratabotoes2;
     procedure buscar;
     procedure REGISTRO;
     procedure CEDENTE(M_CDCEDE : Integer);
     procedure PARCELAS(M_CDCEDE : Integer);
     procedure EXCLUIR_PARCELA(M_CDCEDE, M_NROPCA : Integer);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadTitulos: TfrmCadTitulos;
  M_NROPCA : Integer;

implementation

uses udmBoleto, uFuncoes, udmConsulta, uBoletoPersonalizado;

{$R *.dfm}

procedure TfrmCadTitulos.BtSairClick(Sender: TObject);
begin
      Close;
end;

procedure TfrmCadTitulos.buscar;
begin
     With dmBoleto.cdsContasReceber  do
     begin
          Close;
          Params.ParamByName('pCREDITO').AsInteger  := cdsConsultar.FieldByName('REC_CREDITO').AsInteger;
          Open;
          //
          PARCELAS(cdsConsultar.FieldByName('REC_CREDITO').AsInteger);
     End;
end;

procedure TfrmCadTitulos.dbeDTDOCUExit(Sender: TObject);
begin
     If (dmBoleto.cdsContasReceber.State in [dsInsert, dsEdit])
        and (dbeDTDOCU.Text <> '  /  /    ') Then
     Begin
        try
            StrToDate(dbeDTDOCU.Text);
            dbeDTDOCU.Date := StrToDate(dbeDTDOCU.Text);
        except
          on EConvertError do
          begin
             ShowMessage ('Data Inv�lida!');
             dbeDTDOCU.Date := Date();
             dbeDTDOCU.SetFocus;
             Exit;
          End;
        end;
     End;

end;

procedure TfrmCadTitulos.dbeDTVENCExit(Sender: TObject);
begin
     If (dmBoleto.cdsContasReceber.State in [dsInsert, dsEdit])
       and (dbeDTVENC.Text <> '  /  /    ') Then
     Begin
        try
            StrToDate(dbeDTVENC.Text);
            dbeDTVENC.Date := StrToDate(dbeDTVENC.Text);
            //
            If (dbeDTDOCU.Date > dbeDTVENC.Date) Then
            Begin
                Application.MessageBox(PChar('Coloque a data de vencimento maior que'+#13+
                                             'a data do documento.'),'ATEN��O',
                     MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
                dbeDTVENC.SetFocus;
                Exit;
            End;
        except
          on EConvertError do
          begin
             ShowMessage ('Data Inv�lida!');
             dbeDTVENC.Date := Date();
             dbeDTVENC.SetFocus;
             Exit;
          End;
        end;
     End;
end;

procedure TfrmCadTitulos.REGISTRO;
begin
     dmBoleto.parametros;
     If (dmBoleto.cdsConfigCFG_CREDITO.AsInteger  = 0) Then
         dmBoleto.cdsContasReceber.Open
     Else
     Begin
          With dmBoleto.cdsContasReceber do
            begin
                  Close;
                  Params.ParamByName('pCREDITO').AsInteger  := dmBoleto.mvcodigo('REC_CREDITO','CONTASRECEBER');
                  Open;
            End;
     End;
end;

procedure TfrmCadTitulos.tratabotoes;
begin
   BtAdicionar.Enabled := not BtAdicionar.Enabled;
   BtEditar.Enabled := not BtEditar.Enabled;
   BtExcluir.Enabled := not BtExcluir.Enabled;
   BtPesquisar.Enabled := not BtPesquisar.Enabled;
   BtCancelar.Enabled := not BtCancelar.Enabled;
   BtGravar.Enabled := not BtGravar.Enabled;
   BtSair.Enabled := not BtSair.Enabled;
end;

procedure TfrmCadTitulos.FormShow(Sender: TObject);
begin
     dmConsultas.CEDENTES;
     //dmConsultas.CLIENTES;
     //
     REGISTRO;
     //
     If (dmBoleto.cdsContasReceber.IsEmpty) Then
         BtAdicionarClick(Sender)
     else
         PARCELAS(dmBoleto.cdsContasReceberREC_CREDITO.AsInteger);
     //
     PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadTitulos.BtEditarClick(Sender: TObject);
begin
  if  not (dmBoleto.cdsContasReceber.IsEmpty)
    and (dmBoleto.cdsContasReceber.RecordCount > 0) then
  Begin
       tratabotoes;
       PageControl1.Pages[2].TabVisible := False;
       dmBoleto.cdsContasReceber.Edit;
       dbeNMSACA.SetFocus;
  End;

end;

procedure TfrmCadTitulos.BtAdicionarClick(Sender: TObject);
begin
    tratabotoes;
    PageControl1.Pages[2].TabVisible := False;
    dmBoleto.parametros;
    dmBoleto.cdsContasReceber.Append;
    dmBoleto.cdsContasReceber.FieldByName('REC_CREDITO').AsInteger :=
      dmBoleto.cdsConfigCFG_CREDITO.AsInteger + 1;
    //
    dmBoleto.cdsContasReceber.FieldByName('REC_DTDOCUMENTO').AsDateTime  := Date();
    dmBoleto.cdsContasReceber.FieldByName('REC_VLDESCONTO').AsCurrency   := 0;
    dmBoleto.cdsContasReceber.FieldByName('REC_VLABATIMENTO').AsCurrency := 0;
    dmBoleto.cdsContasReceber.FieldByName('REC_VLMORA').AsCurrency       := 0;
    dmBoleto.cdsContasReceber.FieldByName('REC_VLDESPESACOBRANCA').AsCurrency := 0;
    //
    PARCELAS(dmBoleto.cdsContasReceberREC_CREDITO.AsInteger);
    //
    M_NROPCA := 0;
    dbeNMSACA.SetFocus;
end;

procedure TfrmCadTitulos.BtExcluirClick(Sender: TObject);
begin
  if not (dmBoleto.cdsContasReceber.IsEmpty) and
     (dmBoleto.cdsContasReceber.RecordCount > 0) then
   begin
       If Application.MessageBox('Deseja excluir este titulo', 'Exclus�o de titulo',
                    MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = ID_YES Then
       Begin
            dmBoleto.cdsContasReceber.Delete;
            dmBoleto.cdsContasReceber.ApplyUpdates(0);
            //
            REGISTRO;
       end
       else
            Application.MessageBox('N�o ha registro a ser excluido','ATEN��O',
              MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
   End;
end;

procedure TfrmCadTitulos.BtCancelarClick(Sender: TObject);
begin
     tratabotoes;
     PageControl1.Pages[2].TabVisible := True;
     dmBoleto.cdsContasReceber.Cancel;
end;

procedure TfrmCadTitulos.BtGravarClick(Sender: TObject);
Var
     TD : TTransactionDesc;
begin
     If uFuncoes.Empty(cmbCedente.Text) Then
       Begin
           Application.MessageBox('Selecione o cedente.','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           cmbCedente.SetFocus;
           Exit;
       End;
     //
     If uFuncoes.Empty(dbeNMSACA.Text) Then
       Begin
           Application.MessageBox('Digite o nome do sacado.','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeNMSACA.SetFocus;
           Exit;
       End;
     //
     If uFuncoes.Empty(dbeCPFCNJP.Text) Then
       Begin
           Application.MessageBox('Digite o CPF do sacado.','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeCPFCNJP.SetFocus;
           Exit;
       End;
     //
     If uFuncoes.Empty(dbeEndereco.Text) Then
       Begin
           Application.MessageBox('Digite o endere�o do sacado.','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeEndereco.SetFocus;
           Exit;
       End;
     //
     If uFuncoes.Empty(dbeCep.Text) Then
       Begin
           Application.MessageBox('Digite o cep do sacado.','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeCep.SetFocus;
           Exit;
       End;
     //
     If uFuncoes.Empty(dbeBairro.Text) Then
       Begin
           Application.MessageBox('Digite o bairro do sacado.','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeBairro.SetFocus;
           Exit;
       End;
     //
     If uFuncoes.Empty(dbeCidade.Text) Then
       Begin
           Application.MessageBox('Digite a cidade do sacado.','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeCidade.SetFocus;
           Exit;
       End;
     //
     If uFuncoes.Empty(cmbUF.Text) Then
       Begin
           Application.MessageBox('Digite a UF do sacado.','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           cmbUF.SetFocus;
           Exit;
       End;
     //
     If (dbeDTDOCU.Text = '  /  /    ') Then
       Begin
           Application.MessageBox('Digite a data do documento.','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeDTDOCU.SetFocus;
           Exit;
       End;
     //
     If (dbeDTVENC.Text = '  /  /    ') Then
       Begin
           Application.MessageBox('Digite a data de vencimento.','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeDTVENC.SetFocus;
           Exit;
       End;
     //
     If uFuncoes.Empty(dbeVLDOCU.Text) Then
       Begin
           Application.MessageBox('Digite o valor do documento.','ATEN��O',
               MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
           dbeVLDOCU.SetFocus;
           Exit;
       End;
     //
     // Inicia um transa��o no BD
     TD.TransactionID  := 1;
     TD.IsolationLevel := xilREADCOMMITTED;
     dmBoleto.sqlConnBoleto.StartTransaction(TD);
     //
     try
          tratabotoes;
          PageControl1.Pages[2].TabVisible := True;
          //
          if (dmBoleto.cdsContasReceber.State in [dsinsert]) then
            begin
                 dmBoleto.parametros;
                 dmBoleto.CdsConfig.Edit;
                 dmBoleto.cdsConfig.FieldByName('CFG_CREDITO').AsInteger :=
                      dmBoleto.cdsConfig.FieldByName('CFG_CREDITO').AsInteger + 1;
                 dmBoleto.cdsContasReceber.FieldByName('REC_CREDITO').AsInteger :=
                      dmBoleto.cdsConfig.FieldByName('CFG_CREDITO').AsInteger;
                 dmBoleto.CdsConfig.ApplyUpdates(0);
             end;
          //
          With dmBoleto.cdsParcelas do
            begin
                 DisableControls;
                 First;
                 While not (Eof) do
                  begin
                       With dmConsultas.qryConsulta do
                        begin
                             SQL.Clear;
                             Close;
                             SQL.Add('Select PAR_CREDITO, PAR_OPCAO from PARCELAS');
                             SQL.Add('Where (PAR_CREDITO = :pCREDITO) and (PAR_OPCAO = :pOPCAO)');
                             Params.ParamByName('PCREDITO').AsInteger := dmBoleto.cdsParcelas.FieldByName('PAR_CREDITO').AsInteger;
                             Params.ParamByName('POPCAO').AsInteger   := dmBoleto.cdsParcelas.FieldByName('PAR_OPCAO').AsInteger;
                             Open;
                             //
                             If (dmConsultas.qryConsulta.IsEmpty) Then
                              begin
                                   With dmBoleto.spIncParcelas do
                                    begin
                                         Close;
                                         Params.ParamByName('PCREDITO').AsInteger := dmBoleto.cdsParcelas.FieldByName('PAR_CREDITO').AsInteger;
                                         Params.ParamByName('POPCAO').AsInteger   := dmBoleto.cdsParcelas.FieldByName('PAR_OPCAO').AsInteger;
                                         Params.ParamByName('PVLENTRADA').AsFloat := dmBoleto.cdsParcelas.FieldByName('PAR_VLENTRADA').AsCurrency;
                                         Params.ParamByName('PNRPARCELAS').AsInteger := dmBoleto.cdsParcelas.FieldByName('PAR_NRPARCELAS').AsInteger;
                                         Params.ParamByName('PVLPARCELA').AsFloat := dmBoleto.cdsParcelas.FieldByName('PAR_VLPARCELA').AsCurrency;
                                         //
                                         ExecProc;
                                    End;
                              End
                              Else
                              begin
                                   With dmBoleto.spUpdateParcelas do
                                    begin
                                         Close;
                                         //
                                         Params.ParamByName('PSEQUENCIA').AsInteger := dmBoleto.cdsParcelas.FieldByName('PAR_SEQUE').AsInteger;
                                         Params.ParamByName('PCREDITO').AsInteger := dmBoleto.cdsParcelas.FieldByName('PAR_CREDITO').AsInteger;
                                         Params.ParamByName('POPCAO').AsInteger   := dmBoleto.cdsParcelas.FieldByName('PAR_OPCAO').AsInteger;
                                         Params.ParamByName('PVLENTRADA').AsFloat := dmBoleto.cdsParcelas.FieldByName('PAR_VLENTRADA').AsCurrency;
                                         Params.ParamByName('PNRPARCELAS').AsInteger := dmBoleto.cdsParcelas.FieldByName('PAR_NRPARCELAS').AsInteger;
                                         Params.ParamByName('PVLPARCELA').AsFloat := dmBoleto.cdsParcelas.FieldByName('PAR_VLPARCELA').AsCurrency;
                                         //
                                         ExecProc;
                                    End;
                              End;
                        End;
                       //
                       next;
                  End;
                  EnableControls;
                  //
            End;
          //
          dmBoleto.cdsContasReceber.ApplyUpdates(0);
          //
          dmBoleto.sqlConnBoleto.Commit(TD);
          //
          PARCELAS(dmBoleto.cdsContasReceber.FieldByName('REC_CREDITO').AsInteger);
          //
     Except
          on Exc:Exception do
            begin
               Application.MessageBox(PChar('Error ao tentar gravar registro.'+#13
                      + Exc.Message),
                      'ATEN��O', MB_OK+MB_ICONINFORMATION+MB_APPLMODAL);
               dmBoleto.cdsContasReceber.Cancel;
               //
               dmBoleto.sqlConnBoleto.Rollback(TD);
            End;
     End;
end;

procedure TfrmCadTitulos.dbeNossoNumeroKeyPress(Sender: TObject;
  var Key: Char);
begin
      If not( key in['0'..'9',#8, #13] ) then
        key:=#0;
end;

procedure TfrmCadTitulos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
      dmBoleto.cdsContasReceber.Close;
      //
      Action := caFree; 
end;

procedure TfrmCadTitulos.dbeNossoNumeroExit(Sender: TObject);
begin
     If (dmBoleto.cdsContasReceber.State in [dsinsert, dsEdit])
      and not uFuncoes.Empty(dbeNossoNumero.Text) Then
         dbeNossoNumero.Text := uFuncoes.StrZero(dbeNossoNumero.Text, 10 );
end;

procedure TfrmCadTitulos.btIncluirClick(Sender: TObject);
begin
  If (dmBoleto.cdsContasReceber.State in [dsInsert, dsEdit]  ) Then
   begin
     If not (dmBoleto.cdsParcelas.Active) Then
          dmBoleto.cdsParcelas.Open;
     //
     If (dmBoleto.cdsParcelas.IsEmpty) Then
        dmBoleto.cdsParcelas.EmptyDataSet;
     //
     tratabotoes2;
     M_NROPCA := M_NROPCA + 1;
     dmBoleto.cdsParcelas.Append;
     dmBoleto.cdsParcelas.FieldByName('PAR_CREDITO').AsInteger :=
         dmBoleto.cdsContasReceber.FieldByName('REC_CREDITO').AsInteger;
     dmBoleto.cdsParcelas.FieldByName('PAR_OPCAO').AsInteger := M_NROPCA;
     dbeVLENTR.SetFocus;
   End;
end;

procedure TfrmCadTitulos.btApagarClick(Sender: TObject);
begin
  If (dmBoleto.cdsContasReceber.State in [dsInsert, dsEdit]  ) Then
      if not (dmBoleto.cdsParcelas.IsEmpty) and
           (dmBoleto.cdsParcelas.RecordCount > 0) then
          begin
               EXCLUIR_PARCELA(dmBoleto.cdsParcelas.FieldByName('PAR_CREDITO').AsInteger,
                                dmBoleto.cdsParcelas.FieldByName('PAR_OPCAO').AsInteger);
               dmBoleto.cdsParcelas.Delete;
          End;
end;

procedure TfrmCadTitulos.btConfirmaClick(Sender: TObject);
begin
   If (dmBoleto.cdsContasReceber.State in [dsInsert, dsEdit]) Then
    begin
     If uFuncoes.Empty(dbeVLENTR.Text) Then
      begin
          dbeVLENTR.SetFocus;
          Exit;
      End;
      //
     If uFuncoes.Empty(dbeParcelas.Text) Then
      begin
          dbeParcelas.SetFocus;
          Exit;
      End;
      //
     If uFuncoes.Empty(dbeValor.Text) Then
      begin
          dbeValor.SetFocus;
          Exit;
      End;
      //
     If not (dmBoleto.cdsParcelas.State in [dsInsert, dsEdit]) Then
          dmBoleto.cdsParcelas.Edit;
     //
     dmBoleto.cdsParcelas.Post;
     tratabotoes2;
    End;
end;

procedure TfrmCadTitulos.tratabotoes2;
begin
    btIncluir.Enabled := not btIncluir.Enabled;
    btApagar.Enabled  := not btApagar.Enabled;
    btAlterar.Enabled := not btAlterar.Enabled;
    btConfirma.Enabled  := not btConfirma.Enabled;
end;

procedure TfrmCadTitulos.dsConsultarDataChange(Sender: TObject;
  Field: TField);
begin
  sbPrimeiro.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Bof);
  sbAnterior.Enabled := sbPrimeiro.Enabled;
  sbUltimo.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty) and not ((Sender as TDataSource).DataSet.Eof);
  sbProximo.Enabled := sbUltimo.Enabled;
end;

procedure TfrmCadTitulos.dsConsultarStateChange(Sender: TObject);
begin
     btnAlterar.Enabled := (((Sender as TDataSource).DataSet.Active) and not (Sender as TDataSource).DataSet.IsEmpty);
end;

procedure TfrmCadTitulos.btAlterarClick(Sender: TObject);
begin
  If (dmBoleto.cdsContasReceber.State in [dsInsert, dsEdit]  ) Then
      if not (dmBoleto.cdsParcelas.IsEmpty) and
           (dmBoleto.cdsParcelas.RecordCount > 0) then
        begin
             tratabotoes2;
             dmBoleto.cdsParcelas.Edit;
             dbeVLENTR.SetFocus;
        End;
end;

procedure TfrmCadTitulos.grdConsultarEnter(Sender: TObject);
begin
  If (dmBoleto.cdsContasReceber.State in [dsInsert, dsEdit]  ) Then
      if not (dmBoleto.cdsParcelas.IsEmpty) and
           (dmBoleto.cdsParcelas.RecordCount > 0) then
        begin
             tratabotoes2;
             dmBoleto.cdsParcelas.Cancel;
        End;
end;

procedure TfrmCadTitulos.BtPesquisarClick(Sender: TObject);
begin
     try
          //Application.CreateForm(TrepBoletoPersonalizado, repBoletoPersonalizado);
          Try
              With repBoletoPersonalizado do
              begin
                   dmBoleto.parametros;
                   CEDENTE(dmBoleto.cdsContasReceber.FieldByName('REC_CEDENTE').AsInteger);
                   //
                   With gbTitulo1 do
                    begin
                         SeuNumero   := '';
                         NossoNumero := '';
                         DataDocumento  := dmBoleto.cdsContasReceber.FieldByName('REC_DTDOCUMENTO').AsDateTime;
                         DataVencimento := dmBoleto.cdsContasReceber.FieldByName('REC_DTVENCIMENTO').AsDateTime;
                         ValorDocumento := dmBoleto.cdsContasReceber.FieldByName('REC_VLDOCUMENTO').AsCurrency;
                         //
                         {Dados do cedente}
                         with Cedente do
                         begin
                              TipoInscricao := tiPessoaJuridica; //CNPJ
                              CodigoCedente := dmBoleto.cdsCedenteCED_CDCEDENTE.AsString;
                              DigitoCodigoCedente := dmBoleto.cdsCedenteCED_DIGITOCODIGO.AsString;
                              //
                              {Dados banc�rios do cedente}
                              with ContaBancaria do
                              begin
                                   Banco.Codigo  := dmBoleto.cdsCedenteCED_CDBANCO.AsString;
                                   CodigoAgencia := dmBoleto.cdsCedenteCED_CDAGENCIA.AsString;
                                   DigitoAgencia := dmBoleto.cdsCedenteCED_DIGITO_AGENCIA.AsString;
                                   NumeroConta   := dmBoleto.cdsCedenteCED_NRCOTA.AsString;
                                   //
                                   txtCDBANC.Caption    := Banco.Codigo + '-'+dmBoleto.cdsCedente.FieldByName('CED_DIGITO_BANCO').AsString;
                              End;
                              //  {with banc�rios}
                         End;  {with Cedente}
                    End;
                   //
                   mmoOpcao.Lines.Clear;
                   mmoEntrada.Lines.Clear;
                   mmoParcela.Lines.Clear;
                   mmoValor.Lines.Clear;
                   //
                   With dmBoleto.cdsParcelas do
                   begin
                        DisableControls;
                        First;
                        While not (Eof) do
                         begin
                              mmoOpcao.Lines.Add(FieldByName('PAR_OPCAO').AsString);
                              mmoEntrada.Lines.Add(FormatFloat('#,##0.#0',FieldByName('PAR_VLENTRADA').AsCurrency));
                              mmoParcela.Lines.Add(uFuncoes.StrZero(FieldByName('PAR_NRPARCELAS').AsString,2));
                              mmoValor.Lines.Add(FormatFloat('#,##0.#0',FieldByName('PAR_VLPARCELA').AsCurrency));
                              //
                              Next;
                         end;
                        EnableControls;
                   End;
                   //
                   If FileExists(ExtractFilePath( Application.ExeName )+'logo.jpg') Then
                      QRImage1.Picture.LoadFromFile(ExtractFilePath( Application.ExeName )+'logo.jpg');
                   //
                   txt_NMSACA.caption   := dbeNMSACA.Text;
                   txtCarteira2.Caption := dmBoleto.cdsCedenteCED_CARTEIRA.AsString;
                   lbl_Especie.Caption  := '';
                   txtSEGVIA.Caption    := '';
                   If not uFuncoes.Empty(mmoInstrucoes.Text) Then
                    begin
                          txtMensagem.Lines.Clear;
                          txtMensagem.Lines.Text := mmoInstrucoes.Lines.Text;    
                    End;
                   txtInstrucoes.Lines.Clear;
                   txtInstrucoes.Lines.Text := DBMemo1.Lines.Text;
                   txtAgCdCedente.Caption := dmBoleto.cdsCedenteCED_CDAGENCIA.AsString + '/'+
                                             dmBoleto.cdsCedenteCED_CDCEDENTE.AsString;
                   txtNossoNumero.Caption := dbeNossoNumero.Text;
                   txtDTVENC.Caption      := DatetoStr(dbeDTVENC.Date);
                   txtValorDocumento.Caption := FormatFloat('#,##0.#0',StrtoFloat(dbeVLDOCU.Text)); 
                   txtValor.Caption       := 'CONFORME INSTRU��ES';
                   //FormatFloat('#,###,##0.#0', dmBoleto.cdsContasReceberREC_VLDOCUMENTO.AsCurrency);
                   // dados do cliente
                   txtNMSACA.Caption   := dbeNMSACA.Text;
                   txtCPF_CNPJ.Caption := dbeCPFCNJP.Text;  
                   txtEndereco.Caption := dbeEndereco.Text;
                   txtNRCEP.Caption    := dbeCep.Text;
                   txtBairro.Caption    := dbeBairro.Text;
                   txtCidade.Caption    := dbeCidade.Text;
                   txtUF.Caption    := cmbUF.Text;
                   //
                   txtCodigoBarras.Caption := gbTitulo1.CodigoBarra.LinhaDigitavel;
                   imgCodeBarras.Picture.Assign(gbTitulo1.CodigoBarra.Imagem.Picture);
                   //
                   Preview;
              End;
          Finally
              //repBoletoPersonalizado.Free;
          End;
     Except

     End;
end;

procedure TfrmCadTitulos.CEDENTE(M_CDCEDE: Integer);
begin
     With dmBoleto.cdsCedente  do
     begin
          Close;
          Params.ParamByName('pCODIGO').AsInteger  := M_CDCEDE;
          Open;
     End;
end;

procedure TfrmCadTitulos.btnAlterarClick(Sender: TObject);
begin
       buscar;
       PageControl1.ActivePageIndex := 0;
end;

procedure TfrmCadTitulos.edtConsultarChange(Sender: TObject);
begin
  If not uFuncoes.Empty(edtConsultar.Text) Then
    begin
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := 'Select REC_CREDITO, REC_NMSACADO, REC_DTDOCUMENTO, REC_DTVENCIMENTO, REC_DTRECEBIMENTO from CONTASRECEBER';
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (UPPER(REC_NMSACADO) like :pNOME)';
                1: CommandText := CommandText + ' Where (REC_DTDOCUMENTO >= :pDTINICIAL) AND (REC_DTDOCUMENTO <= :pDTFINAL)';
            end;
            CommandText := CommandText + ' order by REC_CREDITO';
            case rgConsultar.ItemIndex of
                0: datasetConsultar.Params.ParamByName('pNOME').AsString := edtConsultar.Text + '%';
                1:
                begin
                     datasetConsultar.Params.ParamByName('pDTINICIAL').AsDate  := edtDTINIC.Date;
                     datasetConsultar.Params.ParamByName('edtDTFINAL').AsDate  := edtDTFINAL.Date;
                End;
            end;
            Active := True;
        end;
        cdsConsultar.FetchParams;
        cdsConsultar.Open;
   End;
end;

procedure TfrmCadTitulos.rgConsultarClick(Sender: TObject);
begin
  cdsConsultar.Close;
  //
  case rgConsultar.ItemIndex of
    0:
    begin
      lblConsultar.Caption := 'Nome';
      lbl_periodo.Caption := '';
      lbl_periodo.Visible  := False;
      edtConsultar.Visible := True;
      edtConsultar.Width   := 346;
      edtConsultar.Clear;
      edtDTINIC.Visible  := False;
      edtDTFINAL.Visible := False;
    end;
    1:
    begin
      edtConsultar.Visible := False;
      lblConsultar.Caption := '';
      lbl_periodo.Top := lblConsultar.Top;
      lbl_periodo.Left := lblConsultar.Left;
      lbl_periodo.Caption := 'Per�odo';
      lbl_periodo.Visible  := True;
      edtDTINIC.Left  := edtConsultar.Left;
      edtDTFINAL.Left := 280;
      edtConsultar.Clear;
      edtConsultar.Visible := False;
      edtDTINIC.Visible    := True;
      edtDTFINAL.Visible   := True;
      //
      edtDTINIC.Clear;
      edtDTFINAL.Clear;
    end;
  end;
  if (edtConsultar.Visible) and (edtConsultar.CanFocus) then
       edtConsultar.SetFocus;
  //
  If (edtDTINIC.Visible) and (edtDTINIC.CanFocus) Then
       edtDTINIC.SetFocus;
end;

procedure TfrmCadTitulos.TabSheet3Show(Sender: TObject);
begin
      dsConsultar.DataSet.Close;
      if (edtConsultar.Visible) and (edtConsultar.CanFocus) then
      begin
           edtConsultar.Clear; 
           edtConsultar.SetFocus;
      End;
      //
     If (edtDTINIC.Visible) and (edtDTINIC.CanFocus) Then
         edtDTINIC.SetFocus;
     //
     edtDTINIC.Clear;
     edtDTFINAL.Clear;
end;

procedure TfrmCadTitulos.edtConsultarKeyPress(Sender: TObject;
  var Key: Char);
begin
  //
  If (key = #13) and not uFuncoes.Empty(edtConsultar.Text) Then
    begin
         Key := #0;
         If (btnAlterar.Enabled = True) Then
            btnAlterar.SetFocus;
    End;

end;

procedure TfrmCadTitulos.edtDTFINALChange(Sender: TObject);
begin
  If (edtDTINIC.Text <> '  /  /    ') and (edtDTFINAL.Text <> '  /  /    ') Then
    begin
        cdsConsultar.Close;
        with datasetConsultar do
        begin
            Active := False;
            CommandText := 'Select REC_CREDITO, REC_NMSACADO, REC_DTDOCUMENTO, REC_DTVENCIMENTO, REC_DTRECEBIMENTO from CONTASRECEBER';
            case rgConsultar.ItemIndex of
                0: CommandText := CommandText + ' Where (UPPER(REC_NMSACADO) like :pNOME)';
                1: CommandText := CommandText + ' Where (REC_DTDOCUMENTO >= :pDTINICIAL) AND (REC_DTDOCUMENTO <= :pDTFINAL)';
            end;
            CommandText := CommandText + ' order by REC_CREDITO';
            case rgConsultar.ItemIndex of
                0: datasetConsultar.Params.ParamByName('pNOME').AsString := edtConsultar.Text + '%';
                1:
                begin
                     datasetConsultar.Params.ParamByName('pDTINICIAL').AsDate  := edtDTINIC.Date;
                     datasetConsultar.Params.ParamByName('pDTFINAL').AsDate    := edtDTFINAL.Date;
                End;
            end;
            Active := True;
        end;
        cdsConsultar.FetchParams;
        cdsConsultar.Open;
   End;
end;

procedure TfrmCadTitulos.DBGrid1DblClick(Sender: TObject);
begin
     If not (cdsConsultar.IsEmpty) Then
         btnAlterarClick(Sender);
end;

procedure TfrmCadTitulos.PARCELAS(M_CDCEDE: Integer);
begin
     dmBoleto.cdsParcelas.Close; 
     dmBoleto.cdsParcelas.Open;
     //
     dmBoleto.cdsParcelas.EmptyDataSet;
     //     
     With dmBoleto.cdsRecParcelas do
      begin
           Close;
           Params.ParamByName('pCREDITO').AsInteger := M_CDCEDE;
           Open;
           //
           If not(IsEmpty) Then
            begin
                 First;
                 While not (Eof) do
                  begin
                       dmBoleto.cdsParcelas.Append;
                       dmBoleto.cdsParcelas.FieldByName('PAR_SEQUE').AsInteger :=
                                            FieldByName('PAR_SEQUECIA').AsInteger;
                       dmBoleto.cdsParcelas.FieldByName('PAR_CREDITO').AsInteger :=
                                            FieldByName('PAR_CREDITO').AsInteger;
                       dmBoleto.cdsParcelas.FieldByName('PAR_OPCAO').AsInteger :=
                                            FieldByName('PAR_OPCAO').AsInteger;
                       dmBoleto.cdsParcelas.FieldByName('PAR_VLENTRADA').AsCurrency :=
                                            FieldByName('PAR_VLENTRADA').AsCurrency;
                       dmBoleto.cdsParcelas.FieldByName('PAR_NRPARCELAS').AsInteger :=
                                            FieldByName('PAR_NRPARCELAS').AsInteger;
                       dmBoleto.cdsParcelas.FieldByName('PAR_VLPARCELA').AsCurrency :=
                                            FieldByName('PAR_VLPARCELA').AsCurrency;
                       dmBoleto.cdsParcelas.Post;
                       //
                       next;
                  End;  // fim-enquanto
            End;
      End; // fim-with
end;

procedure TfrmCadTitulos.TabSheet2Exit(Sender: TObject);
begin
     If (dmBoleto.cdsContasReceber.State in [dsInsert, dsEdit])
       and (dmBoleto.cdsParcelas.State in [dsInsert, dsEdit]) Then
       begin
            tratabotoes2;
            dmBoleto.cdsParcelas.Cancel;
       End;
end;

procedure TfrmCadTitulos.EXCLUIR_PARCELA(M_CDCEDE, M_NROPCA: Integer);
begin
     With dmConsultas.qryConsulta do
         begin
              SQL.Clear;
              Close;
              SQL.Add('Select PAR_CREDITO, PAR_OPCAO from PARCELAS');
              SQL.Add('Where (PAR_CREDITO = :pCREDITO) and (PAR_OPCAO = :pOPCAO)');
              Params.ParamByName('PCREDITO').AsInteger := M_CDCEDE;
              Params.ParamByName('POPCAO').AsInteger   := M_NROPCA;
              Open;
              //
              If not (IsEmpty) Then
                begin
                     SQL.Clear;
                     Close;
                     SQL.Add('Delete from PARCELAS Where (PAR_CREDITO = :pCREDITO) and (PAR_OPCAO = :pOPCAO)');
                     Params.ParamByName('PCREDITO').AsInteger := dmBoleto.cdsParcelas.FieldByName('PAR_CREDITO').AsInteger;
                     Params.ParamByName('POPCAO').AsInteger   := dmBoleto.cdsParcelas.FieldByName('PAR_OPCAO').AsInteger;
                     ExecSQL;
                End;
         End;
end;

procedure TfrmCadTitulos.edtDTINICExit(Sender: TObject);
begin
   If (edtDTINIC.Text <> '  /  /    ') Then
   begin
      try
          StrToDate(edtDTINIC.Text);
          edtDTINIC.Date := StrToDate(edtDTINIC.Text);
      Except
          on EConvertError do
          begin
             ShowMessage ('Data Inv�lida!');
             edtDTINIC.Date := Date();
             edtDTINIC.SetFocus;
             Exit;
          End;
      End;
   End;
end;

procedure TfrmCadTitulos.edtDTFINALExit(Sender: TObject);
begin
   If (edtDTFINAL.Text <> '  /  /    ') Then
   begin
      try
          StrToDate(edtDTFINAL.Text);
          edtDTFINAL.Date := StrToDate(edtDTFINAL.Text);
      Except
          on EConvertError do
          begin
             ShowMessage ('Data Inv�lida!');
             edtDTFINAL.Date := Date();
             edtDTFINAL.SetFocus;
             Exit;
          End;
      End;
   End;
end;

procedure TfrmCadTitulos.sbPrimeiroClick(Sender: TObject);
begin
     If (cdsConsultar.Active) Then
        dsConsultar.DataSet.First;
end;

procedure TfrmCadTitulos.sbAnteriorClick(Sender: TObject);
begin
     If (cdsConsultar.Active) Then
        dsConsultar.DataSet.Prior;
end;

procedure TfrmCadTitulos.sbProximoClick(Sender: TObject);
begin
     If (cdsConsultar.Active) Then
        dsConsultar.DataSet.Next;
end;

procedure TfrmCadTitulos.sbUltimoClick(Sender: TObject);
begin
     If (cdsConsultar.Active) Then
        dsConsultar.DataSet.Last;
end;

end.
