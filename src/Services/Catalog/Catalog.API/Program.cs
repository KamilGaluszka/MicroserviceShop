using Catalog.API.Bootstrappers;
using Catalog.API.Extensions;
using Catalog.API.Middlewares;
using Microsoft.AspNetCore.Mvc;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddApiVersioning(config =>
{
    config.DefaultApiVersion = new ApiVersion(1, 0);
    config.AssumeDefaultVersionWhenUnspecified = true;
    config.ReportApiVersions = true;
    config.UseApiBehavior = false;
});
builder.Services.AddConfiguredSwagger();
builder.Services.SetupConfiguration(builder.Configuration);
builder.Services.RegisterDependencies();

var app = builder.Build();

app.UseConfiguredSwagger();

app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.UseMiddleware<ErrorHandlingMiddleware>();

app.Run();
