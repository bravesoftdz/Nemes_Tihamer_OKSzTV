program NEVEK;
{ $Define DBG}

function ceil(n: Extended): Integer;
begin
  Result:=round(n);
  if Result<n then
    Result:=Result+1;
end;

function get(name: String=''): Integer;
begin
  {$IfDef DBG}write(name, ' :');{$EndIf}
  Read(Result);
end;

function get(name: Integer): Integer;
begin
  {$IfDef DBG}write('#', name, ' :');{$EndIf}
  Read(Result);
end;

function gets(name: Integer): String;
begin
  {$IfDef DBG}write('#', name, ' :');{$EndIf}
  repeat
    ReadLn(Result);
  until Result<>'';
end;

procedure return(name: String; value: Integer);
begin
  {$IfDef DBG}write(name, ' :');{$EndIf}
  WriteLn(value);
end;

procedure return(name: String; value: String);
begin
  {$IfDef DBG}write(name, ' :');{$EndIf}
  WriteLn(value);
end;

var
  r: array of String;
  was: Boolean;
  i, j, k, maxl, N: Integer;
begin
  SetLength(r, get('Hany nev'));
  //N:=ceil(Length(r)/get('Sorok'));
  N:=get('Sorok');
  for i:=Low(r) to High(r) do
  begin
    r[i]:=gets(i+1);
    if Length(r[i])>maxl then
      maxl:=Length(r[i]);
  end;

  (*
  for i:=Low(r) to High(r) do
  begin
    j:=j+1;
    Write(r[i]);
    for k:=0 to maxl-Length(r[i]) do
      Write(' ');
    if j=N then
    begin
      WriteLn;
      j:=0;
    end;
  end;
  *)
  for i:=0 to N-1 do
  begin
    j:=0;
    while j<Length(r) do
    begin
      if (j mod N)=i then
      begin
        Write(r[j]);
        for k:=0 to maxl-Length(r[j]) do
          Write(' ');
      end;
      j:=j+1;
    end;
    WriteLn();
  end;

end.

