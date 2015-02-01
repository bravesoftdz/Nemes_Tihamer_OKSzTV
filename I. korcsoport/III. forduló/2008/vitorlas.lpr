program vitorlas;

{$mode objfpc}{$H+}
{$Define DBG}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, sysutils
  { you can add units after this };

var
  N, K, i, j, Q, A, B, C1, C2: Integer;
  E: array of Integer;
  Z, L, M: array of Boolean;

type
  EInvalidData=class(Exception);

function get(text: String): Integer;
begin
  {$IfDef DBG}Write(text+'=');{$EndIf}
  Read{Ln}(Result);
end;

begin
  N:=get('N');
  K:=get('K');
  SetLength(E, N);//Erősség
  SetLength(Z, N);//Zero
  SetLength(L, N);//Less
  SetLength(M, N);//More
  for i:=0 to N-1 do
  begin
    E[i]:=abs(get(IntToStr(i+1)+'. nap szele'));
    if E[i]>200 then
      raise EInvalidData.Create('A szél elfújta az időjárásjelző-állomást.');
    Z[i]:=E[i]=0;
    L[i]:=(E[i]<10) and (not Z[i]);
    M[i]:=E[i]>100;
    if Z[i] then Inc(Q);
    if L[i] then Inc(A);
    If M[i] then Inc(B);
    if (not L[i]) and (not M[i]) and (not Z[i]) then
      Inc(j)
    else
      j:=0;
    if (j=K) and (C1=0) and (C2=0) then
    begin
      C2:=i+1;
      C1:=C2-j+1;
    end;
    {$IfDef DBG}WriteLn('j=', j);{$EndIf}
  end;

  (*
  for i:=0 to N-1 do
  begin
    j:=i;
    while (j<N) and (not L[j]) and (not M[j]) do
      Inc(j);

    if (j-i)>(C1-C2) then begin
      C1:=i+1;
      C2:=j+1;
    end;
  end;
  *)

  WriteLn({$IfDef DBG}'Zero-szelek:', {$EndIf}Q);
  WriteLn({$IfDef DBG}'Kis szelek: ', {$EndIf}A);
  WriteLn({$IfDef DBG}'Nagy szelek:', {$EndIf}B);
  WriteLn({$IfDef DBG}'Verseny: ', {$EndIf}C1{$IfDef DBG}, '-', C2{$EndIf});

  if C1=0 then
    raise EInvalidData.Create('A verseny nem kezdhető el.');

  {$IfDef DBG}
    ReadLn;
  {$EndIf}
end.

