using Catalog.API.Configuration;
using Catalog.API.Data;
using Catalog.API.Repositories;
using Microsoft.Extensions.Options;
using MongoDB.Driver;

namespace Catalog.API.Bootstrappers
{
    public static class Bootstrapper
    {
        public static void RegisterDependencies(this IServiceCollection services)
        {
            RegisterClients(services);
            RegisterServices(services);            
        }

        private static void RegisterClients(IServiceCollection services)
        {
            services.AddScoped<IMongoClient, MongoClient>((x) =>
            {
                IOptions<MongoDbConfiguration> mongoDb = x.GetRequiredService<IOptions<MongoDbConfiguration>>();
                return new MongoClient(mongoDb.Value.ConnectionString);
            });
        }

        private static void RegisterServices(IServiceCollection services)
        {
            services.AddScoped<IContext, Context>();
            services.AddScoped<IProductQueryRepository, ProductQueryRepository>();
            services.AddScoped<IProductCommandRepository, ProductCommandRepository>();
        }
    }
}
