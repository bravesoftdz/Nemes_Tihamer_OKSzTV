program TUKOR;

var s: String;
    b: array of String;

var i, j, k: Integer;
    was: Boolean;

const
  b2: array[1..7] of String=('cs', 'dz', 'gy', 'ly', 'ny', 'sz', 'zs');
  b3: array[1..8] of String=('ccs', 'ddz', 'dzs', 'ggy', 'lly', 'nny', 'ssz', 'zzs');

begin
  ReadLn(s);
  i:=1;
  while i<=Length(s) do
  begin
    was:=False;

    for j:=Low(b3) to High(b3) do
    begin
      if (i<=Length(s)-2) and (s[i]=b3[j, 1]) and (s[i+1]=b3[j, 2]) and (s[i+2]=b3[j, 3]) and (not was) then
      begin
        SetLength(b, Length(b)+1);
        b[High(b)]:=b3[j];
        inc(i, 2);
        was:=True;
      end;
    end;

    for j:=Low(b2) to High(b2) do
    begin
      if (i<=Length(s)-1) and (s[i]=b2[j, 1]) and (s[i+1]=b2[j, 2]) and (not was) then
      begin
        SetLength(b, Length(b)+1);
        b[High(b)]:=b2[j];
        inc(i);
        was:=True;
      end;
    end;

    if (i<=Length(s)-1) and (s[i+1]=s[i]) and (not was) then
    begin
      SetLength(b, Length(b)+1);
      b[High(b)]:=s[i]+s[i];
      inc(i);
      was:=True;
    end;

    if not was then
    begin
      SetLength(b, Length(b)+1);
      b[High(b)]:=s[i];
      was:=True;
    end;
    Inc(i);
  end;

  for i:=Low(b) to High(b) do
    Write(b[High(b)-i]);
  WriteLn;

end.

