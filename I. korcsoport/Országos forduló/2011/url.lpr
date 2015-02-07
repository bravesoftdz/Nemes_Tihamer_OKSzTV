program url;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Classes, sysutils
  { you can add units after this };

type
  EBadUrl=Class(Exception);

{$i base.inc}

var
  u: String;

const
  specialChars: array[1..6] of WideChar=(' ', '<', '>', '=', '.', #2026(*'…'*));

function starts(s: String; del: Boolean=True; err: String=''): Boolean;
var i: Integer;
begin
  if err='' then err:='Szükséges a "'+s+'" a végére!';
  Result:=Copy(u, 1, Length(s))=s;
  if Result and del then
    u:=Copy(u, Length(s)+1, Length(u)-Length(s))
  else
    if Length(u)=0 then
      raise EBadUrl.Create(err);
end;

begin
  u:=gets('url');
  N:=Length(u);
  if starts('http') then // https://www.google.com/alma/b.html
  begin
    starts('s');         //     s://www.google.com/alma/b.html
    if not starts('://') then // ://www.google.com/alma/b.html
      raise EBadUrl.Create('Szükséges a protokoll és az (al)domain elválasztása!')
  end;
  while not starts('/') do
  begin
    for i:=Low(specialChars) to High(specialChars) do
      if u[1]=specialChars[i] then
        raise EBadUrl.Create('Innentől rossz: '+u+'(offset #'+IntToStr(N-Length(u))+')');
    u:=Copy(u, 2, Length(u)-1);
  end;

  while Length(u)>0 do
  begin
    for i:=Low(specialChars) to High(specialChars) do
      if u[1]=specialChars[i] then
        raise EBadUrl.Create('Innentől rossz: '+u+'(offset #'+IntToStr(N-Length(u))+')');
    u:=Copy(u, 2, Length(u)-1);
  end;

  WriteLn('URL hibátlan.');
end.

