# Readme

Repo to demonstrate errors executing dotnet core tests in Councourse CI

## To reproduce error

Clone repo and run following within repo top directory

```bash
# setup concourseci target
fly -t concourseci login -c <concourse instance>

# execute dotnet test job
fly -t concourseci e -c run_dotnet_test.yml -i repo=.

# to run .net core tests locally (need dotnet-sdk-2.2 or later installed)
dotnet test
```

## Error output

Resulting error

```
nodev@xounges.net:~/gits/tmp/concourse_dotnet_repro git:(master)
> fly -t concourseci e -c run_dotnet_test.yml -i repo=.
uploading repo done
executing build 108 at http://localhost:8080/builds/108
initializing
running sh -exc cd repo
uname -a
dotnet --info
dotnet test
+ cd repo
+ uname -a
Linux 13d31566-d994-4042-549e-a686b3e26171 5.0.0-1026-gcp #27~18.04.1-Ubuntu SMP Fri Nov 15 07:40:39 UTC 2019 x86_64 GNU/Linux
+ dotnet --info
.NET Core SDK (reflecting any global.json):
 Version:   3.1.100
 Commit:    cd82f021f4

Runtime Environment:
 OS Name:     debian
 OS Version:  10
 OS Platform: Linux
 RID:         debian.10-x64
 Base Path:   /usr/share/dotnet/sdk/3.1.100/

Host (useful for support):
  Version: 3.1.0
  Commit:  65f04fb6db

.NET Core SDKs installed:
  3.1.100 [/usr/share/dotnet/sdk]

.NET Core runtimes installed:
  Microsoft.AspNetCore.App 3.1.0 [/usr/share/dotnet/shared/Microsoft.AspNetCore.App]
  Microsoft.NETCore.App 3.1.0 [/usr/share/dotnet/shared/Microsoft.NETCore.App]

To install additional .NET Core runtimes or SDKs:
  https://aka.ms/dotnet-download
+ dotnet test
/usr/share/dotnet/sdk/3.1.100/Roslyn/Microsoft.CSharp.Core.targets(59,5): error MSB6004: The specified task executable location "/rootfs/usr/share/dotnet/dotnet" is invalid. [/tmp/build/e55deab7/repo/PrimeService/PrimeService.csproj]
failed
```

# Original source

Code cribbed from Microsoft's public dotnet samples repo:

<https://github.com/dotnet/samples/tree/master/core/getting-started/unit-testing-using-dotnet-test>

