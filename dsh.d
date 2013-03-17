module dsh;

import std.stdio;
import std.uni;
import std.file;

string normalize(string inStr)
{
  string res = inStr;
  while (res[$-1].isWhite())
    res = res[0..$-1];
  while (res[0].isWhite())
    res = res[1..$];
  return res;
}

int main(string[] params)
{
  char[] buf;
  
  write("> ");
  while (readln(buf)) {
    auto command = normalize(cast(immutable)buf);

    if (command == "ls") {
      foreach (string ent; dirEntries(".", SpanMode.shallow))
        writeln(ent);
    }
    
    write("> ");
  }
  return 0;
}