using Catalog.API.Data;
using Catalog.API.Entities;
using MongoDB.Driver;

namespace Catalog.API.Repositories
{
    public class ProductCommandRepository : IProductCommandRepository
    {
        private readonly IContext _context;

        public ProductCommandRepository(IContext context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public async Task CreateAsync(Product product, CancellationToken cancellationToken = default)
        {
            await _context.Products.InsertOneAsync(product, cancellationToken: cancellationToken);
        }

        public async Task<bool> DeleteAsync(Guid id, CancellationToken cancellationToken = default)
        {
            DeleteResult result = await _context.Products.DeleteOneAsync(x => x.Id == id, cancellationToken);

            return result.IsAcknowledged && result.DeletedCount > 0;
        }

        public async Task<bool> UpdateAsync(Product product, CancellationToken cancellationToken = default)
        {
            ReplaceOneResult result = await _context.Products.ReplaceOneAsync(x => x.Id == product.Id, product, cancellationToken: cancellationToken);

            return result.IsAcknowledged && result.ModifiedCount > 0;
        }
    }
}
