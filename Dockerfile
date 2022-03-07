FROM mcr.microsoft.com/dotnet/sdk:3.1 AS build
WORKDIR /src
COPY ["CoffeeService.csproj", "./"]
RUN dotnet restore "CoffeeService.csproj"
COPY . .
WORKDIR "/src/."
RUN dotnet build "SimpleWebAppMVC.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "SimpleWebAppMVC.csproj" -c Release -o /app/publish

FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS base
WORKDIR /app
EXPOSE 5023
ENV ASPNETCORE_URLS=http://+:5023

WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "CoffeeService.dll"]
