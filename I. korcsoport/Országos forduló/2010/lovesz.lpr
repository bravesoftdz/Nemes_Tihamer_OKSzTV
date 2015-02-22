program lovesz;
{$Define DBG}

uses
  sysutils, strutils;

{$Include base.inc}

var
  eredmenyek: array of Integer;
  A: record //megelőzték
    r: array of Integer;
  end;
  B: record //elsők voltak
    r: TArrayOfInteger_implode;
    max: Integer;
  end;
  C: record //volt utolsó
    r: TArrayOfInteger_implode;
    min: Integer;
  end;
  D: record //nyertes
    max: Integer;
    r: TArrayOfInteger_implode;
  end;

begin
  SetLength(eredmenyek, get('Versenyzok szama', 1, 1000));
  SetLength(A.r, Length(eredmenyek));
  for i:=0 to Length(eredmenyek)-1 do
  begin
    eredmenyek[i]:=get('L#'+IntToStr(i+1));
    if i=1-1 then C.min:=eredmenyek[i];

    //A
    for j:=0 to i-1 do
    begin
      if eredmenyek[j]>eredmenyek[i] then begin
        Inc(A.r[i]);
        {$IfDef DBG}return('megelozte', IntToStr(j+1), 'A'){$EndIf}
      end;
    end;

    //B
    if eredmenyek[i]>=B.max then
    begin
      B.r:=B.r+' '+IntToStr(i+1);
      B.max:=eredmenyek[i];
      {$IfDef DBG}return('volt elso', '[]', 'B'){$EndIf}
    end;

    //C
    if eredmenyek[i]<=C.min then
    begin
      C.r:=C.r+' '+IntToStr(i+1);
      C.min:=eredmenyek[i];
      {$IfDef DBG}return('volt utso', '[]', 'C'){$EndIf}
    end;

    //D
    if eredmenyek[i]>D.max then
    begin
      D.r:=' '+IntToStr(eredmenyek[i]);
      D.max:=eredmenyek[i];
      {$IfDef DBG}return('nyert', '[]', 'D'){$EndIf}
    end
    else if eredmenyek[i]=D.max then
    begin
      D.r:=D.r+' '+IntToStr(i+1);
    end;
  end;

  returna('Jobb eredmeny', A.r, 'A');
  returna('Elso volt', B.r, 'B');
  returna('Utso volt', C.r, 'C');
  returna('Nyertes', D.r, 'D');

  while gets('Kilépés[q]')<>'q' do
    Sleep(0);
end.

