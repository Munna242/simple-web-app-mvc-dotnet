FROM mcr.microsoft.com/dotnet/aspnet:3.1
WORKDIR /app
EXPOSE 5023
ENV ASPNETCORE_URLS=http://+:5023
COPY naveen /app/ .
ENTRYPOINT ["dotnet", "SimpleWebAppMVC.dll"]
