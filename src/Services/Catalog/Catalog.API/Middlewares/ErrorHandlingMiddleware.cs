using Catalog.API.Exceptions;
using System.Net;
using System.Text.Json;

namespace Catalog.API.Middlewares
{
    public class ErrorHandlingMiddleware
    {
        private readonly RequestDelegate _next;
        private readonly ILogger<ErrorHandlingMiddleware> _log;

        public ErrorHandlingMiddleware(RequestDelegate next, ILogger<ErrorHandlingMiddleware> log)
        {
            _next = next;
            _log = log;
        }

        public async Task Invoke(HttpContext context)
        {
            try
            {
                await _next(context);
            }
            catch(ArgumentException ex)
            {
                _log.LogInformation(ex, "{Message}", ex.Message);
                await WriteAsJsonAsync(context, ex, HttpStatusCode.BadRequest);
            }
            catch (EntityExistException ex)
            {
                _log.LogInformation(ex, "{Message}", ex.Message);
                await WriteAsJsonAsync(context, ex, HttpStatusCode.BadRequest);
            }
            catch (EntityNotFoundException ex)
            {
                _log.LogInformation(ex, "{Message}", ex.Message);
                await WriteAsJsonAsync(context, ex, HttpStatusCode.NotFound);
            }
            catch(Exception ex)
            {
                _log.LogError(ex, "{Message}", ex.Message);
                await WriteAsJsonAsync(context, ex, HttpStatusCode.InternalServerError);
            }
        }

        private static async Task WriteAsJsonAsync(HttpContext context, Exception ex, HttpStatusCode statusCode, CancellationToken cancellationToken = default)
        {
            context.Response.StatusCode = (int)statusCode;
            context.Response.ContentType = "application/json";
            JsonResponse jsonResponse = new(ex.Message);
            await context.Response.WriteAsync(JsonSerializer.Serialize(jsonResponse), cancellationToken);
        }
    }
}
