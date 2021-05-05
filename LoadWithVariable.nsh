#!/usr/bin/env dotnet-shell

// This script shows that you can pass paramters into #load
// As #load executes the script in the current context the Args
// value is 'passed through' and can also been configured 

Args.Add("Hello");
var script = "NugetLoad_ParseArguments.nsh";
#load $script$
