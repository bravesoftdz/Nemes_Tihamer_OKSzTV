program NYELVEK;
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

function gets(name: String; id: Integer=-1): String;
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

  ReadLn(Result);
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
  was: Boolean;
  ca: array of String;c: String; //checkelendő nyelv
  p: array of record
    name: String;
    cnt: Integer;
  end;

begin
  SetLength(p, get('Valaszthato nyelvek'));
  SetLength(ca, get('Ellenorzendo nyelvek'));

  ReadLn(c); //bugfix
  for i:=0 to Length(p)-1 do
  begin
    p[i].name:=gets('possible', i+1);
  end;

  for i:=0 to Length(ca)-1 do
  begin
    ca[i]:=gets('versenyzo', i+1);
  end;

  {$IfDef DBG}Write('Illegal languages: ');{$EndIf}
  for i:=0 to Length(ca)-1 do
  begin
    was:=False;
    c:=ca[i];
    for j:=0 to Length(p)-1 do
    begin
      if p[j].name=c then
      begin
        was:=True;
        Inc(p[j].cnt);
        Break;
      end;
    end;
    if not was then
      Write(i+1, ' ');
  end;
  WriteLn();

  {$IfDef DBG}Write('Not choosed languages: ');{$EndIf}
  for i:=0 to Length(p)-1 do
  begin
    if p[i].cnt=0 then
      Write(p[i].name, {$IfDef DBG}'>', p[i].cnt,{$EndIf} ' ');
  end;
  WriteLn();

  {$IfDef DBG}WriteLn('Choosed languages: ');{$EndIf}
  for i:=0 to Length(p)-1 do
  begin
    if p[i].cnt<>0 then
      WriteLn(p[i].name, { $IfDef DBG}'>', p[i].cnt,{ $EndIf} '');
  end;
  WriteLn();
end.


