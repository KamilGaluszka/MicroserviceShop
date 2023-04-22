using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerGen;

namespace Catalog.API.Filters
{
    public class RemoveApiVersionFilter : IOperationFilter
    {
        public void Apply(OpenApiOperation operation, OperationFilterContext context)
        {
            IList<OpenApiParameter> parameters = operation.Parameters;
            OpenApiParameter versionParameter = parameters.FirstOrDefault(x => x.Name == "version");
            if (versionParameter != null)
            {
                parameters.Remove(versionParameter);
            }
        }
    }
}
