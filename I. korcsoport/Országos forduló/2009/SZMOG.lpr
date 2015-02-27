program SZMOG;
{ $Define DBG}

function get(name: String=''): Integer;
begin
  {$IfDef DBG}write(name, ' :');{$EndIf}
  Read(Result);
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
  A: record //max
    id: Integer;
    value: Integer;
  end;
  B: record //javítások
    cnt: Integer;
  end;
  C: record //riadók
    r: array of Integer;
  end;

  r: array of Integer;
  was: Boolean;
  i, j: Integer;

begin
  SetLength(r, get('Napok szama'));
  for i:=0 TO Length(r)-1 do
  begin
    r[i]:=get('Szmog');
    if r[i]>A.value then
    begin
      A.id:=i+1;
      A.value:=r[i];
    end;

    if i<>0 then
      if (r[i-1]=0) and (r[i]<>0) then
        Inc(B.cnt);

    if r[i]>100 then
    begin
      if not was then
        begin
          SetLength(C.r, Length(C.r)+1);
          C.r[Length(C.r)-1]:=i+1;
        end;
      was:=True;
    end
    else was:=False;
  end;

  return('max', A.id);
  return('jav', B.cnt);
  for i:=Low(C.r) to High(C.r) do
    Write(C.r[i], ' ');
end.

