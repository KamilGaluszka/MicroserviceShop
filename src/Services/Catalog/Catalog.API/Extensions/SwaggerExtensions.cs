using Catalog.API.Filters;
using Microsoft.OpenApi.Models;

namespace Catalog.API.Extensions
{
    public static class SwaggerExtensions
    {
        public static void AddConfiguredSwagger(this IServiceCollection services)
        {
            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new OpenApiInfo { Title = "Catalog API - V1", Version = "v1" });
            });
            services.ConfigureSwaggerGen(c =>
            {
                c.OperationFilter<RemoveApiVersionFilter>();
                c.DocumentFilter<SetApiVersionFilter>();
            });
        }

        public static void UseConfiguredSwagger(this IApplicationBuilder app)
        {
            app.UseSwagger();
            app.UseSwaggerUI(options =>
            {
                options.SwaggerEndpoint("/swagger/v1/swagger.json", "V1");
            });
        }
    }
}
