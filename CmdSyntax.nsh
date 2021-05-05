#!/usr/bin/env csxshell

using System.Net.Http;
using System.Text.Json;

// Variables can easily be created from a command's stdout
if (string.IsNullOrWhiteSpace(`echo hello`))
{
    echo oh no!
}

// By default the type is a string
var ps=`ps aux`;
Console.WriteLine("Result is a "+ps.GetType().Name+" should be a string");
Console.WriteLine("LastLine = " + ps.Trim().Split(Environment.NewLine).Last());

// But you can also easily convert to other types like an int
int aNumber=`/bin/echo 500`;
Console.WriteLine("Result is a "+aNumber.GetType().Name+" "+aNumber+" should be an int with value 500");

// StdOut representing a file path can be converted to a file or directory
FileInfo file = `/bin/echo /bin/ls`;
var exists = file.Exists ? "Exists" : "Doesn't exist";

// You can pass variables into cmds like this
echo File $exists$

DirectoryInfo dir = `/bin/echo /bin/`;
var dirExists = dir.Exists ? "Exists" : "Doesn't exist";
var result = `echo $dirExists$`;
Console.WriteLine("Directory " + result);

// Or a stream
Stream stream = `cat CmdSyntax.csxx`;
Console.WriteLine("Result is a "+stream.GetType().Name);

char x = (char) stream.ReadByte();

Console.WriteLine("First char of stream = " + x + " should be #");

// Maybe you have a web request which returns JSON, you can quickly make that a
// object

public class IPInfo
{
    public string ip { get; set; }
}

using (var client = new HttpClient())
using (var response = await client.GetAsync("https://ip.seeip.org/jsonip?"))
using (var content = response.Content)
{
    var obj = JsonSerializer.Deserialize<IPInfo>(await content.ReadAsStringAsync());
    Console.WriteLine(obj.ip);
}
