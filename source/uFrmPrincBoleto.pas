unit uFrmPrincBoleto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, ExtCtrls, ImgList, Buttons, jpeg;

type
  TfrmPrincBoleto = class(TForm)
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    Cadastro1: TMenuItem;
    mnuCedenteItem: TMenuItem;
    N1: TMenuItem;
    mnuSairItem: TMenuItem;
    Panel1: TPanel;
    mnuTitulosItem: TMenuItem;
    spCedente: TSpeedButton;
    ImageList1: TImageList;
    SpeedButton1: TSpeedButton;
    spSair: TSpeedButton;
    imgLogon: TImage;
    procedure mnuSairItemClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mnuCedenteItemClick(Sender: TObject);
    procedure mnuTitulosItemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    procedure IMAGEM_LOGO;
    { Private declarations }
  public
    { Public declarations }
    procedure DisplayHint(Sender: TObject);    
  end;

var
  frmPrincBoleto: TfrmPrincBoleto;

implementation

uses uFrmCadClientes, uFrmCadCedente, uFrmCadTitulos;

{$R *.dfm}

procedure TfrmPrincBoleto.mnuSairItemClick(Sender: TObject);
begin
  If Application.MessageBox('Sair do Sistema?',
     'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idYes then
          application.Terminate;
end;

procedure TfrmPrincBoleto.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  If Application.MessageBox('Sair do Sistema?',
     'ATENÇÃO', MB_YESNO+MB_ICONQUESTION+MB_DEFBUTTON2+MB_APPLMODAL) = idNo then
        Canclose:=False;
end;

procedure TfrmPrincBoleto.mnuCedenteItemClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCadCedente, frmCadCedente);
    Try
        frmCadCedente.ShowModal;
    Finally
        frmCadCedente.Release;
        frmCadCedente := nil;
    End;
end;

procedure TfrmPrincBoleto.mnuTitulosItemClick(Sender: TObject);
begin
    Application.CreateForm(TfrmCadTitulos, frmCadTitulos);
    Try
        frmCadTitulos.ShowModal;
    Finally
        frmCadTitulos.Release;
        frmCadTitulos := nil;
    End;
end;

procedure TfrmPrincBoleto.DisplayHint(Sender: TObject);
begin
     StatusBar1.Panels[1].Text := Application.Hint;
end;

procedure TfrmPrincBoleto.FormCreate(Sender: TObject);
begin
     imgLogon.Left := (frmPrincBoleto.Width Div 2) - (imgLogon.Width Div 2);
     imgLogon.Top  := (frmPrincBoleto.Height Div 2) - (imgLogon.Height Div 2 + StatusBar1.Height);
     //
     Application.OnHint := DisplayHint;
end;

procedure TfrmPrincBoleto.FormResize(Sender: TObject);
begin
     imgLogon.Left := (frmPrincBoleto.Width Div 2) - (imgLogon.Width Div 2);
     imgLogon.Top  := (frmPrincBoleto.Height Div 2) - (imgLogon.Height Div 2 + StatusBar1.Height);
end;

procedure TfrmPrincBoleto.IMAGEM_LOGO;
begin
    If FileExists(ExtractFilePath( Application.ExeName )+'\logo.jpg') Then
        imgLogon.Picture.LoadFromFile(ExtractFilePath( Application.ExeName )+'\logo.jpg');
end;

procedure TfrmPrincBoleto.FormShow(Sender: TObject);
begin
     //IMAGEM_LOGO;
end;

end.
