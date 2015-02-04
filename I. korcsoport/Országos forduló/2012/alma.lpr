program alma;

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
  T, K: Array of record
    name: String;
    count: Integer;
  end;
  jj: Integer;

begin
  SetLength(T, get('Termelo fajtai szama', 1, 100));
  WriteLn;
  for i:=0 to Length(T)-1 do
  begin
    T[i].name:=gets('T#'+IntToStr(i)+' neve ');
    T[i].count:=get('T#'+IntToStr(i)+' darab');
    WriteLn;
  end;
  WriteLn;

  SetLength(K, get('Kereskedo fajtai szama', 1, 100));
  WriteLn;
  for i:=0 to Length(K)-1 do
  begin
    K[i].name:=gets('K#'+IntToStr(i)+' neve ');
    K[i].count:=get('K#'+IntToStr(i)+' darab');
    WriteLn;
  end;
  WriteLn;

  for i:=0 to Length(K)-1 do
  begin
    for j:=0 to length(T)-1 do
      if T[j].name=K[i].name then
        jj:=j;
    N:=min(T[i].count, K[i].count);
    T[i].count:=T[i].count-N;
    K[i].count:=N;
  end;

  for i:=0 to Length(T)-1 do
  begin
    writeln('T#'+IntToStr(i)+' neve ', T[i].name);
    writeln('T#'+IntToStr(i)+' darab', T[i].count);
    WriteLn;
  end;
  WriteLn;

  for i:=0 to Length(K)-1 do
  begin
    writeln('K#'+IntToStr(i)+' neve ', K[i].name);
    writeln('K#'+IntToStr(i)+' darab', K[i].count);
    WriteLn;
  end;
  WriteLn;
end.

