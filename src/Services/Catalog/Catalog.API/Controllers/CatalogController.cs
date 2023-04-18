using Catalog.API.Entities;
using Catalog.API.Repositories;
using Microsoft.AspNetCore.Mvc;
using System.Net;

namespace Catalog.API.Controllers
{
    [ApiController]
    [ApiVersion("1.0")]
    [Route("api/v{version:apiVersion}/[controller]")]
    public class CatalogController : ControllerBase
    {
        /// <summary>
        /// Get all products
        /// </summary>
        /// <param name="productQueryRepository"></param>
        /// <param name="cancellationToken"></param>
        /// <returns>List of all products</returns>
        [HttpGet("products")]
        [MapToApiVersion("1.0")]
        [ProducesResponseType(typeof(List<Product>), (int)HttpStatusCode.OK)]
        public async Task<ActionResult<List<Product>>> GetAllAsync([FromServices] IProductQueryRepository productQueryRepository, CancellationToken cancellationToken)
        {
            return Ok(await productQueryRepository.GetAllAsync(cancellationToken));
        }
    }
}
