program falu;

{$mode objfpc}{$H+}
{$Define DBG}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, sysutils, strutils
  { you can add units after this };

{$i base.inc}

var
  faluk: array of array of Integer;
  A: record
    r: Integer;
    length: Integer;
  end;
  ut:record //csak egy for ciklusban használom
    f, t: Integer;  //from, to
    length: Integer;
  end;

begin
  SetLength(faluk, get('Faluk szama', 1, 100));
  for i:=1 to get('Utak szama', 3, 1000) do
  begin
    WriteLn();
    ut.f:=     get('ut#'+IntToStr(i)+'/start')-1;
    ut.t:=     get('ut#'+IntToStr(i)+'/veg  ')-1;
    ut.length:=get('ut#'+IntToStr(i)+'/hossz'){$IfNDef DBG}+1{$EndIf};

    SetLength(
      faluk[ut.f],
      Length(faluk[ut.f])+1
    );
    faluk[ut.f][Length(faluk[ut.f])]:=ut.length;

    SetLength(faluk[ut.t], Length(faluk[ut.t])+1);
    faluk[ut.t][Length(faluk[ut.t])]:=ut.length;
  end;
  WriteLn();

  for i:=0 to High(faluk) do
  for j:=0 to High(faluk[i]) do
  begin
    if faluk[i][j]>A.length then
    begin
      A.r:=i;
      A.length:=faluk[i][j];
    end;
  end;
  WriteLn('Legelszigeltebb falu');
  WriteLn('id=', A.r, ' ', 'length=', A.length);

  ReadLn;
end.

