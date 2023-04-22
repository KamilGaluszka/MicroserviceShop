using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerGen;

namespace Catalog.API.Filters
{
    public class SetApiVersionFilter : IDocumentFilter
    {
        public void Apply(OpenApiDocument swaggerDoc, DocumentFilterContext context)
        {
            OpenApiPaths paths = swaggerDoc.Paths;
            OpenApiPaths openPaths = new();
            foreach (KeyValuePair<string, OpenApiPathItem> pathPair in paths)
            {
                string key = pathPair.Key.Replace("v{version}", swaggerDoc.Info.Version);
                openPaths.Add(key, pathPair.Value);
            }

            swaggerDoc.Paths = openPaths;
        }
    }
}
