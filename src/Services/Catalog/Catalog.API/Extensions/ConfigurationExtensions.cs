using Catalog.API.Configuration;

namespace Catalog.API.Extensions
{
    public static class ConfigurationExtensions
    {
        public static IServiceCollection SetupConfiguration(
             this IServiceCollection services, IConfiguration configuration)
        {
            services.Configure<MongoDbConfiguration>(configuration.GetSection(MongoDbConfiguration.MongoDb));

            return services;
        }
    }
}
