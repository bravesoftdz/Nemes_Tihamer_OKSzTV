program verseny;
{$Define DBG}

uses
  sysutils, strutils, math;
{$Include base.inc}

var p{oints}, s{orszamok}: Array of Integer;
    M: Integer;

function getPoints: Integer;
var p: array of Integer;
    i, j: Integer;
begin
  Result:=0;
  SetLength(p, M);
  for i:=0 to M-1 do
  begin
    p[i]:=get('', 0);
    Result:=Result+p[i];
  end;
  dbg('Pontok', IntToStr(Result));
  Result:=Result-maxvalue(p)-minvalue(p);
  dbg('Levonva', IntToStr(Result))
end;

begin
  SetLength(p, get('Resztvevok', 0));
  SetLength(s, Length(p));
  M:=get('Zsuri tagjai', 0);
  for i:=0 to Length(p)-1 do
  begin
    p[i]:=getPoints;
    s[i]:=i;
  end;

  for i:=1 to Length(p)-1 do
  begin
    for j:=1 to Length(p)-1 do
    begin
      if p[i-1]<p[i] then
      begin
        N:=p[i];
        p[i]:=p[i-1];
        p[i-1]:=N;
        N:=s[i];
        s[i]:=s[i-1];
        s[i-1]:=N;
      end;
    end;
  end;

  for i:=0 to Length(p)-1 do
  begin
    return(IntToStr(s[i]+1), IntToStr(p[i]));
  end;
end.

