program idojaras;

{$mode objfpc}{$H+}
{$Define DBG}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes
  { you can add units after this }, sysutils, math;

{$Include base.inc}

var
  h: array of record
    min, max: Integer;
  end;
  A, B: record
    f, t: Integer; //from and to
  end;
  C: record
    r: String;//array of Integer;
    avg: float;
  end;

begin
  SetLength(h, get('Napok szama', 2, 100));
  WriteLn();
  for i:=0 to Length(h)-1 do
  begin
    h[i].min:=get('h#'+IntToStr(i+1)+'/min', -MaxInt);
    h[i].max:=get('h#'+IntToStr(i+1)+'/max', -MaxInt);
    C.avg:=C.avg+h[i].min+h[i].max;
    WriteLn();
  end;
  WriteLn();

  C.avg:=C.avg/(Length(h)*2);
  for i:=0 to Length(h)-1 do
  begin
    j:=i;
    while h[j].max<0 do
      Inc(j);
    if (j-i)>(A.t-A.f) then
    begin
      A.f:=i+1;
      A.t:=j;
    end;

    if h[i].min>C.avg then C.r:=C.r+IntToStr(i+1)+' ';
  end;

  for i:=1 to Length(h)-1 do
  begin
    if abs(max(h[i-1  ].max, h[i    ].max)-min(h[i-1  ].min, h[i    ].min))>
       abs(max(h[B.f-1].max, h[B.t-1].max)-min(h[B.f-1].min, h[B.t-1].min)) then
    begin
      B.f:=i;
      B.t:=i+1;
    end;
  end;

  WriteLn('Folyamatos fagy:    ', A.f, '-', A.t);
  WriteLn('Legnagyobb valtozas:', B.f, '-', B.t);
  WriteLn('Atlag folotti napok:', C.r);
  ReadLn;
end.

