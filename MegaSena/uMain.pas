unit uMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TMeuArray = array of Integer;

  TfrmLogica = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    function Retorna60():TMeuArray;
  public
    { Public declarations }
  end;



var
  frmLogica: TfrmLogica;

implementation

{$R *.dfm}

{ TfrmLogica }

procedure TfrmLogica.Button1Click(Sender: TObject);
var
  aValores2:TMeuArray;
begin
  aValores2:=Retorna60();
end;

function TfrmLogica.Retorna60: TMeuArray;
var
  aValores: TMeuArray;
  i,x,valor,quantidade,aux:Integer;
begin
  try
    //Define 6  "campos" do volante
    SetLength(aValores,6);
    valor:=0;
    quantidade:=0;

    for i := Low(aValores) to High(aValores) do
    begin
      valor      :=(1+Random(60));
      aValores[i]:=valor;
      //Compara o último valor gerado, com todos os outros do array, em busca de algum repetido
      for x := Low(aValores) to High(aValores) do
      begin
        //Se o valor encontrado for igual ao da variável "valor" então incrementa 1
        //pois senão iria encontrar ele mesmo no array.
        //Se for maior do que 1 gera um novo número até que seja diferente do
        //armazenado na variável "valor"
        if aValores[x]=valor then
        begin
          Inc(quantidade);
          if quantidade > 1 then
            while aValores[i] = valor do
              aValores[i]:=(1+Random(60));
        end;
      end;
      quantidade:=0;
    end;

    //Ordena em ordem crescente
    aux := 0;
    for i := Low(aValores) to High(aValores) do
      for x := Low(aValores) to High(aValores) do
        if (aValores[i] < aValores[x]) then
        begin
          aux := aValores[i];
          aValores[i] := aValores[x];
          aValores[x] := aux;
        end;
        
  finally
    Result:=aValores;
  end;
end;

end.
