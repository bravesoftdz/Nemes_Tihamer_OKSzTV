program BUVOS;
{ $Define DBG}

function get(name: String; id: Integer=-1): Integer;
begin
  {$IfDef DBG}
  if name<>'' then
  begin
    if id=-1 then
      Write(name, ': ')
    else
      Write(name, '#', id, ': ');
  end;
  {$EndIf}

  Read(Result);
end;

procedure dbg(name: String=''; value:  Integer=0);
begin
  {$IfDef DBG}WriteLn(name, '=', value);{$EndIf}
end;

procedure return(name: String; value: Integer; id: Integer=-1; line: Boolean=True);
begin
  {$IfDef DBG}
  if name<>'' then
    if id=-1 then
      Write(name, ': ')
    else
      Write(name, '#', id, ': ');
  WriteLn(value);
  {$Else}
  if line then
    WriteLn(value)
  else
    Write(value);
  {$EndIf}
end;

procedure return(name: String; value: String; id: Integer=-1; line: Boolean=True);
begin
  {$IfDef DBG}
  if name='' then
    if id<>-1 then
      Write(name, ': ')
    else
      Write(name, '#', id, ': ');
  WriteLn(value);
  {$Else}
  if line then
    WriteLn(value)
  else
    Write(value);
  {$EndIf}
end;

var
  i, j, k, N: Integer;
  si, sj: array of Integer; sa: Integer; //szumma
  s: array of array of Integer; //számok

begin
  N:=get('Meret');
  SetLength(s, N, N);
  SetLength(si, N);
  SetLength(sj, N);
  for i:=0 to n-1 do
  begin
    for j:=0 to n-1 do
    begin
      s[i, j]:=get('szam', (i+1)*10+(j+1));
      si[i]:=si[i]+s[i, j];
      sj[j]:=sj[j]+s[i, j];
    end;
    dbg;
  end;
  if (si[0]=si[1]) or (si[0]=si[2]) then sa:=si[0]
  else sa:=si[1];

  for i:=0 to n-1 do
  begin
    for j:=0 to n-1 do
    begin
      if (si[i]<>sa) and (sj[j]<>sa) then
      begin
        return('Bad row', i+1);
        return('Bad column', j+1);
        return('Good value', s[i, j]-(si[i]-sa));
      end;
    end;
  end;
end.

