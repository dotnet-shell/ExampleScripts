#!/usr/bin/env dotnet-shell
using static System.Console;

WriteLine("OK to go? Y/N:");
if (ReadLine() == "Y")
{
    echo yay!
}
