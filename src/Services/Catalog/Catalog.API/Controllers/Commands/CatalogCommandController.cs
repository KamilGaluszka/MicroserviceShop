using Catalog.API.Entities;
using Catalog.API.Repositories;
using Microsoft.AspNetCore.Mvc;
using System.Net;

namespace Catalog.API.Controllers.Commands
{
    [ApiController]
    [ApiVersion("1.0")]
    [Route("api/v{version:apiVersion}/catalog")]
    public class CatalogCommandController : ControllerBase
    {
        /// <summary>
        /// Add new product
        /// </summary>
        /// <param name="product"></param>
        /// <param name="productCommandRepository"></param>
        /// <param name="cancellationToken"></param>
        /// <returns>Added product</returns>
        [HttpPost("product")]
        [ProducesResponseType(typeof(Product), (int)HttpStatusCode.OK)]
        public async Task<ActionResult<Product>> CreateAsync([FromBody] Product product, [FromServices] IProductCommandRepository productCommandRepository, CancellationToken cancellationToken)
        {
            await productCommandRepository.CreateAsync(product, cancellationToken);
            return Ok(product);
        }

        /// <summary>
        /// Add new product
        /// </summary>
        /// <param name="product"></param>
        /// <param name="productCommandRepository"></param>
        /// <param name="cancellationToken"></param>
        /// <returns>Added product</returns>
        [HttpPut("product")]
        [ProducesResponseType(typeof(Product), (int)HttpStatusCode.OK)]
        public async Task<ActionResult<Product>> UpdateAsync([FromBody] Product product, [FromServices] IProductCommandRepository productCommandRepository, CancellationToken cancellationToken)
        {
            await productCommandRepository.UpdateAsync(product, cancellationToken);
            return Ok(product);
        }

        /// <summary>
        /// Add new product
        /// </summary>
        /// <param name="id"></param>
        /// <param name="productCommandRepository"></param>
        /// <param name="cancellationToken"></param>
        /// <returns>Added product</returns>
        [HttpDelete("product/{id}")]
        [ProducesResponseType(typeof(Product), (int)HttpStatusCode.OK)]
        public async Task<ActionResult<Product>> DeleteAsync([FromRoute] Guid id, [FromServices] IProductCommandRepository productCommandRepository, CancellationToken cancellationToken)
        {
            await productCommandRepository.DeleteAsync(id, cancellationToken);
            return NoContent();
        }
    }
}
