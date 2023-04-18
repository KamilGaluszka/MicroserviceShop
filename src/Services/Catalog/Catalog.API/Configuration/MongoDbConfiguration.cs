namespace Catalog.API.Configuration
{
    public class MongoDbConfiguration
    {
        public const string MongoDb = "MongoDb";

        public string ConnectionString { get; set; }
        public string DatabaseName { get; set; }
        public string CollectionName { get; set; }
    }
}