type
  EInvalidData=class(Exception);
  TArrayOfInteger_implode=String;

function get(name: String=''; minv: Integer=0; maxv: Integer=MaxInt): Integer;
begin
  {$IfDef DBG}if name<>'' then Write(name+': ');{$EndIf}
  Read(Result);
  if (Result<minv) or (Result>maxv) then raise EInvalidData.Create('"'+name+'" is not in range '+IntToStr(minv)+'-'+IntToStr(maxv)+'.');
end;

function gets(name: String=''): String;
begin
  {$IfDef DBG}if name<>'' then Write(name+': ');{$EndIf}
  ReadLn(Result);
end;

procedure return(name: String; value: String; part: Char=#0);
begin
  {$IfDef DBG}if part<>#0 then Write('#', part, ': ');{$EndIf}
  {$IfDef DBG}if name<>'' then Write(name, ': ');{$EndIf}
  WriteLn(value);
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

var
  i, j, N: Integer;
