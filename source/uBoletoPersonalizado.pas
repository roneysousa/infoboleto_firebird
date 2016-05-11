unit uBoletoPersonalizado;

interface

uses Classes, Controls, ExtCtrls, QuickRpt, Qrctrls, Graphics;

type
  TrepBoletoPersonalizado = class(TQuickRep)
    PageFooterBand1: TQRBand;
    imgFichaCompensacao: TQRImage;
    QRDBText8: TQRDBText;
    QRDBText12: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText11: TQRDBText;
    txtCDBANC: TQRLabel;
    QRDBText18: TQRDBText;
    QRDBText19: TQRDBText;
    QRSysData1: TQRSysData;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    txtCodigoBarras: TQRLabel;
    txtNossoNumero: TQRLabel;
    QRLabel13: TQRLabel;
    txtAgCdCedente: TQRLabel;
    QRLabel15: TQRLabel;
    txtMoeda: TQRLabel;
    txtInstrucoes: TQRMemo;
    txtCarteira2: TQRLabel;
    qrlAgenCodCen: TQRLabel;
    qrlNossoNum: TQRLabel;
    qrlDescoAbat: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel35: TQRLabel;
    QRShape3: TQRShape;
    imgCodeBarras: TQRImage;
    QRImage5: TQRImage;
    QRImage6: TQRImage;
    QRImage8: TQRImage;
    QRImage7: TQRImage;
    QRImage9: TQRImage;
    QRImage10: TQRImage;
    QRImage11: TQRImage;
    QRImage4: TQRImage;
    QRImage12: TQRImage;
    QRImage13: TQRImage;
    QRImage14: TQRImage;
    QRImage15: TQRImage;
    QRImage16: TQRImage;
    QRImage17: TQRImage;
    QRImage18: TQRImage;
    QRImage19: TQRImage;
    QRImage20: TQRImage;
    TitleBand1: TQRBand;
    txtMensagem: TQRMemo;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    qrlRecortar: TQRLabel;
    QRImage21: TQRImage;
    txtSEGVIA: TQRLabel;
    QRDBImage3: TQRDBImage;
    lbl_Especie: TQRLabel;
    txtNMSACA: TQRLabel;
    txtEndereco: TQRLabel;
    txtCPF_CNPJ: TQRLabel;
    txtNRCEP: TQRLabel;
    txtBairro: TQRLabel;
    txtCidade: TQRLabel;
    txtUF: TQRLabel;
    QRImage1: TQRImage;
    QRLabel1: TQRLabel;
    QRImage2: TQRImage;
    QRShape4: TQRShape;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel5: TQRLabel;
    txtSaldoDivida: TQRLabel;
    txtNRContrato: TQRLabel;
    QRShape6: TQRShape;
    QRShape7: TQRShape;
    QRShape11: TQRShape;
    QRShape12: TQRShape;
    QRShape13: TQRShape;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel36: TQRLabel;
    mmoOpcao: TQRMemo;
    mmoEntrada: TQRMemo;
    mmoValor: TQRMemo;
    mmoParcela: TQRMemo;
    QRShape8: TQRShape;
    QRShape10: TQRShape;
    QRShape9: TQRShape;
    QRShape5: TQRShape;
    QRShape14: TQRShape;
    QRShape15: TQRShape;
    QRShape16: TQRShape;
    QRMemo1: TQRMemo;
    QRLabel37: TQRLabel;
    QRMemo2: TQRMemo;
    QRLabel38: TQRLabel;
    QRDBRichText1: TQRDBRichText;
    QRShape17: TQRShape;
    qrlVencimento: TQRLabel;
    QRDBText9: TQRDBText;
    QRShape18: TQRShape;
    qrlValor: TQRLabel;
    txtValor: TQRLabel;
    txt_NMSACA: TQRLabel;
    QRLabel8: TQRLabel;
    txtDTVENC: TQRLabel;
    txtValorDocumento: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
  private

  public

  end;

var
  repBoletoPersonalizado: TrepBoletoPersonalizado;

implementation

uses udmBoleto;
{$R *.DFM}

procedure TrepBoletoPersonalizado.QuickRepBeforePrint(
  Sender: TCustomQuickRep; var PrintReport: Boolean);
begin
//    repBoletoPersonalizado.Page.PaperSize := ListaBoletos.frmTitulosLista.cPaperSize;
end;

end.
