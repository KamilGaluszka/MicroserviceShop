using Catalog.API.Configuration;
using Catalog.API.Entities;
using Catalog.API.Mappings;
using Microsoft.Extensions.Options;
using MongoDB.Driver;

namespace Catalog.API.Data
{
    public class Context : IContext
    {
        public IMongoCollection<Product> Products { get; }

        public Context(IMongoClient client, IOptions<MongoDbConfiguration> configuration)
        {
            IMongoDatabase database = client.GetDatabase(configuration.Value.DatabaseName);
            Products = database.GetCollection<Product>(configuration.Value.CollectionName);
            Map(Products);
        }

        private static void Map(IMongoCollection<Product> products)
        {
            ProductMapping.Map(products);
        }
    }
}
