FROM mcr.microsoft.com/dotnet/aspnet:3.1 AS base
WORKDIR /app
EXPOSE 5023
ENV ASPNETCORE_URLS=http://+:5023
COPY Beanstalk /app/ .
ENTRYPOINT ["dotnet", "SimpleWebAppMVC.dll"]
