uses
  sysutils, math;
  
type
  EInvalidData=class(Exception);

function get(name: String=''; minv: Integer=0; maxv: Integer=MaxInt): Integer;
begin
  {$IfDef DBG}if name<>'' then Write(name+': ');{$EndIf}
  Read(Result);
  if (Result<minv) or (Result>maxv) then raise EInvalidData.Create('"'+name+'" is not in range '+IntToStr(minv)+'-'+IntToStr(maxv)+'.');
end;

function get(name: String=''): String;
begin
  {$IfDef DBG}if name<>'' then Write(name+': ');{$EndIf}
  Read(Result);
end;

var
  i, j, N: Integer;
