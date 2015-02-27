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

var i, j, k, N: Integer;
    s: String;

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
  dbg('AsInt', strtoint(s))
  for i:=2 to strtoint(s)+1 do
  begin
    N:=0;

    j:=1 to Length(s) do
      N:=N+;
  end;
end.

