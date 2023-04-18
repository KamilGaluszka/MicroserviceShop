using Catalog.API.Entities;

namespace Catalog.API.Repositories
{
    public interface IProductQueryRepository
    {
        Task<List<Product>> GetAllAsync(CancellationToken cancellationToken = default);
        Task<Product> GetByIdAsync(Guid id, CancellationToken cancellationToken = default);
        Task<List<Product>> GetByNameAsync(string name, CancellationToken cancellationToken = default);
        Task<List<Product>> GetByCategoryAsync(string category, CancellationToken cancellationToken = default);
    }
}
