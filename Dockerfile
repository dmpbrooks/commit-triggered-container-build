FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build-env

WORKDIR /app
EXPOSE 80
COPY . .

RUN dir

RUN dotnet restore

COPY . ./
RUN dotnet publish -c Release -o out

FROM mcr.microsoft.com/dotnet/aspnet
WORKDIR /app
COPY --from=build-env /app/out .
ENTRYPOINT [ "dotnet", "TestWeb.dll"]

