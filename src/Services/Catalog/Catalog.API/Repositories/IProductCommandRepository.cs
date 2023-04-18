using Catalog.API.Entities;

namespace Catalog.API.Repositories
{
    public interface IProductCommandRepository
    {
        Task CreateAsync(Product product, CancellationToken cancellationToken = default);
        Task<bool> DeleteAsync(Guid id, CancellationToken cancellationToken = default);
        Task<bool> UpdateAsync(Product product, CancellationToken cancellationToken = default); 
    }
}
