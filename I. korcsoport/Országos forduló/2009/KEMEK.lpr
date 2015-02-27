program KEMEK;
{ $Define DBG}

function get(name: String=''): Integer;
begin
  {$IfDef DBG}write(name, ' :');{$EndIf}
  Read(Result);
end;

function get(name: Integer): Integer;
begin
  {$IfDef DBG}write('#', name, ' :');{$EndIf}
  Read(Result);
end;

function gets(name: String=''): String;
begin
  {$IfDef DBG}write(name, ' :');{$EndIf}
  Read(Result);
end;

function gets(name: Integer): String;
begin
  {$IfDef DBG}write('#', name, ' :');{$EndIf}
  Read(Result);
end;

procedure return(name: String; value: Integer);
begin
  {$IfDef DBG}write(name, ' :');{$EndIf}
  WriteLn(value);
end;

procedure return(name: String; value: String);
begin
  {$IfDef DBG}write(name, ' :');{$EndIf}
  WriteLn(value);
end;

type
  TR=array of record
    parent, child: Integer
  end;

  TC=record
    parent, child, cnt:  Integer;
  end;

var
  r: TR;
  was: Boolean;
  i, j, k, f, childcnt, parentcnt, N: Integer;
  B: record
    parentcnt: Integer;
    parent: Integer;
  end;
  Cm: TC;

//C-max length
(*
function C(f: Integer; var r: TR): TC;
var res: TC;
begin
  Result.parent:=f;
  Result.child:=0;
  Result.cnt:=0;
  {$IfDef DBG}WriteLn('?', Result.parent, ':', Result.child, '=', Result.cnt);{$EndIf}
  for i:=low(r) to high(r) do
  begin
    if r[i].parent=Result.parent then
    begin
      res:=C(r[i].child, r);
      Inc(res.cnt);
      res.parent:=r[i].parent;
      res.child:=r[i].child;
      if res.cnt>Result.cnt then
      begin
        Result:=res;
        {$IfDef DBG}WriteLn(' ', Res.parent, ':', Res.child, '=', Res.cnt);{$EndIf}
      end;
    end;
  end;
  {$IfDef DBG}WriteLn('-', Result.parent, ':', Result.child, '=', Result.cnt);{$EndIf}
end;
*)

function C(f: Integer; var r: TR; const cnt: Integer=0): TC;
var res: TC;
begin
  Result.parent:=f;
  Result.child:=0;
  Result.cnt:=cnt;
  {$IfDef DBG}WriteLn('?', Result.parent, ':', Result.child, '=', Result.cnt);{$EndIf}
  for i:=low(r) to high(r) do
  begin
    if r[i].parent=Result.parent then
    begin
      res:=C(r[i].child, r, cnt+1);
      if res.cnt>Result.cnt then
      begin
        Result:=res;
        {$IfDef DBG}WriteLn('>', Res.parent, ':', Res.child, '=', Res.cnt);{$EndIf}
      end;
    end;
  end;
  {$IfDef DBG}WriteLn('-', Result.parent, ':', Result.child, '=', Result.cnt);{$EndIf}
end;

begin
  SetLength(r, get('Letszam')-1);
  for i:=Low(r) to High(r) do
  begin
    r[i].child:=get(i+1);
    r[i].parent:=get(i+1);
  end;


  for i:=1 to 100 do
  begin
    childcnt:=0;
    parentcnt:=0;
    for j:=Low(r) to High(r) do
    begin
      if r[j].child=i then
        Inc(childcnt);
      if r[j].parent=i then
        Inc(parentcnt);
    end;
    //A-fonok
    if (parentcnt<>0) and (childcnt=0) then
    begin
      return('fonok', i);
      f:=i;
    end;
    //B-max child
    if parentcnt>B.parentcnt then
    begin
      B.parentcnt:=parentcnt;
      B.parent:=i;
    end;
  end;

  //B
  return('max child', B.parent);

  //C
  Cm:=C(f, r);
  return('max length', Cm.parent);
end.

