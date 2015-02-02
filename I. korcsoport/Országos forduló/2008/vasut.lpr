program vasut;

uses
  sysutils, math;

{$Define DBG}

var
  i, j, N, K, A: Integer;
  all: array of Integer;
  B: String;

type
  EFennragadtAVonaton=class(Exception);
  ETulSokatUtazottEgyMenetben=class(Exception);
  ETolatAVonat=class(Exception);

begin
  Read(N, K);
  if N<2 then
    raise EFennragadtAVonaton.Create('A fickó nem tud leszállni.');
  if N>100 then
    raise EFennragadtAVonaton.Create('A fickót szétrászta a vonat; érzéketlen lábakkal nem lehet leszállni.');
  if K>100 then
    raise ETulSokatUtazottEgyMenetben.Create('A fickó bepisilt.');
  if K<0 then
    raise ETolatAVonat.Create('Itt nem az elmozdulást, hanem az utat mérjük.');
  SetLength(all, N);
  for i:=0 to N-1 do
  begin
    {$IfDef DBG}Write('#'+IntToStr(i+1)+'=');{$EndIf}
    Read(all[i]);
    if (i<>0) and (not (all[i]>all[i-1])) then
      raise ETolatAVonat.Create('Itt nem az elmozdulást, hanem az utat mérjük.');
  end;

  i:=0;
  j:=0;
  Inc(A);
  B:='1.';
  while (i<N-1) and (all[N-1]-all[i]>K) do
  begin
    if (all[i]-all[j])>K then
    begin
      j:=i;
      Inc(A);
      B:=B+', '+IntToStr(i+1)+'.';
    end;
    Inc(i);
  end;

  if (all[N-1]-all[i])>K then
    raise EFennragadtAVonaton.Create('A fickó nem tudott leszállni.');
  Inc(A);
  B:=B+', '+IntToStr(N)+'.';
  WriteLn(A);
  WriteLn(B);
  {$IfDef DBG}ReadLn;{$EndIf}
end.

