#!/usr/bin/env dotnet-shell
#r "nuget: Figgle, 0.4.0"

// This script prints any command line arguments in ASCII art 

// Script arguments are stored in Args List
Console.WriteLine("Number of arguments = " + Args.Count() );

foreach (var arg in Args)
{
    Console.WriteLine(Figgle.FiggleFonts.Standard.Render(arg));
}
