SOLUTION=./Tacti-Doom.sln
CSproj=./Tacti-Doom.csproj

restore:
	dotnet restore $(CSproj)

build: restore
	dotnet build $(CSproj) -c Release

run:
	dotnet run --project $(CSproj)

clean:
	dotnet clean $(CSproj)