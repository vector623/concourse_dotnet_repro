#!make

reproduce-error:
		fly -t concourseci e -c run_dotnet_test.yml -i repo=.
