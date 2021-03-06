program OF1;

procedure union_of_files(var f1,f2,f3: file of real; name1,name2,name3: string);
var
  a1,a2: real;
begin
  assign(f1,name1);
  assign(f2,name2);
  assign(f3,name3);
  reset(f1);
  reset(f2);
  rewrite(f3);
  read(f1,a1);
  read(f2,a2);
  while (not eof(f1)) or (not eof(f2)) do
  begin
    if (a1<a2) then
    begin
      if not eof(f1) then read(f1,a1);
    end 
    else
    begin
      if (a1>a2) then
      begin
        if not eof(f2) then read(f2,a2);
      end
      else
      begin
        write(f3,a1);
        if not eof(f1) then read(f1,a1);
        if not eof(f2) then read(f2,a2);
      end;
    end;
  end;
  if (a1=a2) then write(f3,a1);
  close(f1);
  close(f2);
end;

var 
  f1,f2,f3: file of real;
  name1,name2,name3: string;

begin
  write('Enter the file name of the first file: ');
  readln(name1);
  write('Enter the file name of the second file: ');
  readln(name2);
  write('Enter the file name of the output file: ');
  readln(name2);
  union_of_files(f1,f2,f3,name1,name2,name3);
end.