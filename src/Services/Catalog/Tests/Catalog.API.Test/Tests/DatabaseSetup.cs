using Catalog.API.Configuration;
using Catalog.API.Data;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Options;
using MongoDB.Driver;

namespace Catalog.API.Test.Tests
{
    internal class DatabaseSetup
    {
        private const string APPSETTING_PATH = "testAppsettings.json";

        public IContext Context { get; set; }
        public IMongoClient Client { get; set; }
        public IOptions<MongoDbConfiguration> MongoDb { get; set; }
        public IConfiguration Configuration { get; set; }

        [OneTimeSetUp]
        public void OneTimeSetUp()
        {
            Configuration = new ConfigurationBuilder()
                .AddJsonFile(APPSETTING_PATH)
                .AddEnvironmentVariables()
                .Build();
            MongoDbConfiguration options = Configuration.GetSection(MongoDbConfiguration.MongoDb).Get<MongoDbConfiguration>();
            MongoDb = Options.Create(options);
            Client = new MongoClient(MongoDb.Value.ConnectionString);
            Context = new Context(Client, MongoDb);
        }

        [OneTimeTearDown]
        public void OneTimeTearDown()
        {
            Client.DropDatabase(MongoDb.Value.DatabaseName);
        }
    }
}
