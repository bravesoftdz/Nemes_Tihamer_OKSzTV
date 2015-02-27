program MERES;

var i, j, k, l, N: Integer;
    was: Boolean;
    mert: array of Integer;

function theend(arr: array of Integer; from: Integer): Boolean;
begin
  Result:=False;
end;

begin
  Read(N);
  SetLength(mert, N);
  for i:=0 to N-1 do
  begin
    Read(mert[i]);
  end;

  i:=Low(mert);
  j:=i;

  (*
  while i<N-1 do
  begin
    if mert[i]=-1 then
    begin
      while (i<N-1) and (mert[i]=-1) do
        Inc(i);
      k:=mert[i]-mert[i+1];
      for j:=j to i do
        Write(mert[i]+(i-j)*k, ' ');
    end else
    begin
      Write(mert[j], ' ');
    end;
    inc(i);
    Inc(j);
  end;
  *)

  begin
    if mert[i]=-1 then
    begin
      while (i<N-1) and (mert[i]=-1) do
        Inc(i);
      k:=mert[i]-mert[i+1];
      for j:=j to i do
        Write(mert[i]+(i-j)*k, ' ');
    end else
    begin
      Write(mert[j], ' ');
    end;
    inc(i);
    Inc(j);
  end;

  while (i<N-1) and not theend(mert, i)  do
  begin
    if mert[i]=-1 then
    begin
      while (i<N-1) and (mert[i]=-1) do
        Inc(i);
      k:=round((mert[j]-mert[i])/(j-i));
      for j:=j to i do
        Write(mert[i]+(i-j)*k, ' ');
    end else
    begin
      Write(mert[j], ' ');
    end;
    inc(i);
    Inc(j);
  end;
end.

