FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS base
WORKDIR /app
EXPOSE 5023
ENV ASPNETCORE_URLS=http://+:5023

WORKDIR /app
COPY Beanstalk /app/publish .
ENTRYPOINT ["dotnet", "SimpleWebAppMVC.dll"]
