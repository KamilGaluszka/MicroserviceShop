using Catalog.API.Data;
using Catalog.API.Entities;
using MongoDB.Driver;

namespace Catalog.API.Repositories
{
    public class ProductQueryRepository : IProductQueryRepository
    {
        private readonly IContext _context;

        public ProductQueryRepository(IContext context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }

        public async Task<List<Product>> GetAllAsync(CancellationToken cancellationToken = default)
        {
            return await _context.Products.Find(x => true).ToListAsync(cancellationToken);
        }

        public async Task<Product> GetByIdAsync(Guid id, CancellationToken cancellationToken = default)
        {
            return await _context.Products.Find(x => x.Id == id).FirstOrDefaultAsync(cancellationToken);
        }

        public async Task<List<Product>> GetByNameAsync(string name, CancellationToken cancellationToken = default)
        {
            return await _context.Products.Find(x => x.Name.Equals(name)).ToListAsync(cancellationToken);
        }

        public async Task<List<Product>> GetByCategoryAsync(string category, CancellationToken cancellationToken = default)
        {
            return await _context.Products.Find(x => x.Category.Equals(category)).ToListAsync(cancellationToken);
        }
    }
}
