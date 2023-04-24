namespace Catalog.API
{
    public class JsonResponse
    {
        public string Message { get; init; }

        public JsonResponse(string message)
        {
            Message = message;
        }
    }
}
