program SZAMREN;
{$Define DBG}

procedure dbg(name: String=''; value: Integer=-1);
begin
  {$IfDef DBG}
    if name<>'' then
      Write(name, ': ');
    if value<>-1 then
      Write(value);
    WriteLn();
  {$EndIf}
end;

var i, j, k, N, o, rN, cnt: Integer;
    s: String;
const asc: array[0..9] of char=('0', '1', '2', '3', '4', '5', '6', '7', '8', '9');

function CtoInteger(C: Char): Integer;
const asc: array[0..9] of char=('0', '1', '2', '3', '4', '5', '6', '7', '8', '9');
begin
  for Result:=Low(asc) to High(asc) do
    if asc[Result]=C then Break;
end;

function hatv(n: Integer; kitevo: Integer=1): Integer;
var i: Integer;
begin
  Result:=1;
  for i:=1 to kitevo do
    Result:=Result*n;
end;

function strtoint(s: String; sr: Integer=10): Integer;
var i: Integer;
begin
  Result:=0;
  for i:=1 to Length(s) do
  begin
    Result:=Result+CtoInteger(s[i])*hatv(sr, (Length(s)+1)-i-1);
  end;
end;

function gets(name: String): String;
begin
  {$IfDef DBG}
    if name<>'' then
      Write(name, ': ');
  {$EndIf}
  repeat
    ReadLn(Result);
  until Result<>'';
end;

function get(name: String): Integer;
begin
  {$IfDef DBG}
    if name<>'' then
      Write(name, ': ');
  {$EndIf}
  Read(Result);
end;

begin
  N:=get('Szam');
  rN:=round(sqrt(N));
  for i:=2 to N+1 do
  begin
    s:='';
    for j:=1 to rN do
    begin
      o:=N;
      for k:=1 to i do
      begin
        cnt:=0;
        if o>=hatv(i, rN-j) then
        begin
          o:=o-hatv(i, rN-j);
          inc(cnt);
        end;
        s:=s+asc[cnt];
      end;
    end;
    dbg(s, i);
  end;
end.

