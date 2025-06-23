alias dotnet-clear-nuget-cache="dotnet nuget locals --clear all"

# Path
if [ -d ~/.dotnet/tools ]; then
    export PATH="$PATH:~/.dotnet/tools"
fi