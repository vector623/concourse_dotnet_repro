# Readme

Repo to demonstrate errors executing dotnet core tests in Councourse CI

## To reproduce error

```bash
# setup concourseci target
fly -t concourseci login -c <concourse instance>

# execute dotnet test job
fly -t concourseci e -c run_dotnet_test.yml -i repo=.

# to run .net core tests locally (need dotnet-sdk-2.2 or later installed)
dotnet test
```

# Original source

Code cribbed from Microsoft's public dotnet samples repo:

<https://github.com/dotnet/samples/tree/master/core/getting-started/unit-testing-using-dotnet-test>

