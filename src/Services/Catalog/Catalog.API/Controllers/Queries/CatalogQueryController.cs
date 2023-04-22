using Catalog.API.Entities;
using Catalog.API.Repositories;
using Microsoft.AspNetCore.Mvc;
using System.Net;

namespace Catalog.API.Controllers.Queries
{
    [ApiController]
    [ApiVersion("1.0")]
    [Route("api/v{version:apiVersion}/catalog")]
    public class CatalogQueryController : ControllerBase
    {
        /// <summary>
        /// Get all products
        /// </summary>
        /// <param name="productQueryRepository"></param>
        /// <param name="cancellationToken"></param>
        /// <returns>List of all products</returns>
        [HttpGet("products")]
        [ProducesResponseType(typeof(List<Product>), (int)HttpStatusCode.OK)]
        public async Task<ActionResult<List<Product>>> GetAllAsync([FromServices] IProductQueryRepository productQueryRepository, CancellationToken cancellationToken)
        {
            return Ok(await productQueryRepository.GetAllAsync(cancellationToken));
        }

        /// <summary>
        /// Get product by id
        /// </summary>
        /// <param name="id"></param>
        /// <param name="productQueryRepository"></param>
        /// <param name="cancellationToken"></param>
        /// <returns>Product with given id</returns>
        [HttpGet("product/{id}")]
        [ProducesResponseType(typeof(Product), (int)HttpStatusCode.OK)]
        public async Task<ActionResult<Product>> GetByIdAsync([FromRoute] Guid id, [FromServices] IProductQueryRepository productQueryRepository, CancellationToken cancellationToken)
        {
            return Ok(await productQueryRepository.GetByIdAsync(id, cancellationToken));
        }

        /// <summary>
        /// Get product by name
        /// </summary>
        /// <param name="name"></param>
        /// <param name="productQueryRepository"></param>
        /// <param name="cancellationToken"></param>
        /// <returns>Product with given name</returns>
        [HttpGet("product/name/{name}")]
        [ProducesResponseType(typeof(Product), (int)HttpStatusCode.OK)]
        public async Task<ActionResult<Product>> GetByNameAsync([FromRoute] string name, [FromServices] IProductQueryRepository productQueryRepository, CancellationToken cancellationToken)
        {
            return Ok(await productQueryRepository.GetByNameAsync(name, cancellationToken));
        }

        /// <summary>
        /// Get product by category
        /// </summary>
        /// <param name="category"></param>
        /// <param name="productQueryRepository"></param>
        /// <param name="cancellationToken"></param>
        /// <returns>Product with given name</returns>
        [HttpGet("product/category/{category}")]
        [ProducesResponseType(typeof(Product), (int)HttpStatusCode.OK)]
        public async Task<ActionResult<Product>> GetByCategoryAsync([FromRoute] string category, [FromServices] IProductQueryRepository productQueryRepository, CancellationToken cancellationToken)
        {
            return Ok(await productQueryRepository.GetByCategoryAsync(category, cancellationToken));
        }
    }
}
