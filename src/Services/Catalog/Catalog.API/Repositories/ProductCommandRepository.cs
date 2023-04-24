using Catalog.API.Data;
using Catalog.API.Entities;
using Catalog.API.Exceptions;
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
            ArgumentNullException.ThrowIfNull(product);
            Product result = await _context.Products.Find(x => x.Id == product.Id).FirstOrDefaultAsync(cancellationToken);
            if (result is not null)
            {
                throw new EntityExistException(typeof(Product), product.Id);
            }

            await _context.Products.InsertOneAsync(product, cancellationToken: cancellationToken);
        }

        public async Task DeleteAsync(Guid id, CancellationToken cancellationToken = default)
        {
            DeleteResult result = await _context.Products.DeleteOneAsync(x => x.Id == id, cancellationToken);

            if (!result.IsAcknowledged || result.DeletedCount == 0)
            {
                throw new EntityNotFoundException(typeof(Product), id);
            }
        }

        public async Task UpdateAsync(Product product, CancellationToken cancellationToken = default)
        {
            ReplaceOneResult result = await _context.Products.ReplaceOneAsync(x => x.Id == product.Id, product, cancellationToken: cancellationToken);

            if (!result.IsAcknowledged || result.MatchedCount == 0)
            {
                throw new EntityNotFoundException(typeof(Product), product.Id);
            }
        }
    }
}
