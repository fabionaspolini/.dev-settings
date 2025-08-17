# Path
if [ -d ~/.dotnet/tools ]; then
    export PATH="$PATH:~/.dotnet/tools"
fi

# .net
export DOTNET_CLI_UI_LANGUAGE=en

# Android workload build
export AcceptAndroidSDKLicenses=True
export AndroidSdkDirectory=/home/Android/Sdk/
export JavaSdkDirectory=/lib/jvm/jdk-21.0.8+9/
