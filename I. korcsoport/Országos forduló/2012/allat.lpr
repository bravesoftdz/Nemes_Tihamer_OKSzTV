program allat;

{$Define DBG}
{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this },
  sysutils, math;

type
  EInvalidData=class(Exception);

function get(name: String=''; minv: Integer=0; maxv: Integer=MaxInt): Integer;
begin
  {$IfDef DBG}if name<>'' then Write(name+': ');{$EndIf}
  Read(Result);
  if (Result<minv) or (Result>maxv) then raise EInvalidData.Create('"'+name+'" is not in range '+IntToStr(minv)+'-'+IntToStr(maxv)+'.');
end;

var
  i, j, A, B: Integer;
  N: array of Integer;

begin
  SetLength(N, get('Allatok szama', 1, 100));

  for i:=0 to Length(N)-1 do
    N[i]:=0;

  for i:=1 to get('Utak szama', 0, round(MaxInt/2))*2 do
  begin
    Inc(N[get]);
  end;

  A:=0;
  B:=0;

  for i:=0 to Length(N)-1 do
  begin
    if N[i]=1 then inc(A);
    if N[i]>N[B] then B:=i;
  end;

  {$IfDef DBG}Write('Állatok száma zsákutca végén: ');{$EndIf}
  WriteLn(A);
  {$IfDef DBG}Write('Legtöbb út: ');{$EndIf}
  WriteLn(B);

  {$IfDef DBG}ReadLn;{$EndIf}
end.

