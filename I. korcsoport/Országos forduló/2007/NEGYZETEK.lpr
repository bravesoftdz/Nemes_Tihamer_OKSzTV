program NEGYZETEK;
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

procedure dbg(name: String; value:  Integer);
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

begin
  N:=get('Terulet');
  k:=N;
  for j:=0 to k-1 do
  begin
    i:=k-j;
    while N>=i*i do
    begin
      return('Oszthato', i, N);
      N:=N-i*i;
    end;
  end;
end.

