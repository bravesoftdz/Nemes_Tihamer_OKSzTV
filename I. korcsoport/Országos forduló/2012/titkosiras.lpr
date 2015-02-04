program titkosiras;

{$mode objfpc}{$H+}
{$Define DBG}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, sysutils, math;

{$Include base.inc}

const
  tbl: array[0..2] of array[0..8] of Char=(
    ('i', 'o', 'q', 'h', 'b', 'f', 'y', 'l', 'w'),
    ('n', 'r', 'a', 'g', 's', 'k', 't', 'e', 'z'),
    ('d', 'u', 'p', 'x', 'c', 'j', 'v', 'm',  #0)
  );
  hx: array[0..2] of Char=('a', 'b', 'c');
  hy: array[0..8] of Char=('a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i');

var
  s, r: String;
  k, x, y: Integer;

begin
  s:=gets('Input');
  WriteLn(Length(s));
  case gets('code[c]/decode[d]') of
    'c', 'code':
      begin
        for k:=1 to Length(s) do
        begin
          for i:=0 to 2 do
          for j:=0 to 8 do
            if s[k]=tbl[i, j] then
            begin
              x:=i;
              y:=j;
            end;
          Write(hx[x]);
          Write(hy[y]);
        end;
      end;
    'd', 'decode':
      begin
        for k:=1 to round(Length(s)/2) do
        begin
          for i:=0 to 2 do
            if s[k*2-1]=hx[i] then x:=i;
          for j:=0 to 8 do
            if s[k*2]  =hy[j] then y:=j;
          Write(tbl[x, y]);
        end;
      end;
  end;
  ReadLn;
end.

