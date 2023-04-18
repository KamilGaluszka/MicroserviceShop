using Catalog.API.Entities;
using MongoDB.Driver;

namespace Catalog.API.Data
{
    public interface IContext
    {
        IMongoCollection<Product> Products { get; }
    }
}
