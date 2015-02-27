type
  EInvalidData=class(Exception);
  TArrayOfInteger_implode=String;

function get(name: String=''; minv: Integer=0; maxv: Integer=MaxInt): Integer;
begin
  {$IfDef DBG}if name<>'' then Write(name+': ');{$EndIf}
  Read(Result);
  if (Result<minv) or (Result>maxv) then raise EInvalidData.Create('"'+name+'" is not in range '+IntToStr(minv)+'-'+IntToStr(maxv)+'.');
end;

function gets(name: String=''; minl: Integer=1; maxl: Integer=255): String;
begin
  {$IfDef DBG}if name<>'' then Write(name+': ');{$EndIf}
  if maxl>255 then SetLength(Result, maxl);
  repeat
    ReadLn(Result);
  until Length(Result)>=minl;
  if (Length(Result)<minl) or (Length(Result)>maxl) then
    Raise EInvalidData.Create('"'+name+'" has unallowed length: '+IntToStr(Length(Result))+' ('+IntToStr(minl)+'-'+IntToStr(maxl)+')');
end;

procedure return(name: String; value: String; part: Char=#0);
begin
  {$IfDef DBG}if part<>#0 then Write('#', part, ': ');{$EndIf}
  {$IfDef DBG}if name<>'' then Write(name, ': ');{$EndIf}
  WriteLn(value);
end;

procedure dbg(name: String; value: String);
begin
  {$IfDef DBG}return(name, value);{$EndIf}
end;

procedure returna(name: String; value: TArrayOfInteger_implode; part: Char=#0);
var s: String;
begin
  if Length(value)>0 then
  begin
    s:=Copy(value, 2, Length(value)-1);
  end else s:='-';
  return(name, s, part);
end;

procedure returna(name: String; value: array of Integer; part: Char=#0);
var i: Integer;
    s: TArrayOfInteger_implode;
begin
  for i:=0 to Length(value)-1 do
    s:=s+' '+IntToStr(value[i]);
  returna(name, s, part);
end;

function nextChar(var s: String): Char;
begin
  Result:=s[1];
  s:=Copy(s, 2, Length(s)-1);
end;

function nextWord(var s: String): String;
begin
  while (Length(s)>0) and (s[1]=' ') do
    nextChar(s);

  while (Length(s)>0) and (s[1]<>' ') do
    Result:=Result+nextChar(s);
end;

var
  i, j, N: Integer;
