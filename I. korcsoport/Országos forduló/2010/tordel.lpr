program tordel;
{$Define DBG}

uses
  sysutils, strutils;

{$i base.inc}

var S: String;
    l, w: String; //output line, word

type
  ETooBigWord=Exception;

begin
  N:=get('Kepernyo szelessege', 10, 80);
  S:=gets('Szoveg (sorteresek nelkul)', N, 1000);

  while Length(S)>0 do
  begin
    w:=nextWord(s);
    if Length(w)>N then raise ETooBigWord.Create('Túl nagy szó: '+w);
    if Length(l+' '+w)<N then l:=l+' '+w
    else begin
      Write('|'); Write(l); for i:=1 to N-Length(l) do Write(' '); WriteLn('|');
      l:=w;
    end;
  end;
  Write('|'); Write(l); for i:=1 to N-Length(l) do Write(' '); WriteLn('|');
  gets('Kilépés');
end.

