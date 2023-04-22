using Catalog.API.Entities;
using MongoDB.Bson.Serialization;
using MongoDB.Driver;

namespace Catalog.API.Mappings
{
    public static class ProductMapping
    {
        public static void Map()
        {
            BsonClassMap.RegisterClassMap<Product>(cm =>
            {
                cm.SetIdMember(cm.GetMemberMap(x => x.Id));
                cm.AutoMap();
            });
        }
    }
}
